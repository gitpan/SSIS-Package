package SSIS::Package::DTSTask::Exec80PackageTask;

use 5.010;
use Mouse;

extends 'SSIS::Package::DTSTask';

=head1 NAME

SSIS::Package::DTSTask::Exec80PackageTask - SSIS package task Exec80PackageTask by Ded MedVed

=head1 VERSION

Version 0.01

=cut

#our $VERSION = '0.01';

has 'ExecutionAddress' => (
    is  => 'ro'
,   isa => 'Maybe[Num]'
,   required => 1
);

has 'ExecutionLocation' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'TaskContact' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);




1 ;

__DATA__

1; # End of SSIS::Package::DTSTask::Exec80PackageTask

