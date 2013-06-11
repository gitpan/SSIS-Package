#!perl -T

use Test::More tests => 47;

BEGIN {

    use_ok( 'SSIS::Package' )                                               || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager' )                            || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManagerFactory' )                     || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::ADONET' )                    || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::EXCEL' )                     || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::FILE' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::FLATFILE' )                  || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::MSMQ' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::OLEDB' )                     || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::SMOServer' )                 || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::SMTP' )                      || print "Bail out!\n";


    use_ok( 'SSIS::Package::DTSTask' )                                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTaskFactory' )                               || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::BulkInsertTask' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::DataProfilingTask' )                   || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::DMQueryTask' )                         || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::ExecutePackageTask2' )                 || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::ExecuteProcess' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::ExecuteSQLTask' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::ExpressionTask' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::FileSystemTask' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::FtpTask' )                             || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::MessageQueueTask' )                    || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::PipeLine2' )                           || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::ScriptTask' )                          || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::SendMailTask' )                        || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::TransferDatabaseTask' )                || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::TransferErrorMessagesTask' )           || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::TransferJobsTask' )                    || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::TransferLoginsTask' )                  || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::TransferSqlServerObjectsTask' )        || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::TransferStoredProceduresTask' )        || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::WebServiceTask' )                      || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::WmiDataReaderTask' )                   || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::WmiEventWatcherTask' )                 || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::XMLTask' )                             || print "Bail out!\n";

    use_ok( 'SSIS::Package::DTSTask::FOREACHLOOP' )                         || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::FORLOOP' )                             || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::SEQUENCE' )                            || print "Bail out!\n";

    use_ok( 'SSIS::Package::DTSTask::ActiveXScriptTask' )                   || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::ASExecuteDDLTask' )                    || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::DTSProcessingTask' )                   || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::EnhancedExecutePackageTask' )          || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::Exec80PackageTask' )                   || print "Bail out!\n";
    use_ok( 'SSIS::Package::DTSTask::SSISSFTTask' )                         || print "Bail out!\n";    
    use_ok( 'SSIS::Package::DTSTask::DbMaintenanceBackupTask' )             || print "Bail out!\n";        
    use_ok( 'SSIS::Package::DTSTask::DbMaintenanceCheckIntegrityTask' )     || print "Bail out!\n";            
    
}

diag( "Testing SSIS::Package $SSIS::Package::VERSION, Perl $], $^X" );
