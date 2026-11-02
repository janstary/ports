include ../defaults.mk

NAME		= unrar
VERSION		= 7.2.7

DESCRIPTION	= extract RAR archives
HOMEPAGE	= https://www.rarlab.com
DOWNLOAD	= $(HOMEPAGE)/rar/
DISTNAME	= $(NAME)src-$(VERSION).$(SUFFIX)
SRCDIR		= $(WORKDIR)/$(NAME)
CONFIGURE	=

CONFIGURE_ARGS +=			\
		--disable-openmp	\
		--enable-symlinks	\
		--without-libltdl	\
		--without-mp3		\
		--with-coreaudio	\
		--without-sunaudio

include ../port.mk
