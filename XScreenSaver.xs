#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <X11/Xlib.h>

MODULE = SDL::XScreenSaver		PACKAGE = SDL::XScreenSaver		

static Display *dpy = 0;

void
xss_viewport_dimensions(window_id)
    PPCODE:
        XWindowAttributes xwa;
        if (window_id) {
            if (!dpy) {
                dpy = XOpenDisplay(0);
            }
            if (dpy) {
                XGetWindowAttributes(dpy, window_id, &xwa);
                XPUSHs(sv_2mortal(newSVnv(xwa.width)));
                XPUSHs(sv_2mortal(newSVnv(xwa.height)));
            }
        }
