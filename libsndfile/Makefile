include ../defaults.mk

NAME		= libsndfile
VERSION		= 1.0.28

DESCRIPTION	= read and write audio files
HOMEPAGE	= http://www.mega-nerd.com/$(NAME)/
DOWNLOAD	= $(HOMEPAGE)/files/

#CONFIGURE_ENV +=				\
		#FLAC_CFLAGS=$(CPPFLAGS)		\
		#FLAC_LIBS=$(LDFLAGS)		\
		#OGG_CFLAGS=$(CPPFLAGS)		\
		#OGG_LIBS=$(LDFLAGS)		\
		#VORBIS_CFLAGS=$(CPPFLAGS)	\
		#VORBIS_LIBS=$(LDFLAGS)		\
		#VORBISENC_CFLAGS=$(CPPFLAGS)	\
		#VORBISENC_CFLAGS=$(CPPFLAGS)	\
		#SPEEX_LIBS=$(LDFLAGS)		\
		#SPEEX_LIBS=$(LDFLAGS)

CONFIGURE_ARGS +=			\
		--disable-sqlite	\
		--disable-alsa		\
		--enable-external-libs	\
		--disable-octave	\
		--enable-full-suite	\
		--enable-test-coverage

include ../port.mk
