include ../defaults.mk

NAME		= libevent
VERSION		= 2.1.8-stable

DESCRIPTION	= event notification library
HOMEPAGE	= http://libevent.org
GITHUB		= https://github.com/$(NAME)/$(NAME)
DOWNLOAD	= $(GITHUB)/releases/download/release-$(VERSION)

CONFIGURE_ARGS	+= \
		--disable-malloc-replacement	\
		--disable-samples

include ../port.mk
