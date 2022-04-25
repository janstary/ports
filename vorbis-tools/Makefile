include ../defaults.mk

NAME		= vorbis-tools
VERSION		= 1.4.2

DESCRIPTION	= encode, decode and play OGG Vorbis files
HOMEPAGE	= https://xiph.org/vorbis/
DOWNLOAD	= https://ftp.osuosl.org/pub/xiph/releases/vorbis/

DEPS		= libvorbis
CONFIGURE_ARGS	+= --disable-ogg123
# needs libao

include ../port.mk
