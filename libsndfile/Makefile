include ../defaults.mk

NAME		= libsndfile
VERSION		= 1.0.28

DESCRIPTION	= read and write audio files
HOMEPAGE	= http://www.mega-nerd.com/$(NAME)/
DOWNLOAD	= $(HOMEPAGE)/files/

DEPS		=		\
		flac		\
		libogg		\
		libvorbis	\
		libvorbisenc	\
		libsamplerate

CONFIGURE_ARGS +=			\
		--disable-sqlite	\
		--disable-alsa		\
		--enable-external-libs	\
		--disable-octave	\
		--enable-full-suite	\
		--enable-test-coverage

include ../port.mk
