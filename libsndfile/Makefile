include ../defaults.mk

NAME		= libsndfile
VERSION		= 1.2.0

DESCRIPTION	= read and write audio files
HOMEPAGE	= https://github.com/$(NAME)/$(NAME)/
DOWNLOAD	= $(HOMEPAGE)/archive/refs/tags/
DISTNAME	= $(VERSION).tar.gz

DEPS		=		\
		flac		\
		libogg		\
		libopusenc	\
		libvorbis	\
		libsamplerate	\
		opus		\
		opusfile

CONFIGURE	= cmake
CONFIGURE_ARGS	= .

include ../port.mk
