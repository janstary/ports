include ../defaults.mk

NAME		= lame
VERSION		= 3.100

DESCRIPTION	= LAME MP3 encoder
HOMEPAGE	= https://lame.sourceforge.net/
DOWNLOAD	= https://sourceforge.net/projects/lame//files/lame/$(VERSION)/

DEPS		= libiconv

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
