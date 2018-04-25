NAME		= bzip2
VERSION		= 1.0.6

DESCRIPTION	= compression library and tools
HOMEPAGE	= http://www.bzip.org/
DOWNLOAD	= $(HOMEPAGE)/$(VERSION)
CONFIGURE	= 

#build.args              CC="${configure.cc} [get_canonical_archflags cc]" \
                        #PREFIX=${prefix}
#
#destroot.destdir        PREFIX=${destroot}${prefix}
#
#platform darwin {
    #patchfiles-replace  patch-Makefile-so.diff patch-Makefile-dylib.diff
#
    #post-patch {
        #reinplace "s|__MacPorts_Version__|${version}|g" ${worksrcpath}/Makefile
        #reinplace "s|__MacPorts_Compatibility_Version__|[join [lrange [split ${version} .] 0 1] .]|g" ${worksrcpath}/Makefile
    #}
#
    #post-destroot {
        #ln -s libbz2.${version}.dylib ${destroot}${prefix}/lib/libbz2.[join [lrange [split ${version} .] 0 1] .].dylib
        #ln -s libbz2.${version}.dylib ${destroot}${prefix}/lib/libbz2.[join [lrange [split ${version} .] 0 0] .].dylib
        #ln -s libbz2.${version}.dylib ${destroot}${prefix}/lib/libbz2.dylib
    #}
#}

include ../ports.mk
