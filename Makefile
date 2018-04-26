include ports.mk

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)
