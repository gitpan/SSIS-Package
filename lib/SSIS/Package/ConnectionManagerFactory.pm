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
use SSIS::Package::ConnectionManager::ADO;
use SSIS::Package::ConnectionManager::MSOLAP100;
use SSIS::Package::ConnectionManager::CACHE;
use SSIS::Package::ConnectionManager::FTP;
use SSIS::Package::ConnectionManager::HTTP;
use SSIS::Package::ConnectionManager::MULTIFLATFILE;
use SSIS::Package::ConnectionManager::MULTIFILE;
use SSIS::Package::ConnectionManager::ODBC;
use SSIS::Package::ConnectionManager::WMI;
use SSIS::Package::ConnectionManager::SQLMOBILE;


use XML::Simple ; #qw(:strict);

use Data::Dumper;
use Data::Printer;

use Carp;

=head1 NAME

SSIS::Package::ConnectionManagerFactory - Factory class for SSIS package connection managers by Ded MedVed

=head1 VERSION

Version 0.01

=cut


use autodie qw(:all);

#TODO 0. 

sub make {

    my ($self) = shift;
    croak 'Invalid call' unless defined $self;
 
    my $rh_args         = $_[0];
    my $objType         = $rh_args->{type} ;
    my $objectData      = $rh_args->{objectData} ;

    # fix up crappy invalid character in .net name;
    if ($objType =~ m{ \A ADO\.NET}x )  { $objType = "ADONET" } ;
    
    my $connectManager;
 
    if ($objType =~ m{\A (ADO|ADONET|CACHE|EXCEL|FILE|FTP|FLATFILE|HTTP|MSMQ|MSOLAP100|MULTIFILE|MULTIFLATFILE|ODBC|OLEDB|SMOServer|SMTP|SQLMOBILE|WMI) \z}x ) {

        my @connstr;
        my $connstr;
        my @name;
        my $name;

        if ($objType eq 'FTP' ) {
            @connstr = grep { $_->{'DTS:Name'} eq 'ConnectionString' }  @{$objectData->{'DTS:ConnectionManager'}->{'DTS:FtpConnection'}->{'DTS:Property'}};
            $connstr = $connstr[0]->{content};
        }
        elsif ($objType eq 'HTTP' ) {
            @connstr = grep { $_->{'DTS:Name'} eq 'ConnectionString' }  @{$objectData->{'DTS:ConnectionManager'}->{'DTS:HttpConnection'}->{'DTS:Property'}};
            $connstr = $connstr[0]->{content};
        }
        elsif ($objType eq 'WMI' ) {
            $connstr = $objectData->{'WmiConnectionManager'}->{'ConnectionString'};
        }
        elsif ($objType eq "MSMQ" ) {
            $connstr        = $objectData->{'MsmqConnectionManager'}->{'ConnectionString'};
        }
        elsif ($objType eq "SMOServer" ) {
            $connstr        = $objectData->{'SMOServerConnectionManager'}->{'ConnectionString'};
        }
        elsif ($objType eq "SMTP" ) {
            $connstr        = $objectData->{'SmtpConnectionManager'}->{'ConnectionString'};
        }
        else {
            if ( ref($objectData->{'DTS:ConnectionManager'}->{'DTS:Property'}) eq 'ARRAY' ) {
                @connstr = grep { $_->{'DTS:Name'} eq 'ConnectionString' }  @{$objectData->{'DTS:ConnectionManager'}->{'DTS:Property'}};
                $connstr = $connstr[0]->{content};
            } 
            else {
                $connstr = $objectData->{'DTS:ConnectionManager'}->{'DTS:Property'}->{content};
            }
        }

        my @valrefs = map { ( $_->{'DTS:Name'},$_->{'content'} ) ;} @{$rh_args->{properties}}; 
        
        # add connection string
        push @valrefs, 'ConnectionString' , $connstr ;

        $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { (@valrefs) } );    

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

