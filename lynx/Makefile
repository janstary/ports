NAME		= lynx
VERSION		= 2.8.8

DESCRIPTION	= a text web browser
HOMEPAGE	= https://lynx.invisible-island.net
DOWNLOAD	= https://invisible-mirror.net/archives/lynx/tarballs
TARBALL		= ${NAME}${VERSION}rel.2.tar.gz
SRCDIR          = $(WORKDIR)/lynx2-8-8

include ../ports.mk

#depends_lib         port:gettext port:libiconv port:libidn port:ncurses

#configure.args      --datadir=${prefix}/share/doc \
#--enable-htmlized-cfg \
#--enable-ipv6 \
#--enable-local-docs \
#--enable-nls

# LYCurses.c:1707:26: error: incomplete definition of type 'struct term'
#configure.cppflags-append -DNCURSES_INTERNALS=1

#destroot.target-append  install-doc install-help
#configure.args-append   --with-ssl
