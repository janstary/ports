NAME		= pstree
VERSION		= 2.39

DESCRIPTION	= list processes as a tree
HOMEPAGE	= http://www.thp.uni-duisburg.de/pstree/
DOWNLOAD	= ftp://ftp.thp.uni-duisburg.de/pub/source/
TARDIR		= $(NAME)-$(VERSION)

# Instead of the aritificial ./configure creating the artificial Makefile.
# we should overrride the build and install target like OpenBSD does (viz).
# But we don't have that infrastructure yet.

#do-build:
#cd ${WRKBUILD} && ${CC} ${CFLAGS} -o pstree pstree.c
#
#do-install:
#${INSTALL_PROGRAM} ${WRKBUILD}/pstree ${PREFIX}/bin/pstree
#${INSTALL_MAN} ${WRKBUILD}/pstree.1 ${PREFIX}/man/man1
#

include ../ports.mk
