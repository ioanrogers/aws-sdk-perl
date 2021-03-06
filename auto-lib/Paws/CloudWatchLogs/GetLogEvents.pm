
package Paws::CloudWatchLogs::GetLogEvents;
  use Moose;
  has EndTime => (is => 'ro', isa => 'Int', traits => ['NameInRequest'], request_name => 'endTime' );
  has Limit => (is => 'ro', isa => 'Int', traits => ['NameInRequest'], request_name => 'limit' );
  has LogGroupName => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'logGroupName' , required => 1);
  has LogStreamName => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'logStreamName' , required => 1);
  has NextToken => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'nextToken' );
  has StartFromHead => (is => 'ro', isa => 'Bool', traits => ['NameInRequest'], request_name => 'startFromHead' );
  has StartTime => (is => 'ro', isa => 'Int', traits => ['NameInRequest'], request_name => 'startTime' );

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'GetLogEvents');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::CloudWatchLogs::GetLogEventsResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::CloudWatchLogs::GetLogEvents - Arguments for method GetLogEvents on Paws::CloudWatchLogs

=head1 DESCRIPTION

This class represents the parameters used for calling the method GetLogEvents on the 
Amazon CloudWatch Logs service. Use the attributes of this class
as arguments to method GetLogEvents.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to GetLogEvents.

As an example:

  $service_obj->GetLogEvents(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 EndTime => Int

The end of the time range, expressed as the number of milliseconds
after Jan 1, 1970 00:00:00 UTC. Events with a time stamp later than
this time are not included.



=head2 Limit => Int

The maximum number of log events returned. If you don't specify a
value, the maximum is as many log events as can fit in a response size
of 1 MB, up to 10,000 log events.



=head2 B<REQUIRED> LogGroupName => Str

The name of the log group.



=head2 B<REQUIRED> LogStreamName => Str

The name of the log stream.



=head2 NextToken => Str

The token for the next set of items to return. (You received this token
from a previous call.)



=head2 StartFromHead => Bool

If the value is true, the earliest log events are returned first. If
the value is false, the latest log events are returned first. The
default value is false.



=head2 StartTime => Int

The start of the time range, expressed as the number of milliseconds
after Jan 1, 1970 00:00:00 UTC. Events with a time stamp earlier than
this time are not included.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method GetLogEvents in L<Paws::CloudWatchLogs>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

