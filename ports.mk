PORTSDIR	= $(HOME)/ports
DISTFILES	= $(PORTSDIR)/distfiles
PACKAGES	= $(PORTSDIR)/packages
PKGINDEX	= $(PORTSDIR)/index

MACHINE		= $(shell uname -m)
PKGREC		= $(PKGINDEX)/$(NAME)-$(VERSION)
PKGFILE		= $(NAME)-$(VERSION)-$(MACHINE).tar.gz
PACKAGE		= $(PACKAGES)/$(PKGFILE)

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

SUFFIX		?= tar.gz
TARBALL		?= $(NAME)-$(VERSION).$(SUFFIX)
DISTFILE	= $(DISTFILES)/$(TARBALL)
DISTINFO	= distinfo
CONTENT		= content

WORKDIR		?= $(shell pwd)/work
FAKEDIR		?= $(shell pwd)/fake
SRCDIR		?= $(WORKDIR)/$(NAME)-$(VERSION)

CONFIGURE	?= ./configure
CONFIGURE_ENV	?= PKG_CONFIG_PATH=$(PREFIX)/pkgconfig/
CONFIGURE_ARGS	?= --disable-silent-rules		\
		  --enable-option-checking		\
		  --prefix=$(PREFIX)			\
		  --bindir=$(PREFIX)/bin		\
		  --sbindir=$(PREFIX)/sbin		\
		  --libdir=$(PREFIX)/lib		\
		  --includedir=$(PREFIX)/include	\
		  --mandir=$(PREFIX)/man		\
		  --sysconfdir=$(PREFIX)/etc

EXTRACTED	= $(WORKDIR)/.extracted
PATCHED		= $(WORKDIR)/.patched
CONFIGURED	= $(WORKDIR)/.configured
BUILT		= $(WORKDIR)/.built
FAKED		= $(WORKDIR)/.faked

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
	@install -d $(WORKDIR)
	$(TAR) -C $(WORKDIR) -xzf $(DISTFILE)
	@$(FIND) . -name extra-\* | $(XARGS) -J % $(TAR) cf - % \
	| $(TAR) -C $(SRCDIR) -s /extra-// -xvf -
	@date > $(EXTRACTED)

patch: $(PATCHED)
$(PATCHED): $(EXTRACTED)
	@$(FIND) . -name patch-\* | $(XARGS) cat | ( cd $(SRCDIR) && patch -p0 -b )
	@date > $(PATCHED)

configure: $(CONFIGURED)
$(CONFIGURED): $(PATCHED)
	if test -n "$(CONFIGURE)" ; then ( cd $(SRCDIR) && \
		env $(CONFIGURE_ENV) $(CONFIGURE) $(CONFIGURE_ARGS) ) ; fi
	@date > $(CONFIGURED)

build: $(BUILT)
$(BUILT): $(CONFIGURED)
	( cd $(SRCDIR) && make )
	@date > $(BUILT)

fake: $(FAKED)
$(FAKED): $(BUILT)
	( cd $(SRCDIR) && make DESTDIR=$(FAKEDIR) PREFIX=$(PREFIX) install )
	@date > $(FAKED)

makecontent: $(FAKED)
	( cd $(FAKEDIR)$(PREFIX) && find . -type f -or -type l ) \
	| cut -c 3- > $(CONTENT)

package: $(PACKAGE)
$(PACKAGE): $(FAKED) $(CONTENT)
	install -d $(PACKAGES)
	$(TAR) -I $(CONTENT) -C $(FAKEDIR)$(PREFIX) -cvzf $(PACKAGE)

install: $(PACKAGE)
	$(SUDO) $(TAR) -C $(PREFIX) -xvzf $(PACKAGE)
	test -x $(MAKEWHATIS) && $(SUDO) $(MAKEWHATIS) $(MANDIR)
	install -d -m 0755 $(PKGREC)
	install content $(PKGREC)

uninstall: $(PKGREC)/content
	cd $(PREFIX) && cat $(PKGREC)/content | $(SUDO) $(XARGS) rm -f
	rm -rf $(PKGREC)

clean:
	@rm -rf $(WORKDIR) $(FAKEDIR) *~

distclean: clean
	@rm -f $(DISTFILE)

.PHONY: fetch makesum checksum extract patch configure build
.PHONY: fake package install uninstall clean distclean all
