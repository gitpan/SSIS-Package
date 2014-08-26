package SSIS::Package::DTSTask::FORLOOP;

use 5.010;
use Mouse;

extends 'SSIS::Package::DTSTask';

=head1 NAME

SSIS::Package::DTSTask::FORLOOP - SSIS package task FORLOOP by Ded MedVed

=head1 VERSION

Version 0.01

=cut

#our $VERSION = '0.01';

has 'AssignExpression' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'EvalExpression' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'InitExpression' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'MaxConcurrent' => (
    is  => 'ro'
,   isa => 'Num'
,   required => 1
);






1 ;

__DATA__

1; # End of SSIS::Package::DTSTask::FORLOOP

