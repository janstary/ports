include ../defaults.mk

NAME		= libpng
VERSION		= 1.6.35

DESCRIPTION	= manipulate PNG files
HOMEPAGE	= http://www.libpng.org/pub/png/libpng.html
DOWNLOAD	= https://sourceforge.net/projects/libpng/files/libpng16/$(VERSION)/

CONFIGURE_ARGS	+= \
		--enable-unversioned-links		\
		--enable-unversioned-libpng-pc		\
		--enable-unversioned-libpng-config	\
		--enable-hardware-optimizations=no	\
		--with-zlib-prefix=/usr

include ../port.mk
