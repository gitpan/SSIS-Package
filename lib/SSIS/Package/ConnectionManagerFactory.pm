package SSIS::Package::ConnectionManagerFactory;

use 5.010;
use Mouse;

use SSIS::Package::ConnectionManager::ADONET;
use SSIS::Package::ConnectionManager::EXCEL;
use SSIS::Package::ConnectionManager::FILE;
use SSIS::Package::ConnectionManager::FLATFILE;
use SSIS::Package::ConnectionManager::MSMQ;
use SSIS::Package::ConnectionManager::OLEDB;
use SSIS::Package::ConnectionManager::SMOServer;
use SSIS::Package::ConnectionManager::SMTP;


use XML::Simple ; #qw(:strict);
#use XML::LibXML;
use XML::CompactTree::XS;
use XML::LibXML::Reader;

use Data::Dumper;
use Data::Printer;

use Carp;

=head1 NAME

SSIS::Package::ConnectionManagerFactory - Factory class for SSIS package connection managers by Ded MedVed

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';



use autodie qw(:all);

#TODO 0. 

sub make {

    my ($self) = shift;
    croak 'Invalid call' unless defined $self;
 
    my $xml = $_[0] ;
#warn Dumper $xml;    
    my @type = grep { $_->{'DTS:Name'} eq 'CreationName' }  @{$xml->{'DTS:Property'}};
#warn Dumper @type;
    
    my $connectManager ;
    my $objType = $type[0]->{content};
    
    # fix up crappy invalid character in .net name;
    if ($objType =~ m{ \A ADO\.NET}x )  { $objType = "ADONET" } ;
    
    if ($objType =~ m{\A(ADONET|EXCEL|FILE|FLATFILE|MSMQ|OLEDB|SMOServer|SMTP)\z} ) {
            my @connstr = grep { $_->{'DTS:Name'} eq 'ConnectionString' }  @{$xml->{'DTS:ObjectData'}->{'DTS:ConnectionManager'}->{'DTS:Property'}};
            my $connstr = $connstr[0]->{content};
            my @name    = grep { $_->{'DTS:Name'} eq 'ObjectName' }        @{$xml->{'DTS:Property'}};
            my $name    = $name[0]->{content};
#warn Dumper $connstr, $name ;
    
        if ($objType eq "ADONET" ) {
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "EXCEL" ) {
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "FILE" ) {
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "FLATFILE" ) {
#warn Dumper $xml;
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "MSMQ" ) {
#warn Dumper $xml;
            $connstr        = $xml->{'DTS:ObjectData'}->{'MsmqConnectionManager'}->{'ConnectionString'};
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "OLEDB" ) {
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "SMOServer" ) {
#warn Dumper $xml;        
            $connstr        = $xml->{'DTS:ObjectData'}->{'SMOServerConnectionManager'}->{'ConnectionString'};
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
        if ($objType eq "SMTP" ) {
            $connstr        = $xml->{'DTS:ObjectData'}->{'SmtpConnectionManager'}->{'ConnectionString'};
            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
        }
    }
    else {
        croak "Unknown connection type $objType.";
    }
    
    return $connectManager ;


}



1 ;

__DATA__



=head1 SYNOPSIS

Alpha package to determine and list SSIS File connectors and their usage in SSIS packages.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ssis-package-connectionmanagerfactory at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package-ConnectionManagerFactory>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package::ConnectionManagerFactory


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package-ConnectionManagerFactory>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package-ConnectionManagerFactory>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package-ConnectionManagerFactory>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package-ConnectionManagerFactory/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package::ConnectionManagerFactory

