include ../defaults.mk

NAME		= tmux
VERSION		= 3.6

DESCRIPTION	= terminal multiplexer
HOMEPAGE	= https://github.com/tmux/
DOWNLOAD	= $(HOMEPAGE)/$(NAME)/releases/download/$(VERSION)/

DEPS		= libevent

CONFIGURE_ARGS	+= \
	--enable-option-checking\
	--disable-silent-rules	\
	--disable-utf8proc	\
	--disable-systemd	\
	--disable-cgroups	\
	--disable-sixel		\
	--disable-jemalloc

include ../port.mk
