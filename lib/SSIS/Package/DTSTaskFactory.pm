package SSIS::Package::DTSTaskFactory;

use 5.010;
use Mouse;


use SSIS::Package::DTSTask::BulkInsertTask;
use SSIS::Package::DTSTask::DataProfilingTask;
use SSIS::Package::DTSTask::DMQueryTask;
use SSIS::Package::DTSTask::ExecutePackageTask2;
use SSIS::Package::DTSTask::ExecuteProcess;
use SSIS::Package::DTSTask::ExecuteSQLTask;
use SSIS::Package::DTSTask::ExpressionTask;
use SSIS::Package::DTSTask::FileSystemTask;
use SSIS::Package::DTSTask::FOREACHLOOP;
use SSIS::Package::DTSTask::FORLOOP;
use SSIS::Package::DTSTask::FtpTask;
use SSIS::Package::DTSTask::MessageQueueTask;
use SSIS::Package::DTSTask::PipeLine2;
use SSIS::Package::DTSTask::ScriptTask;
use SSIS::Package::DTSTask::SendMailTask;
use SSIS::Package::DTSTask::SEQUENCE;
use SSIS::Package::DTSTask::TransferDatabaseTask;
use SSIS::Package::DTSTask::TransferErrorMessagesTask;
use SSIS::Package::DTSTask::TransferJobsTask;
use SSIS::Package::DTSTask::TransferLoginsTask;
use SSIS::Package::DTSTask::TransferSqlServerObjectsTask;
use SSIS::Package::DTSTask::TransferStoredProceduresTask;
use SSIS::Package::DTSTask::WebServiceTask;
use SSIS::Package::DTSTask::WmiDataReaderTask;
use SSIS::Package::DTSTask::WmiEventWatcherTask;
use SSIS::Package::DTSTask::XMLTask;

use SSIS::Package::DTSTask::ActiveXScriptTask;
use SSIS::Package::DTSTask::ASExecuteDDLTask;
use SSIS::Package::DTSTask::DTSProcessingTask;
use SSIS::Package::DTSTask::EnhancedExecutePackageTask;
use SSIS::Package::DTSTask::Exec80PackageTask;
use SSIS::Package::DTSTask::SSISSFTTask;
use SSIS::Package::DTSTask::DbMaintenanceBackupTask;
use SSIS::Package::DTSTask::DbMaintenanceCheckIntegrityTask;
use SSIS::Package::DTSTask::DbMaintenanceExecuteAgentJobTask;
use SSIS::Package::DTSTask::DbMaintenanceTSQLExecuteTask;
use SSIS::Package::DTSTask::DbMaintenanceHistoryCleanupTask;
use SSIS::Package::DTSTask::DbMaintenanceFileCleanupTask;
use SSIS::Package::DTSTask::DbMaintenanceNotifyOperatorTask;
use SSIS::Package::DTSTask::DbMaintenanceReindexTask;
use SSIS::Package::DTSTask::DbMaintenanceDefragmentIndexTask;
use SSIS::Package::DTSTask::DbMaintenanceShrinkTask;
use SSIS::Package::DTSTask::DbMaintenanceUpdateStatisticsTask;

use XML::Simple ; #qw(:strict);
#use XML::LibXML;
use XML::CompactTree::XS;
use XML::LibXML::Reader;

use Data::Dumper;
use Data::Printer;

use Carp;

=head1 NAME

SSIS::Package::DTSTaskFactory - Factory class for SSIS package DTS tasks by Ded MedVed

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';



use autodie qw(:all);

#TODO 0. 

sub make {

    my ($self) = shift;
    croak 'Invalid call' unless defined $self;
 
#    my $xml = $_[0] ;
#warn Dumper $xml;   
    my $rh_args = $_[0];

#my $obj = SSIS::Package::DTSTaskFactory->make( { type => $x->{'DTS:ExecutableType'}, properties =>  $x->{'DTS:Property'} );

    
#    my @type    = grep { $_->{'DTS:Name'} eq 'CreationName' }  @{$xml->{'DTS:Property'}};
#    my @name    = grep { $_->{'DTS:Name'} eq 'ObjectName' }    @{$xml->{'DTS:Property'}};
  
#    my @type    = grep { exists $$_{'DTS:Property'} } grep { ref($_) eq 'HASH' }  @{$xml};  
    
    my $task ;
#    my $objType = $type[0]->{content};
#    my $name    = $name[0]->{content};

    my $objType = $rh_args->{type} ;
#    my @name    = grep { $_->{'DTS:Name'} eq 'ObjectName' }    @{$rh_args->{properties}};    
#    my $name    = $name[0]->{content};

#warn Dumper $objType;
#warn Dumper $name;

   
    if ( $objType =~ m{\A Microsoft\.SqlServer\.Dts\.Tasks\.(\w+) }xmisg ) {
        $objType  =  $1;
    }
    if ( $objType =~ m{\A Microsoft\.DataTransformationServices\.Tasks\.DTSProcessingTask\.(\w+) }xmisg ) {
        $objType  =  $1;
    }
    if ( $objType =~ m{\A Microsoft\.SqlServer\.Management\.DatabaseMaintenance\.(\w+) }xmisg ) {
        $objType  =  $1;
    }
    if ( $objType =~ m{\A \w+\.SSIS\.ControlFlow\.(\w+) }xmisg ) {
        $objType  =  $1;
    }
    if ( $objType =~ m{\A SSISSFTPTask100\.SSIS\.(\w+) }xmisg ) {
        $objType  =  $1;
    }
    
    if ( $objType eq 'STOCK:SEQUENCE' ) {
        $objType = "SEQUENCE" ; 
    }
    if ( $objType eq 'STOCK:FOREACHLOOP' ) {
        $objType = "FOREACHLOOP" ; 
    }
    if ( $objType eq 'STOCK:FORLOOP' ) {
        $objType = "FORLOOP" ; 
    }
    if ( $objType eq 'SSIS.Pipeline.2' ) {
        $objType = "PipeLine2" ; 
    }
    if ( $objType eq 'SSIS.ExecutePackageTask.2' ) {
        $objType = "ExecutePackageTask2" ; 
    }


    my @valrefs = map { ( $_->{'DTS:Name'},$_->{'content'} ) ;} @{$rh_args->{properties}}; #@{$x->{'DTS:Property'}};

#warn Dumper $objType ;
#    $task = "SSIS::Package::DTSTask::${objType}"->new( { 'Name' => $name } );    
#warn Dumper @valrefs;
    $task = "SSIS::Package::DTSTask::${objType}"->new( { (@valrefs) }  );    
    
    #if ($objType =~ m{\A(ADONET|EXCEL|FILE|FLATFILE|MSMQ|OLEDB|SMOServer|SMTP)\z} ) {
#            my @connstr = grep { $_->{'DTS:Name'} eq 'ConnectionString' }  @{$xml->{'DTS:ObjectData'}->{'DTS:ConnectionManager'}->{'DTS:Property'}};
#            my $connstr = $connstr[0]->{content};
#            my @name    = grep { $_->{'DTS:Name'} eq 'ObjectName' }        @{$xml->{'DTS:Property'}};
#            my $name    = $name[0]->{content};
##warn Dumper $connstr, $name ;
#    
#        if ($objType eq "ADONET" ) {
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "EXCEL" ) {
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "FILE" ) {
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "FLATFILE" ) {
##warn Dumper $xml;
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "MSMQ" ) {
##warn Dumper $xml;
#            $connstr        = $xml->{'DTS:ObjectData'}->{'MsmqConnectionManager'}->{'ConnectionString'};
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "OLEDB" ) {
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "SMOServer" ) {
##warn Dumper $xml;        
#            $connstr        = $xml->{'DTS:ObjectData'}->{'SMOServerConnectionManager'}->{'ConnectionString'};
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#        if ($objType eq "SMTP" ) {
#            $connstr        = $xml->{'DTS:ObjectData'}->{'SmtpConnectionManager'}->{'ConnectionString'};
#            $connectManager = "SSIS::Package::ConnectionManager::${objType}"->new( { 'Name' => $name, 'ConnectionString' => $connstr } );    
#        }
#    }
#    else {
#        croak "Unknown connection type $objType.";
#    }
    
    return $task ;


}



1 ;

__DATA__



=head1 SYNOPSIS

Alpha package to determine and list SSIS File connectors and their usage in SSIS packages.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ssis-package-connectionmanager at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package-DTSTaskFactory>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package::DTSTaskFactory


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package-DTSTaskFactory>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package-DTSTaskFactory>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package-DTSTaskFactory>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package-DTSTaskFactory/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package::DTSTaskFactory

