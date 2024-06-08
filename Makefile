include defaults.mk

PORTS =			\
	autoconf	\
	automake	\
	fftw		\
	file		\
	flac		\
	gsm		\
	lame		\
	libevent	\
	libiconv	\
	libid3tag	\
	libmad		\
	libmagic	\
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
	opencore-amr	\
	opus		\
	opus-tools	\
	opusfile	\
	pkg-config	\
	pstree		\
	sox		\
	tmux		\
	twolame		\
	unrar		\
	vo-amrwbenc	\
	vorbis-tools	\
	wavpack		\
	wget

init:
	install -d -m 0755 $(DISTFILES)
	install -d -m 0755 $(PACKAGES)
	install -d -m 0755 $(PKGINDEX)

clean:
	for port in $(PORTS) ; do make -C $$port clean; done
