include defaults.mk

PORTS =			\
	bzip2		\
	curl		\
	fftw		\
	file		\
	flac		\
	libevent	\
	libogg		\
	libopusenc	\
	libressl	\
	libsamplerate	\
	libsndfile	\
	libvorbis	\
	lynx		\
	mandoc		\
	opus		\
	opus-tools	\
	opusfile	\
	pkg-config	\
	pstree		\
	sox		\
	tmux

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)

clean:
	for port in $(PORTS) ; do make -C $$port clean; done
