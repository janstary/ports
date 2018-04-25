PREFIX		= /usr/local
BINDIR		= $(PREFIX)/bin/
SBINDIR		= $(PREFIX)/sbin/
LIBDIR		= $(PREFIX)/lib/
INCDIR		= $(PREFIX)/include/
MANDIR		= $(PREFIX)/man/

CC		= cc
CFLAGS		= -Wall
CPPFLAGS	= -I$(INCDIR)
LDFLAGS		= -L$(LIBDIR)

PORTSDIR	= $(HOME)/ports
DISTFILES	= $(PORTSDIR)/distfiles

FETCH		= /usr/bin/curl --create-dirs -f -s -S -o
DIFF		= /usr/bin/diff
FIND		= /usr/bin/find
OPENSSL		= /usr/bin/openssl
SHASUM		= $(OPENSSL) dgst -sha256
TAR		= /usr/bin/tar
XARGS		= /usr/bin/xargs

SUFFIX		?= tar.gz
TARBALL		?= $(NAME)-$(VERSION).$(SUFFIX)
DISTFILE	= $(DISTFILES)/$(TARBALL)
DISTINFO	= distinfo

WRKDIR		= work
FILESDIR	= files
PATCHDIR	= patches
SRCDIR		= $(WRKDIR)/$(NAME)-$(VERSION)

CONFIGURE	?= ./configure
CONFIGURE_ENV	= PKG_CONFIG_PATH=$(PREFIX)/pkgconfig/
CONFIGURE_ARGS	= --disable-silent-rules	\
		  --enable-option-checking	\
		  --prefix=$(PREFIX)		\
		  --bindir=$(BINDIR)           	\
		  --sbindir=$(SBINDIR)		\
		  --libdir=$(LIBDIR)		\
		  --includedir=$(INCDIR)	\
		  --mandir=$(MANDIR)		\
		  --sysconfdir=/etc

EXTRACTED	= $(WRKDIR)/.extracted
PATCHED		= $(WRKDIR)/.patched
CONFIGURED	= $(WRKDIR)/.configured
BUILT		= $(WRKDIR)/.built

all: build

fetch: $(DISTFILE)
$(DISTFILE):
	$(FETCH) $(DISTFILE) $(DOWNLOAD)/$(TARBALL)

makesum: $(DISTINFO)
$(DISTINFO): $(DISTFILE)
	@( cd $(DISTFILES) && $(SHASUM) $(TARBALL) ) > $(DISTINFO)

checksum: $(DISTFILE) $(DISTINFO)
	@( cd $(DISTFILES) && $(SHASUM) $(TARBALL) ) | $(DIFF) -q - $(DISTINFO)

extract: checksum $(EXTRACTED)
$(EXTRACTED): $(DISTFILE)
	@install -d $(WRKDIR)/$(TARDIR)
	$(TAR) -C $(WRKDIR)/$(TARDIR) -xzf $(DISTFILE)
	@$(FIND) . -name extra-\* | $(XARGS) -J % $(TAR) cf - % \
	| $(TAR) -C $(SRCDIR) -s /extra-// -xvf -
	@date > $(EXTRACTED)

patch: extract $(PATCHED)
$(PATCHED):
	#test -d $(PATCHDIR) && install $(FILESDIR)/* $(SRCDIR)
	@date > $(PATCHED)

configure: patch $(CONFIGURED)
$(CONFIGURED): $(PATCHED)
	if test -n "$(CONFIGURE)" ; then ( cd $(SRCDIR) && \
		env $(CONFIGURE_ENV) $(CONFIGURE) $(CONFIGURE_ARGS) ) ; fi
	@date > $(CONFIGURED)

build: configure $(BUILT)
$(BUILT): $(CONFIGURED)
	( cd $(SRCDIR) && make )
	@date > $(BUILT)

install: build
	install -d $(BINDIR)
	install -d $(MANDIR)/man1
	install -d $(MANDIR)/man2
	install -d $(MANDIR)/man3
	install -d $(MANDIR)/man4
	install -d $(MANDIR)/man5
	install -d $(MANDIR)/man6
	install -d $(MANDIR)/man7
	install -d $(MANDIR)/man8
	( cd $(SRCDIR) && make install )

uninstall:
	( cd $(SRCDIR) && make uninstall )

clean:
	@rm -rf $(WRKDIR) *~

distclean: clean
	@rm -f $(DISTFILE)
