include ../defaults.mk

NAME		= fftw
VERSION		= 3.3.8

DESCRIPTION	= discrete Fourier transform (DFT) library
HOMEPAGE	= http://fftw.org/
DOWNLOAD	= $(HOMEPAGE)

## XXX set it to its default value so that bsd.port.mk won't whine
#FULLPKGPATH-main=	math/fftw3,-main${FLAVOR_EXT:S/-/,/g}
#FULLPKGNAME-common=	fftw3-common-${V}
#SHARED_LIBS=	fftw3	7.1 \ fftw3f	7.1 \

#post-install:
#${INSTALL_DATA_DIR} ${PREFIX}/share/doc/fftw3
#${INSTALL_DATA} ${WRKSRC}/doc/fftw3.pdf ${PREFIX}/share/doc/fftw3

CONFIGURE_ARGS +=				\
		--disable-doc			\
		--disable-random-estimator	\
		--disable-alloca        	\
		--disable-mpi			\
		--disable-fortran		\
		--disable-openmp		\
		--disable-threads

include ../port.mk
