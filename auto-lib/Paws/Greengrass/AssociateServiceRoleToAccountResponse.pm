
package Paws::Greengrass::AssociateServiceRoleToAccountResponse;
  use Moose;
  has AssociatedAt => (is => 'ro', isa => 'Str');

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Greengrass::AssociateServiceRoleToAccountResponse

=head1 ATTRIBUTES


=head2 AssociatedAt => Str

Time when the service role was associated to the account.


=head2 _request_id => Str


=cut

