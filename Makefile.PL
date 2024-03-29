use 5.010;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'SSIS::Package',
    AUTHOR              => q{Ded MedVed <dedmedved@cpan.org>},
    VERSION_FROM        => 'lib/SSIS/Package.pm',
    ABSTRACT_FROM       => 'lib/SSIS/Package.pm',
    MIN_PERL_VERSION    => 5.10.0,
    ($ExtUtils::MakeMaker::VERSION >= 6.48
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    EXE_FILES => [],
    PREREQ_PM => {
        'Test::More'                    => 0,
        'Test::Deep'                    => 0,
        'Carp'                          => 0,
        'Data::Printer'                 => 0,
        'Data::Dumper'                  => 0,
        'IPC::System::Simple'           => 0,   # everything needs this ( on bsd anyway)
        'Mouse'                         => 0,
        'List::MoreUtils'               => 0,
        'List::Util'                    => 0,
        'XML::Simple'                   => 0,
        'XML::CompactTree::XS'          => 0,
        'XML::LibXML::Reader'           => 0,
        'autodie'                       => 0,
        'indirect'                      => 0,
        'version'                       => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'SSIS-FileDependencies-*' },
);



