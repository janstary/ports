include ../defaults.mk

NAME		= flac
VERSION		= 1.3.2

DESCRIPTION	= Free Lossless Audio Codec
HOMEPAGE	= https://xiph.org/flac/
DOWNLOAD	= http://downloads.xiph.org/releases/flac/
SUFFIX		= tar.xz

DEPS		= libogg

CONFIGURE_ARGS	+= \
		--enable-werror			\
		--disable-asm-optimizations	\
		--disable-stack-smash-protection\
		--disable-valgrind-testing	\
		--disable-doxygen-docs		\
		--disable-xmms-plugin		\
		--disable-cpplibs		\
		--with-libiconv-prefix=/usr	\
		--with-ogg=$(PREFIX)

include ../port.mk
