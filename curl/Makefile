include ../defaults.mk

NAME		= curl
VERSION		= 7.64.1

DESCRIPTION	= transfer data with URLs
HOMEPAGE	= https://curl.haxx.se/
DOWNLOAD	= $(HOMEPAGE)/download/

DEPS		= libressl

CONFIGURE_ARGS	+= \
		--enable-optimize	\
		--enable-warnings	\
		--enable-werror		\
		--disable-ares		\
		--disable-rt		\
		--disable-code-coverage	\
		--enable-http		\
		--enable-ftp		\
		--enable-file		\
		--disable-ldap		\
		--disable-ldaps		\
		--disable-rtsp		\
		--enable-proxy		\
		--disable-dict		\
		--disable-telnet	\
		--enable-tftp		\
		--disable-pop3		\
		--disable-imap		\
		--disable-smb		\
		--disable-smtp		\
		--disable-gopher	\
		--disable-manual	\
		--disable-libcurl-option\
		--enable-ipv6		\
		--disable-threaded-resolver	\
		--disable-pthreads	\
		--enable-verbose	\
		--disable-sspi		\
		--enable-crypto-auth	\
		--disable-ntlm-wb	\
		--enable-tls-srp	\
		--enable-unix-sockets	\
		--enable-cookies	\
		--without-gcov		\
		--with-zlib=/usr	\
		--without-brotli	\
		--with-ssl=$(PREFIX)	\
		--without-winssl	\
		--without-darwinssl	\
		--without-egd-socket	\
		--with-random=/dev/random	\
		--without-gnutls	\
		--without-polarssl	\
		--without-mbedtls	\
		--without-cyassl	\
		--without-wolfssl	\
		--without-nss		\
		--without-axtls		\
		--without-ca-bundle	\
		--without-libpsl	\
		--without-libmetalink	\
		--without-libssh2	\
		--without-libssh	\
		--without-librtmp	\
		--without-winidn	\
		--without-libidn2	\
		--without-nghttp2	\
		--without-zsh-functions-dir

include ../port.mk
