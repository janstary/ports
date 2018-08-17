NAME		= tmux
VERSION		= 2.7

DESCRIPTION	= terminal multiplexer
HOMEPAGE	= https://github.com/tmux/
DOWNLOAD	= $(HOMEPAGE)/$(NAME)/releases/download/$(VERSION)/

include ../ports.mk

#depends_lib     port:libevent port:ncurses
#use_autoreconf          yes
#autoreconf.cmd          ./autogen.sh
#autoreconf.args
#depends_build           port:autoconf \
#port:automake \
#port:libtool \
#port:pkgconfig

#post-destroot {
#xinstall -m 0755 -d ${destroot}${prefix}/share/doc/tmux
#xinstall -m 0644 ${worksrcpath}/example_tmux.conf ${destroot}${prefix}/share/doc/tmux
#xinstall -m 0755 -d ${destroot}${prefix}/share/vim/vimfiles/syntax
#xinstall -m 0644 ${filespath}/tmux.vim ${destroot}${prefix}/share/vim/vimfiles/syntax
#xinstall -m 0755 -d ${destroot}${prefix}/share/vim/vimfiles/ftdetect
#xinstall -m 0644 ${filespath}/ftdetect-tmux.vim ${destroot}${prefix}/share/vim/vimfiles/ftdetect/tmux.vim
#}
