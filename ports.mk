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
		  --prefix=$(FAKEDIR)			\
		  --bindir=$(FAKEDIR)/bin		\
		  --sbindir=$(FAKEDIR)/sbin		\
		  --libdir=$(FAKEDIR)/lib		\
		  --includedir=$(FAKEDIR)/include	\
		  --mandir=$(FAKEDIR)/man		\
		  --sysconfdir=$(FAKEDIR)/etc

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
	@install -d $(WORKDIR)/$(TARDIR)
	$(TAR) -C $(WORKDIR)/$(TARDIR) -xzf $(DISTFILE)
	@$(FIND) . -name extra-\* | $(XARGS) -J % $(TAR) cf - % \
	| $(TAR) -C $(SRCDIR) -s /extra-// -xvf -
	@date > $(EXTRACTED)

patch: $(PATCHED)
$(PATCHED): $(EXTRACTED)
	#test -d $(PATCHDIR) && install $(FILESDIR)/* $(SRCDIR)
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
	( cd $(SRCDIR) && make install PREFIX=$(FAKEDIR) )
	@date > $(FAKED)

makecontent: $(FAKED)
	( cd $(FAKEDIR) && find . -type f ) | cut -c 3- > $(CONTENT)

package: $(PACKAGE)
$(PACKAGE): $(FAKED) $(CONTENT)
	install -d $(PACKAGES)
	$(TAR) -I $(CONTENT) -C $(FAKEDIR) -cvzf $(PACKAGE)

install: $(PACKAGE)
	$(TAR) -C $(PREFIX) -xvzf $(PACKAGE)
	install -d -m 0755 $(PKGREC)
	install content $(PKGREC)

uninstall: $(PKGREC)/content
	cd $(PREFIX) && cat $(PKGREC)/content | xargs rm -f
	rm -rf $(PKGREC)

clean:
	@rm -rf $(WORKDIR) $(FAKEDIR) *~

distclean: clean
	@rm -f $(DISTFILE)
