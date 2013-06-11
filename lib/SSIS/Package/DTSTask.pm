package SSIS::Package::DTSTask;

use 5.010;
use Mouse;

use Carp;

=head1 NAME

SSIS::Package::DTSTask - Report on SSIS package tasks by Ded MedVed

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has 'Name' => (
    is  => 'ro'
,   isa => 'Str'
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

