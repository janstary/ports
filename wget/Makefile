include ../defaults.mk

NAME		= wget
VERSION		= 1.19.5
DESCRIPTION	= internet file retriever
HOMEPAGE	= https://www.gnu.org/software/$(NAME)/
DOWNLOAD	= https://ftp.gnu.org/gnu/$(NAME)/

#DEPS		= libressl

#depends_build
#bin:makeinfo:texinfo \
#port:pkgconfig

#depends_lib \
#port:gettext \
#port:nettle \

CONFIGURE_ARGS	+= \
	--disable-opie			\
	--disable-digest		\
	--disable-ntlm			\
	--disable-debug			\
	--disable-valgrind-tests	\
	--disable-assert		\
	--disable-threads		\
	--enable-ipv6			\
	--disable-iri			\
	--disable-pcre			\
	--disable-xattr			\
	--with-ssl=openssl		\
	--with-zlib			\
	--without-metalink		\
	--without-cares			\
	--with-libiconv-prefix=/usr	\
	--without-libintl-prefix	\
	--with-openssl=yes		\
	--with-included-libunistring	\
	--without-libunistring-prefix	\
	--without-libpth-prefix		\
	--without-included-regex	\
	--with-libssl-prefix=$(PREFIX)	\
	--without-libgnutls-prefix	\
	--without-gpgme-prefix		\
	--without-libidn		\
	--without-libuuid		\

include ../port.mk
