package SSIS::Package::DTSTask;

use 5.010;
use Mouse;

use Carp;
use SSIS::Package::DTSTaskConnection;

=head1 NAME

SSIS::Package::DTSTask - Report on SSIS package tasks by Ded MedVed

=head1 VERSION

Version 0.01

=cut

has 'CreationName' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'DTSID' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'DelayValidation' => (
    is  => 'ro'
,   isa => 'Maybe[Bool]'
,   required => 1
);

has 'Description' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'DisableEventHandlers' => (
    is  => 'ro'
,   isa => 'Maybe[Bool]'
,   required => 1
);

has 'Disabled' => (
    is  => 'ro'
,   isa => 'Maybe[Bool]'
,   required => 1
);

has 'ExecValue' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'FailPackageOnFailure' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'FailParentOnFailure' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'ForceExecValue' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'ForceExecutionResult' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'ISOLevel' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'LocaleID' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'MaxErrorCount' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'ObjectName' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'TransactionOption' => (
    is  => 'ro'
,   isa => 'Maybe[Int]'
,   required => 1
);

has 'Connectors' => (
    is  => 'ro'
,   isa => 'ArrayRef[SSIS::Package::DTSTaskConnection]'
,   required => 1
);



__PACKAGE__->meta->make_immutable();


1; 
__DATA__



=head1 SYNOPSIS

Alpha package to report on SSIS packages.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ssis-package-dtstask at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package-DTSTask>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package::DTSTask


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package-DTSTask>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package-DTSTask>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package-DTSTask>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package-DTSTask/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package::DTSTask

