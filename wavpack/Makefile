include ../defaults.mk

NAME		= wavpack
VERSION		= 5.6.0

DESCRIPTION	= audio codec for lossless, lossy and hybrid compression
HOMEPAGE	= http://www.wavpack.com/
DOWNLOAD	= ${HOMEPAGE}
SUFFIX		= tar.xz

DEPS		= libiconv

CONFIGURE_ARGS +=			\
		--enable-largefile	\
		--enable-libcrypto	\
		--enable-apps		\
		--disable-legacy	\
		--enable-man

include ../port.mk
