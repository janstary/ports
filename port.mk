SUFFIX	?= tar.gz
TARBALL	?= $(NAME)-$(VERSION).$(SUFFIX)
DISTNAME ?= $(NAME)-$(VERSION).$(SUFFIX)
DISTFILE ?= $(DISTFILES)/$(TARBALL)

WORKDIR	?= $(shell pwd)/work
FAKEDIR	?= $(shell pwd)/fake
SRCDIR	?= $(WORKDIR)/$(NAME)-$(VERSION)

PKGREC	= $(PKGINDEX)/$(NAME)-$(VERSION)
PKGFILE	= $(NAME)-$(VERSION)-$(shell uname -m).tar.gz
PACKAGE	= $(PACKAGES)/$(PKGFILE)

#.PHONY: fetch makesum checksum extract patch configure build
#.PHONY: checksum
#.PHONY: fetch makesum checksum extract patch configure build
#.PHONY: fake package install uninstall clean distclean all
#.PHONY: package install uninstall clean distclean

all: build

fetch: $(DISTFILE)
$(DISTFILE):
	$(FETCH) $(DISTFILE) $(DOWNLOAD)/$(DISTNAME)

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
	@$(FIND) . -depth 1 -name patch-\* | $(XARGS) cat \
		| ( cd $(SRCDIR) && $(PATCH) )
	@date > $(PATCHED)

configure: $(CONFIGURED)
$(CONFIGURED): $(PATCHED)
	@for port in $(DEPS) ; do \
		echo === $(NAME) depends on $$port ; \
		make -C $(PORTSDIR)/$$port install ; \
	done
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
	| cut -c 3- | sort > $(CONTENT)

package: $(CONTENT) fake
	test -s $(PACKAGE) || \
	$(TAR) -I $(CONTENT) -C $(FAKEDIR)$(PREFIX) -czf $(PACKAGE)

install: $(PACKAGE)
	test -s $(PKGREC) || {						\
	$(SUDO) $(TAR) -C $(PREFIX) -xzf $(PACKAGE)		;	\
	install -m 0644 $(CONTENT) $(PKGREC)			;	\
	if test -x $(MAKEWHATIS) ; then $(SUDO) $(MAKEWHATIS) $(MANDIR); fi ; }

uninstall:
	test -s $(PKGREC) && {						\
	cd $(PREFIX) && cat $(PKGREC) | $(SUDO) $(XARGS) rm -f	;	\
	rm -rf $(PKGREC)					;	}

clean:
	@rm -rf $(WORKDIR) $(FAKEDIR) *~

distclean: clean
	@rm -f $(DISTFILE)
