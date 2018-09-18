PORTSDIR	= $(HOME)/ports
DISTFILES	= $(PORTSDIR)/distfiles
PACKAGES	= $(PORTSDIR)/packages
PKGINDEX	= $(PORTSDIR)/index

PREFIX		= /usr/local
BINDIR		= $(PREFIX)/bin/
SBINDIR		= $(PREFIX)/sbin/
LIBDIR		= $(PREFIX)/lib/
INCDIR		= $(PREFIX)/include/
MANDIR		= $(PREFIX)/man/
ETCDIR		= $(PREFIX)/etc

CC		= cc
CFLAGS		= -Wall
CPPFLAGS	= -I$(INCDIR)
LDFLAGS		= -L$(LIBDIR)

FETCH		= /usr/bin/curl --create-dirs -L -f -s -S -o
DIFF		= /usr/bin/diff
FIND		= /usr/bin/find
OPENSSL		= /usr/bin/openssl
SHASUM		= $(OPENSSL) dgst -sha256
SUDO		= /usr/bin/sudo
TAR		= /usr/bin/tar
PATCH		= /usr/bin/patch
XARGS		= /usr/bin/xargs
MAKEWHATIS	= /usr/local/sbin/makewhatis

CONFIGURE	= ./configure
CONFIGURE_ENV	= PKG_CONFIG_PATH=$(LIBDIR)/pkgconfig/
CONFIGURE_ARGS	= \
		--prefix=$(PREFIX)	\
		--bindir=$(BINDIR)	\
		--sbindir=$(SBINDIR)	\
		--libdir=$(LIBDIR)	\
		--includedir=$(INCDIR)	\
		--mandir=$(MANDIR)	\
		--sysconfdir=$(ETCDIR)	\
		--enable-option-checking\
		--disable-silent-rules	\
		--disable-silent-libtool\
		--enable-largefile	\
		--enable-shared		\
		--disable-java		\
		--disable-nls		\
		--with-pic

DISTINFO	= distinfo
CONTENT		= content

EXTRACTED	= $(WORKDIR)/.extracted
PATCHED		= $(WORKDIR)/.patched
CONFIGURED	= $(WORKDIR)/.configured
BUILT		= $(WORKDIR)/.built
FAKED		= $(WORKDIR)/.faked
