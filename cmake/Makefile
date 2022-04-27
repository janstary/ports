include ../defaults.mk

NAME		= cmake
VERSION		= 3.23.1

DESCRIPTION	= build, test and package software
HOMEPAGE	= https://cmake.org/
DOWNLOAD	= https://github.com/Kitware/CMake/releases/download/v$(VERSION)


CONFIGURE_ARGS	= \
		--prefix=$(PREFIX)		\
		--generator='Unix Makefiles'	\
		--system-curl			\
		--system-expat			\
		--no-system-jsoncpp		\
		--system-zlib			\
		--system-bzip2			\
		--no-system-liblzma		\
		--no-system-nghttp2		\
		--no-system-zstd		\
		--no-system-libarchive		\
		--no-system-librhash		\
		--no-system-libuv		\
		--no-qt-gui

include ../port.mk
