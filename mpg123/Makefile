include ../defaults.mk

NAME		= mpg123
VERSION		= 1.33.7
DESCRIPTION	= an MP3 decoder and player
HOMEPAGE	= https://www.mpg123.de/
DOWNLOAD	= $(HOMEPAGE)/download/
SUFFIX		= tar.bz2

CONFIGURE_ARGS	+=		 \
	--enable-network	\
	--with-audio=coreaudio	\
	--with-optimization=3	\

include ../port.mk
