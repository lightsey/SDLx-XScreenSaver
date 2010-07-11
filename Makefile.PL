#!/usr/bin/env perl
use ExtUtils::MakeMaker;

use lib qw(inc);
use Devel::CheckLib;

check_lib_or_exit( lib => ['X11'] );

WriteMakefile(
    NAME          => 'SDL::XScreenSaver',
    VERSION_FROM  => 'lib/SDL/XScreenSaver.pm',
    ABSTRACT_FROM => 'lib/SDL/XScreenSaver.pm',
    LIBS          => '-lX11',
    LICENSE       => 'perl',
);
