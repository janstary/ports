include ../defaults.mk

NAME		= tmux
VERSION		= 2.7

DESCRIPTION	= terminal multiplexer
HOMEPAGE	= https://github.com/tmux/
DOWNLOAD	= $(HOMEPAGE)/$(NAME)/releases/download/$(VERSION)/

CONFIGURE_ARGS	+= LIBEVENT_CFLAGS=$(CPPFLAGS) LIBEVENT_LIBS=$(LDFLAGS)

include ../port.mk
