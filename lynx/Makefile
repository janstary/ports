include ../defaults.mk

NAME		= lynx
VERSION		= 2.9.2

DESCRIPTION	= a text web browser
HOMEPAGE	= https://lynx.invisible-island.net
DOWNLOAD	= https://invisible-island.net/archives/lynx/tarballs
DISTNAME	= ${NAME}${VERSION}.tar.gz
SRCDIR          = $(WORKDIR)/${NAME}${VERSION}

DEPS		= libressl libiconv

CONFIGURE_ARGS	+= \
		--without-dbmalloc	\
		--without-dmalloc	\
		--disable-included-msgs	\
		--with-libiconv-prefix=$(PREFIX) \
		--without-nss-compat	\
		--with-ssl=$(PREFIX)	\
		--without-gnutls	\
		--disable-gnutls-compat	\
		--without-socks	\
		--without-socks5	\
		--enable-ipv6	\
		--enable-color-style	\
		--enable-htmlized-cfg	\
		--enable-local-docs	\
		--enable-locale-charset	\
		--enable-default-colors	\
		--disable-extended-dtd	\
		--disable-file-upload	\
		--disable-idna	\
		--enable-prettysrc	\
		--enable-charset-choice	\
		--enable-externs	\
		--disable-font-switch	\
		--enable-syslog	\
		--without-bzlib	\
		--with-zlib	\
		--disable-finger	\
		--disable-gopher	\
		--disable-news	\
		--disable-wais	\
		--disable-dired	\
		--without-x

include ../port.mk
