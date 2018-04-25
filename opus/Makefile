NAME		= opus
VERSION		= 1.2.1

DESCRIPTON	= Opus audio codec
HOMEPAGE	= http://www.opus-codec.org
DOWNLOAD	= https://archive.mozilla.org/pub/opus

#platform i386 {
    ## checking How to get X86 CPU Info... configure: error: no supported Get CPU Info method, please disable intrinsics
    #compiler.blacklist *gcc-4.* {clang < 500}
#}


#depends_build   port:pkgconfig
#configure.args  --disable-silent-rules

include ../ports.mk
