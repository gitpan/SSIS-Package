package SSIS::Package;

use 5.010;
use Mouse;

use XML::Simple ; #qw(:strict);
#use XML::LibXML;
use XML::CompactTree::XS;
use XML::LibXML::Reader;

use Carp;

=head1 NAME

SSIS::Package - Report on SSIS packages by Ded MedVed

=head1 VERSION

Version 1.00_07

=cut

our $VERSION = '1.00_07';

has 'file' => (
    is  => 'rw'
,   isa => 'Str'
);
has 'parsedssiscode' => (
    is  => 'rw'
);


sub BUILD {
    my ($self) = @_;
} ;

sub parse {

    local $_ ;

    my $self                = shift ;
    my $class               = ref($self) || $self ;
    my $filename            = shift or croak "no filename";
    
    $self->file($filename);
#    my $reader              = XML::LibXML::Reader->new(location => $filename);    
#    my %ns;    
#    $self->{PARSEDSSISCODE} = XML::CompactTree::XS::readSubtreeToPerl( $reader, XCT_KEEP_NS_DECLS |XCT_DOCUMENT_ROOT|XCT_ATTRIBUTE_ARRAY , \%ns );
    $self->parsedssiscode(XMLin($filename,ForceArray => [ 'DTS:Executable'  ]));
    return $self->parsedssiscode() ;
}



__PACKAGE__->meta->make_immutable();


1; 
__DATA__



=head1 SYNOPSIS

Alpha package to determine and list SSIS File connectors and their usage in SSIS packages.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ssis-package at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package
