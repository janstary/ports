include defaults.mk

PORTS =			\
	autoconf	\
	automake	\
	bzip2		\
	fftw		\
	file		\
	flac		\
	ftp		\
	libevent	\
	libiconv	\
	libogg		\
	libopusenc	\
	libpng		\
	libressl	\
	libsamplerate	\
	libsndfile	\
	libtool		\
	libvorbis	\
	lynx		\
	mandoc		\
	openvpn		\
	opus		\
	opus-tools	\
	opusfile	\
	pkg-config	\
	pstree		\
	sox		\
	tmux		\
	unrar		\
	vorbis-tools	\
	wget

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)

clean:
	for port in $(PORTS) ; do make -C $$port clean; done
