PORTSDIR	= $(HOME)/ports
DISTFILES	= $(PORTSDIR)/distfiles
PACKAGES	= $(PORTSDIR)/packages

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
CONTENT		= content

SRCDIR		= $(WORKDIR)/$(NAME)-$(VERSION)
WORKDIR		= $(shell pwd)/work
FAKEDIR		= $(shell pwd)/fake

CONFIGURE	?= ./configure
CONFIGURE_ENV	= PKG_CONFIG_PATH=$(PREFIX)/pkgconfig/
CONFIGURE_ARGS	= --disable-silent-rules		\
		  --enable-option-checking		\
		  --prefix=$(FAKEDIR)$(PREFIX)		\
		  --bindir=$(FAKEDIR)/$(BINDIR)		\
		  --sbindir=$(FAKEDIR)/$(SBINDIR)	\
		  --libdir=$(FAKEDIR)/$(LIBDIR)		\
		  --includedir=$(FAKEDIR)/$(INCDIR)	\
		  --mandir=$(FAKEDIR)/$(MANDIR)		\
		  --sysconfdir=$(FAKEDIR)/etc

EXTRACTED	= $(WORKDIR)/.extracted
PATCHED		= $(WORKDIR)/.patched
CONFIGURED	= $(WORKDIR)/.configured
BUILT		= $(WORKDIR)/.built

MACHINE		= $(shell uname -m)
PKGFILE		= $(NAME)-$(VERSION)-$(MACHINE).tar.gz
PACKAGE		= $(PACKAGES)/$(PKGFILE)

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
	@install -d $(WORKDIR)/$(TARDIR)
	$(TAR) -C $(WORKDIR)/$(TARDIR) -xzf $(DISTFILE)
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

fake: build
	install -d $(FAKEDIR)$(PREFIX)
	install -d $(FAKEDIR)$(BINDIR)
	install -d $(FAKEDIR)$(SBINDIR)
	install -d $(FAKEDIR)$(LIBDIR)
	install -d $(FAKEDIR)$(INCDIR)
	install -d $(FAKEDIR)$(MANDIR)
	( cd $(SRCDIR) && make install )

package: fake $(PACKAGE)
$(PACKAGE): $(CONTENT)
	install -d $(PACKAGES)
	$(TAR) -I $(CONTENT) -C $(FAKEDIR)$(PREFIX) -cvzf $(PACKAGE)

install: $(PACKAGE)
	$(TAR) -C $(PREFIX) -xvzf $(PACKAGE)

uninstall:
	cd $(PREFIX) && $(TAR) tzf $(PACKAGE) | xargs rm -f
	# FIXME: the content list should be stored elsewhere

clean:
	@rm -rf $(WORKDIR) $(FAKEDIR) *~

distclean: clean
	@rm -f $(DISTFILE)
