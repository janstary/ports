include ../defaults.mk

NAME		= tmux
VERSION		= 2.7

DESCRIPTION	= terminal multiplexer
HOMEPAGE	= https://github.com/tmux/
DOWNLOAD	= $(HOMEPAGE)/$(NAME)/releases/download/$(VERSION)/

DEPS		= libevent

CONFIGURE_FLAGS	+= --disable-utempter --disable-utf8proc

include ../port.mk
