
include ../defaults.mk

NAME		= libmagic
VERSION		= 5.45

DESCRIPTION	= determine file type
HOMEPAGE	= https://www.darwinsys.com/file/
DOWNLOAD	= http://ftp.astron.com/pub/file/

DISTNAME	= file-$(VERSION).$(SUFFIX)
SRCDIR		= $(WORKDIR)/file-$(VERSION)

CONFIGURE_ARGS += \
		--disable-openmp	\
		--enable-zlib		\
		--enable-bzlib		\
		--enable-fsect-man5

include ../port.mk
