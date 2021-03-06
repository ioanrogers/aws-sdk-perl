
package Paws::ServiceCatalog::DescribeRecord;
  use Moose;
  has AcceptLanguage => (is => 'ro', isa => 'Str');
  has Id => (is => 'ro', isa => 'Str', required => 1);
  has PageSize => (is => 'ro', isa => 'Int');
  has PageToken => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeRecord');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::ServiceCatalog::DescribeRecordOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::ServiceCatalog::DescribeRecord - Arguments for method DescribeRecord on Paws::ServiceCatalog

=head1 DESCRIPTION

This class represents the parameters used for calling the method DescribeRecord on the 
AWS Service Catalog service. Use the attributes of this class
as arguments to method DescribeRecord.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to DescribeRecord.

As an example:

  $service_obj->DescribeRecord(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 AcceptLanguage => Str

The language code.

=over

=item *

C<en> - English (default)

=item *

C<jp> - Japanese

=item *

C<zh> - Chinese

=back




=head2 B<REQUIRED> Id => Str

The record identifier of the ProvisionedProduct object for which to
retrieve output information. This is the C<RecordDetail.RecordId>
obtained from the request operation's response.



=head2 PageSize => Int

The maximum number of items to return in the results. If more results
exist than fit in the specified C<PageSize>, the value of
C<NextPageToken> in the response is non-null.



=head2 PageToken => Str

The page token of the first page retrieved. If null, this retrieves the
first page of size C<PageSize>.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method DescribeRecord in L<Paws::ServiceCatalog>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

