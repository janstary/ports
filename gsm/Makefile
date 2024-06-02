#MAKE_FLAGS=	CC="${CC}" DEBUG="${CFLAGS}" LDINC='-L$$(LIB)' \
#LIBgsm_VERSION=${LIBgsm_VERSION}
#FAKE_FLAGS=	INSTALL_ROOT="${WRKINST}${PREFIX}"
#post-install:
#ln -s toast.1 ${PREFIX}/man/man1/tcat.1
#ln -s toast.1 ${PREFIX}/man/man1/untoast.1

include ../defaults.mk

NAME		= gsm
VERSION		= 1.0.22

DESCRIPTION	= GSM audio codec
HOMEPAGE	= https://www.quut.com/gsm/
DOWNLOAD	= ${HOMEPAGE}

SRCDIR		= work/gsm-1.0-pl22/
CONFIGURE	=

include ../port.mk
