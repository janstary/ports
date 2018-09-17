include defaults.mk

PORTS =			\
	bzip2		\
	curl		\
	file		\
	flac		\
	gettext		\
	libevent	\
	libogg		\
	libressl	\
	libvorbis	\
	lynx		\
	mandoc		\
	opus		\
	opusfile	\
	pstree		\
	sox		\
	tmux

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)

clean:
	for port in $(PORTS) ; do make -C $$port clean; done
