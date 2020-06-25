include ../defaults.mk

NAME		= openvpn
VERSION		= 2.4.7

DESCRIPTION	= virtual private network
HOMEPAGE	= https://openvpn.net
DOWNLOAD	= https://swupdate.openvpn.org/community/releases

DEPS		= libressl

CONFIGURE_ARGS +=			\
		--disable-lzo 		\
		--disable-lz4 		\
		--enable-crypto		\
		--disable-server	\
		--disable-plugins	\
		--disable-management 	\
		--disable-pkcs11      	\
		--enable-strict     	\
		--enable-strict-options	\
		--with-crypto-library=openssl

CONFIGURE_ENV	+= OPENSSL_CFLAGS='-I$(INCDIR)'
CONFIGURE_ENV	+= OPENSSL_LIBS='-L$(LIBDIR) -lssl -ltls -lcrypto'

include ../port.mk
