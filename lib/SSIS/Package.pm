package SSIS::Package;

use 5.010;
use Mouse;

use XML::Simple ; #qw(:strict);
#use XML::LibXML;
use XML::CompactTree::XS;
use XML::LibXML::Reader;

use Data::Dumper;

use Carp;

=head1 NAME

SSIS::Package - Report on SSIS packages by Ded MedVed

=head1 VERSION

Version 0.04

=cut

our $VERSION = '0.04';

has 'file' => (
    is          => 'rw'
,   isa         => 'Str'
);
has 'parsedssiscode' => (
    is          => 'rw'
);


has 'connectorsXML' => (
    is          => 'rw'
);

has 'tasksXML' => (
    is          => 'rw'
);

has 'connectors' => (
    is          => 'rw'
);

has 'tasks' => (
    is          => 'rw'
);


sub BUILD {
    my ($self) = @_;
} ;

sub parse {

    local $_ ;

    my $self                = shift ;
    my $class               = ref($self) || $self ;
    my $filename            = shift or croak "no filename";
    
    $self->file($filename);
    $self->parsedssiscode(XMLin($filename,ForceArray => [ 'DTS:Executable', 'connections'  ]));
    
    my $stuff               = $self->parsedssiscode() ;

#warn Dumper $stuff ;

    my @connectorsXML ;
    foreach my $k (keys %{$stuff}) {
        if ( $k eq 'DTS:ConnectionManager' ) {
            foreach my $item (@{$stuff->{$k}} ) {
                push @connectorsXML, $item ;
            }
        }
    } 
    $self->connectorsXML(\@connectorsXML);    

    
    my @connectors ;
    foreach my $conn (@connectorsXML) {
        my @type = grep { $_->{'DTS:Name'} eq 'CreationName' }  @{$conn->{'DTS:Property'}};
        my $type = $type[0]->{'content'};
        my $obj = SSIS::Package::ConnectionManagerFactory->make( { type => $type , properties =>  $conn->{'DTS:Property'} , objectData => $conn->{'DTS:ObjectData'} });
        push @connectors, $obj;
    }
    $self->connectors(\@connectors);    
    
    my @tasksXML;
    foreach my $k (keys %{$stuff}) {
#warn Dumper $k, $stuff->{$k};
#exit;
        if ( $k eq 'DTS:Executable' ) {
            foreach my $item (@{$stuff->{$k}} ) {
                push @tasksXML, $item ;
            }                
        }
    }        
    $self->tasksXML(\@tasksXML);    

    my @tasks ;
    foreach my $task (@tasksXML) {
        my @connectors ;
        $self->parse_getConnectors($task, \@connectors) ;                    

        my @type = grep { $_->{'DTS:Name'} eq 'CreationName' }  @{$task->{'DTS:Property'}};
        my $type = $type[0]->{'content'};
        my $obj = SSIS::Package::DTSTaskFactory->make( { type => $task->{'DTS:ExecutableType'}, properties =>  $task->{'DTS:Property'}, connectors => \@connectors } );
        push @tasks, $obj;
    }
    $self->tasks(\@tasks);    
   
}

sub parse_getConnectors {

    local $_ ;

    my $self                = shift ;
    my $class               = ref($self) || $self ;
    my $dataTree            = shift ;
    my $return              = shift ;
    
    if  (ref($dataTree)   eq 'HASH' ) {
        foreach my $k (keys %$dataTree) {
            if ( $k eq 'connections') {
                push @$return, $dataTree->{$k} ;
            }
            else {
                $self->parse_getConnectors($dataTree->{$k}, $return );
            }
        }
    }
    elsif  (ref($dataTree)   eq 'ARRAY' ) {
        foreach my $r (@$dataTree) {
            $self->parse_getConnectors($r,$return);
        }
    }
    return ;
    
    
}



__PACKAGE__->meta->make_immutable();


1; 
__DATA__



=head1 SYNOPSIS

Alpha package to determine and list SSIS File connectors and their usage in SSIS packages.

=head1 AUTHOR

Ded MedVed, C<< <dedmedved at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ssis-package at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SSIS-Package>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SSIS::Package


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SSIS-Package>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SSIS-Package>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SSIS-Package>

=item * Search CPAN

L<http://search.cpan.org/dist/SSIS-Package/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ded MedVed.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of SSIS::Package

