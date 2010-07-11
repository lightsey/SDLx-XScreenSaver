package SDL::XScreenSaver;

use strict;
use warnings;
use SDL::App ();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load( 'SDL::XScreenSaver', $VERSION );

my $app;

sub init {

    # TODO: Detect if window is provided and find dimensions
}

sub start {

    # TODO: Create and return SDL::App object with correct dimensions
}

sub update {
    unless ( defined $app ) {
        die "update() called before start()";
    }

    # TODO: Flip app surface. poll for exit event
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

SDL::XScreenSaver - Perl extension for blah blah blah

=head1 SYNOPSIS

  use SDL::XScreenSaver;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for SDL::XScreenSaver, created by h2xs. It looks like the
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
