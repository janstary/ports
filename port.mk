SUFFIX	?= tar.gz
TARBALL	?= $(NAME)-$(VERSION).$(SUFFIX)
DISTFILE = $(DISTFILES)/$(TARBALL)

WORKDIR	?= $(shell pwd)/work
FAKEDIR	?= $(shell pwd)/fake
SRCDIR	?= $(WORKDIR)/$(NAME)-$(VERSION)

PKGREC	= $(PKGINDEX)/$(NAME)-$(VERSION)
PKGFILE	= $(NAME)-$(VERSION)-$(shell uname -m).tar.gz
PACKAGE	= $(PACKAGES)/$(PKGFILE)

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
