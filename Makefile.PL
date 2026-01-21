use strict;
use warnings;
use ExtUtils::MakeMaker;
use Config;
use File::Glob qw(bsd_glob);

my @xs_files = bsd_glob('xs/*.xs');
my @o_files  = map { s/\.xs$/\$(OBJ_EXT)/r } @xs_files;
my $objects  = join(' ', @o_files);

WriteMakefile(
    NAME             => 'Win32::Unicode',
    AUTHOR           => 'Yuji Shimada <xaicron@cpan.org>',
    VERSION_FROM     => 'lib/Win32/Unicode.pm',
    ABSTRACT_FROM    => 'lib/Win32/Unicode.pm',
    LICENSE          => 'perl_5',
    MIN_PERL_VERSION => '5.008003',

    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',
        'ExtUtils::ParseXS'   => '2.21',
    },
    BUILD_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',
    },
    TEST_REQUIRES => {
        'Test::More'        => '0.98',
        'Test::Output'      => '1.01',
        'Test::Exception'   => '0.31',
        'Test::Mock::Guard' => '0.08',
        'Test::Flatten'     => '0.11',
    },
    PREREQ_PM => {
    },

    OBJECT   => $objects,
    TYPEMAPS => ['xs/typemap'],
    INC      => '-I.',
    CCFLAGS  => $Config{ccflags} . ' -Wall',
    XSOPT    => '-noprototypes',

    # Disable default XS handling
    XS => {},

    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/xaicron/p5-win32-unicode.git',
                web  => 'https://github.com/xaicron/p5-win32-unicode',
            },
            bugtracker => {
                web => 'https://github.com/xaicron/p5-win32-unicode/issues',
            },
        },
    },

    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
    clean => { FILES => 'Win32-Unicode-* xs/*$(OBJ_EXT) xs/*.c ppport.h' },
);

{
    package MY;

    sub postamble {
        my $self = shift;
        my $postamble = '';

        # Generate ppport.h
        $postamble .= <<'PPPORT';
ppport.h:
	$(PERL) -MDevel::PPPort -e "Devel::PPPort::WriteFile('ppport.h')"

PPPORT

        # Compile each XS file in xs/ directory
        for my $xs (@xs_files) {
            my $c = $xs;
            $c =~ s/\.xs$/.c/;
            my $o = $xs;
            $o =~ s/\.xs$/\$(OBJ_EXT)/;

            $postamble .= <<"RULE";
$c: $xs ppport.h
	\$(XSUBPPRUN) \$(XSPROTOARG) \$(XSUBPPARGS) $xs > $c

$o: $c
	\$(CCCMD) \$(CCCDLFLAGS) "-I\$(PERL_INC)" \$(PASTHRU_DEFINE) \$(DEFINE) -c -o $o $c

RULE
        }

        return $postamble;
    }

    # Override dynamic_lib to depend on our XS objects
    sub dynamic_lib {
        my $self = shift;
        my $inherited = $self->SUPER::dynamic_lib(@_);

        # Add dependency on all xs object files
        my $objs = join(' ', @o_files);
        $inherited =~ s/^(\$\(INST_DYNAMIC\)\s*:.*)/$1 $objs/m;

        return $inherited;
    }
}
