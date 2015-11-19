package Paws::Net::Caller {
  use Moose;
  use Carp qw(croak);
  with 'Paws::Net::CallerRole';
  use Paws::API::Retry;

  has debug              => ( is => 'rw', required => 0, default => sub { 0 } );
  has ua => (is => 'rw', required => 1, lazy => 1,
    default     => sub {
        use HTTP::Tiny;
        HTTP::Tiny->new(
          agent => 'AWS Perl SDK ' . $Paws::VERSION,
          timeout => 60,
        );
    }
  );

  sub is_retriable {
    my ($self, $exception) = @_;
    1;
  }

  sub do_call {
    my ($self, $service, $call_object) = @_;

    my $requestObj = $service->prepare_request_for_call($call_object); 

    my $headers = $requestObj->header_hash;
    # HTTP::Tiny derives the Host header from the URL. It's an error to set it.
    delete $headers->{Host};

    my $tracker = Paws::API::Retry->new(
      %{ $service->retry }, 
      max_tries => $service->max_attempts
    );

    while (not $tracker->return and $tracker->can_retry) {
      $tracker->one_more_try;

      my $response = $self->ua->request(
        $requestObj->method,
        $requestObj->url,
        {
          headers => $headers,
          (defined $requestObj->content)?(content => $requestObj->content):(),
        }
      );

      if ($response->{status} == 599){
        $tracker->error_for_die(Paws::Exception->new(message => $response->{content}, code => 'ConnectionError', request_id => ''));
      } else {
        my $res = $service->handle_response($call_object, $response->{status}, $response->{content}, $response->{headers});
        if (not ref($res)){
          $tracker->return($res);
        } elsif ($res->isa('Paws::Exception')) {
          $tracker->error_for_die($res);
        } else {
          $tracker->return($res);
        }
      }
    }

    if (defined $tracker->return){
      return $tracker->return;
    } else {
      $tracker->error_for_die->throw;
    }
  }
}

1;
