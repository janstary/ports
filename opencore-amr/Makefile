# an implementation of the 3GPP TS 26.073 specification
# for the Adaptive Multi Rate (AMR) speech codec and
# an implementation of the 3GPP TS 26.173 specification for
# the Adaptive Multi-Rate Wideband (AMR-WB) speech decoder.

include ../defaults.mk

NAME		= opencore-amr
VERSION		= 0.1.6

DESCRIPTION	= Adaptive Multi Rate speech codec
HOMEPAGE	= https://sourceforge.net/projects/${NAME}/
DOWNLOAD	= ${HOMEPAGE}/files/${NAME}/

CONFIGURE_ARGS += \
		--enable-amrnb-encoder	\
		--enable-amrnb-decoder	\
		--enable-shared		\
		--enable-static		\
		--enable-examples

include ../port.mk
