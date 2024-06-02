include defaults.mk

PORTS =			\
	autoconf	\
	automake	\
	fftw		\
	file		\
	flac		\
	gsm		\
	libevent	\
	libiconv	\
	libogg		\
	libopusenc	\
	libpng		\
	libressl	\
	libsamplerate	\
	libsndfile	\
	libtool		\
	libunistring	\
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
	wavpack		\
	wget

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)

clean:
	for port in $(PORTS) ; do make -C $$port clean; done
