include ../defaults.mk

NAME		= python
VERSION		= 3.10.4

DESCRIPTION	= the Python programming language
HOMEPAGE	= https://www.python.org
DOWNLOAD	= $(HOMEPAGE)/ftp/python/$(VERSION)
DISTNAME	= Python-$(VERSION).tgz

DEPS		= libressl
CONFIGURE_ARGS	+= --with-openssl=$(PREFIX) --with-ssl-default-suites=openssl

include ../port.mk
