
#cp ${FILESDIR}/id3tag.pc.in ${WRKSRC}
#rm -f ${WRKSRC}/compat.c

include ../defaults.mk

NAME		= libid3tag
VERSION		= 0.15.1b

DESCRIPTION	= library for reading ID3 tags
HOMEPAGE	= https://mad.sourceforge.net/
DOWNLOAD	= ftp://ftp.mars.org/pub/mpeg/

CONFIGURE_ARGS +=			\
		--without-sunaudio

include ../port.mk
