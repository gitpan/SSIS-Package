package SSIS::Package::DTSTaskConnection;

use 5.010;
use Mouse;

use Carp;

=head1 NAME

SSIS::Package::DTSTaskConnection - Connection Details held in a DTSTask  Ded MedVed

=head1 VERSION

Version 0.01

=cut


has 'name' => (
    is  => 'ro'
,   isa => 'Str'
,   required => 1
);

has 'id' => (
    is  => 'ro'
,   isa => 'Int'
,   required => 1
);

has 'description' => (
    is  => 'ro'
,   isa => 'Str'
,   required => 1
);

has 'connectionManagerID' => (
    is  => 'ro'
,   isa => 'Str'
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

Please report any bugs or feature requests to C<bug-ssis-package-dtstaskconnection at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package-DTSTaskConnection>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package::DTSTaskConnection


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package-DTSTaskConnection>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package-DTSTaskConnection>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package-DTSTaskConnection>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package-DTSTaskConnection/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package::DTSTaskConnection

