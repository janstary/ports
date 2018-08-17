include ports.mk

PORTS =			\
	bzip2		\
	file		\
	libevent	\
	libogg		\
	libressl	\
	libvorbis	\
	mandoc		\
	opus		\
	opusfile	\
	pstree		\
	tmux

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)
