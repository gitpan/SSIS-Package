package SSIS::Package::ConnectionManager;

use 5.010;
use Mouse;

use Carp;

=head1 NAME

SSIS::Package::ConnectionManager - Base class for SSIS package connection managers by Ded MedVed

=head1 VERSION

Version 0.04

=cut

our $VERSION = '0.04';

#use autodie qw(:all);

#TODO 0. 


has 'CreationName' => (
    is  => 'ro'
,   isa => 'Str'
,   required => 1
);

has 'ObjectName' => (
    is  => 'ro'
,   isa => 'Str'
,   required => 1
);

has 'DelayValidation' => (
    is  => 'ro'
,   isa => 'Num'
,   required => 1
);

has 'Description' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 1
);

has 'DTSID' => (
    is  => 'ro'
,   isa => 'Str'
,   required => 1
);

has 'ConnectionString' => (
    is  => 'ro'
,   isa => 'Maybe[Str]'
,   required => 0
);




1 ;

__DATA__



=head1 SYNOPSIS

Alpha package to determine and list SSIS File connectors and their usage in SSIS packages.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ssis-package-connectionmanager at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package-ConnectionManager>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package::ConnectionManager


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package-ConnectionManager>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package-ConnectionManager>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package-ConnectionManager>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package-ConnectionManager/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package::ConnectionManager

