include ../defaults.mk

NAME		= opus-tools
VERSION		= 0.2

DESCRIPTION	= encode and decode Opus files
HOMEPAGE	= http://www.opus-codec.org
DOWNLOAD	= https://archive.mozilla.org/pub/opus

CONFIGURE_ARGS +=				\
		--with-ogg=$(PREFIX)		\
		--with-opus=$(PREFIX)		\
		--with-opusfile=$(PREFIX)	\
		--with-libopusenc=$(PREFIX)	\
		--with-flac=$(PREFIX)

include ../port.mk
