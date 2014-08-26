package SSIS::Package::DTSTask::TransferStoredProceduresTask;

use 5.010;
use Mouse;

extends 'SSIS::Package::DTSTask';

=head1 NAME

SSIS::Package::DTSTask::TransferStoredProceduresTask - SSIS package task TransferStoredProceduresTask by Ded MedVed

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

1; # End of SSIS::Package::DTSTask::TransferStoredProceduresTask

