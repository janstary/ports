include ../defaults.mk

NAME		= lame
VERSION		= 4.0

DESCRIPTION	= LAME MP3 encoder
HOMEPAGE	= https://lame.sourceforge.net/
DOWNLOAD	= https://sourceforge.net/projects/lame//files/lame/$(VERSION)/

DEPS		= libiconv mpg123 libid3tag pkg-config

CONFIGURE_ARGS += \
		--disable-nasm		\
		--disable-cpml		\
		--disable-gtktest	\
		--disable-efence	\
		--disable-analyzer-hooks\
		--enable-decoder	\
		--enable-frontend	\
		--disable-mp3x		\
		--disable-mp3rtp	\
		--disable-expopt	\
		--disable-debug		\
		--without-dmalloc	\
		--without-gnu-ld	\
		--with-libiconv-prefix	\
		--with-fileio=lame

include ../port.mk
