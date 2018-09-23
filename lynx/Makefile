include ../defaults.mk

NAME		= lynx
VERSION		= 2.8.8

DESCRIPTION	= a text web browser
HOMEPAGE	= https://lynx.invisible-island.net
DOWNLOAD	= https://invisible-mirror.net/archives/lynx/tarballs
TARBALL		= ${NAME}${VERSION}rel.2.tar.gz
SRCDIR          = $(WORKDIR)/lynx2-8-8

DEPS		= libressl

CONFIGURE_ARGS	+= \
		--without-dbmalloc	\
		--without-dmalloc	\
		--disable-included-msgs	\
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
		--disable-cjk	\
		--disable-japanese-utf8	\
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
