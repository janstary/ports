NAME		= flac
VERSION		= 1.3.2

DESCRIPTION	= Free Lossless Audio Codec
HOMEPAGE	= https://xiph.org/flac/
DOWNLOAD	= http://downloads.xiph.org/releases/flac/
SUFFIX		= tar.xz

CONFIGURE_ARGS	= \
		--disable-asm-optimizations	\
		--enable-werror			\
		--disable-stack-smash-protection\
		--disable-valgrind-testing	\
		--disable-doxygen-docs		\
		--disable-xmms-plugin		\
		--disable-cpplibs		\
		--with-libiconv-prefix=/usr	\
		--with-ogg=/usr/local/

#--disable-oggtest	  Do not try to compile and run a test Ogg program
#--disable-rpath	  do not hardcode runtime library paths
#depends_lib         port:libiconv port:libogg

include ../ports.mk
