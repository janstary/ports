include ../defaults.mk

NAME		= libsndfile
VERSION		= 1.2.2
SUFFIX		= tar.xz

DESCRIPTION	= read and write audio files
HOMEPAGE	= https://github.com/$(NAME)/$(NAME)/
DOWNLOAD	= $(HOMEPAGE)/releases/download/$(VERSION)/

DEPS		=		\
		flac		\
		libogg		\
		libopusenc	\
		libvorbis	\
		libsamplerate	\
		opus		\
		opusfile

CONFIGURE_ARGS	+= \
	--enable-shared		\
	--disable-experimental	\
	--enable-werror		\
	--disable-cpu-clip	\
	--disable-sqlite	\
	--disable-alsa		\
	--enable-external-libs	\
	--disable-mpeg		\
	--disable-octave	\
	--enable-full-suite	\
	--disable-test-coverage	\
	--disable-ossfuzzers	\
	--enable-largefile

include ../port.mk
