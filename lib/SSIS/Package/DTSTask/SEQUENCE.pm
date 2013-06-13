package SSIS::Package::DTSTask::SEQUENCE;

use 5.010;
use Mouse;

extends 'SSIS::Package::DTSTask';

=head1 NAME

SSIS::Package::DTSTask::SEQUENCE - SSIS package task SEQUENCE by Ded MedVed

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has 'LockName' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);


1 ;

__DATA__

1; # End of SSIS::Package::DTSTask::SEQUENCE

