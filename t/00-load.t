#!perl -T

use Test::More tests => 5;

BEGIN {

    use_ok( 'SSIS::Package' )                                   || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager' )                || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::FLATFILE' )      || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::OLEDB' )         || print "Bail out!\n";
    use_ok( 'SSIS::Package::ConnectionManager::ADONET' )        || print "Bail out!\n";
    


}

diag( "Testing SSIS::Package $SSIS::Package::VERSION, Perl $], $^X" );
