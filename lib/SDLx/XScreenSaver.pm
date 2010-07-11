package SDLx::XScreenSaver;

use strict;
use warnings;
use SDL::App   ();
use SDL::Event ();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load( 'SDLx::XScreenSaver', $VERSION );

my $app;
my $window_id;
my $event;

sub init {

    # parse and remove XScreenSaver specific arguments.
    # stop at the first unknown argument (XScreenSaver will pass its own always
    # first)
    while (@ARGV) {
        if ( $ARGV[0] eq "-window-id" ) {
            $window_id = $ARGV[1];
            $window_id = oct($window_id) if ( $window_id =~ /^0/ );
            splice( @ARGV, 0, 2 );
        }
        elsif ( $ARGV[0] eq "-root" || $ARGV[0] eq "-mono" || $ARGV[0] eq "-install" ) {
            shift(@ARGV);
        }
        elsif ( $ARGV[0] eq "-visual" ) {
            splice( @ARGV, 0, 2 );
        }
        else {
            last;
        }
    }

    # if no window ID has been found yet, check out the environment.
    # XScreenSaver sometimes dumps the window ID there
    if ( !$window_id and $ENV{XSCREENSAVER_WINDOW} ) {
        $window_id = $ENV{XSCREENSAVER_WINDOW};
        $window_id = oct($window_id) if ( $window_id =~ /^0/ );
    }

    # if still no window then it seems we have to create one ourselves.
    # leave the window ID set to 0, start() will detect this and create its
    # own window.
    # return the information to the caller because the user might decide she
    # wants it to work in XScreenSaver only, not standalone.
    return $window_id ? 1 : 0;
}

sub start {
    my %app_params = @_;
    if ($window_id) {
        my ( $width, $height ) = xss_viewport_dimensions($window_id);
        if ( $width && $height ) {
            @app_params{ '-width', '-height' } = ( $width, $height );
        }
    }
    local $ENV{'SDL_WINDOWID'} = $window_id;
    $app   = SDL::App->new(%app_params);
    $event = SDL::Event->new();
    return $app;
}

sub update {
    unless ( defined $app ) {
        die "update() called before start()";
    }
    $app->sync();
    $event->poll();
    if ( $event->type() == SDL::Event::SDL_QUIT ) {
        exit;
    }
}

sub dimensions {
    if ( defined $app ) {
        return ( $app->width(), $app->height() );
    }
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

SDLx::XScreenSaver - Perl extension for blah blah blah

=head1 SYNOPSIS

  use SDLx::XScreenSaver;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for SDLx::XScreenSaver, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

John Lightsey, E<lt>john@nixnuts.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by John Lightsey

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
