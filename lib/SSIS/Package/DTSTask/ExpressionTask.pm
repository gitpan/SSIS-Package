has 'TaskContact' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);


package SSIS::Package::DTSTask::ExpressionTask;

use 5.010;
use Mouse;

extends 'SSIS::Package::DTSTask';

=head1 NAME

SSIS::Package::DTSTask::ExpressionTask - SSIS package task ExpressionTask by Ded MedVed

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';



1 ;

__DATA__

1; # End of SSIS::Package::DTSTask::ExpressionTask

