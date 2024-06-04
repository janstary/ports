include ../defaults.mk

NAME		= libmad
VERSION		= 0.15.1b

DESCRIPTION	= MPEG audio decoder
HOMEPAGE	= https://www.underbit.com/products/mad/
DOWNLOAD	= ftp://ftp.mars.org/pub/mpeg/

#arm-apple-darwin23.5.0
CONFIGURE_ARGS +=			\
		--disable-speed		\
		--enable-accuracy	\
		--enable-fpm		\
		--disable-sso		\
		--enable-aso		\
		--enable-strict-iso	\
		--disable-profiling	\
		--disable-debugging	\
		--disable-experimental

include ../port.mk
