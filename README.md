# Ports for MacOS

Some of the software you would expect to exist on a UNIX operating system
is either missing or outdated in MacOS. This ports system is meant to install
the software that Apple left out or behind. For example, MacOS 10.13.4
comes with LibreSSL 2.2.7, does not have `mkdep(1)`, etc.
Then there is third-party software you simply want to have.

This is a package manager that performs automatically what you do manually
when you download, extract, patch, configure, build and install software.
It consists of a set of Makefiles describing where to download
the tarball from, what patches to apply, etc. A typical installation
happens with a simple `make install` in the given port's directory.

The infrastructure is inspired by the OpenBSD ports system:
keep it a simple `Makefile`, as expected on UNIX. Many of the
port Makefiles borrow from MacPorts and the OpenBSD ports.

## installing the system

```sh
git clone git@github.com:janstary/ports.git
cd ports && make init
```

## installing a port

The indvidual ports live in the subdirectories.
For example, to install `mandoc`:

```sh
cd ~/ports/mandoc
make install
```

Inside, the installation is a sequence of the following targets:

* `fetch` downloads the source code, typically a gzipped tarball.
* `checksum` makes sure it is the actual source, uncorrupted.
* `extract` untars the source into a working directory
* `patch` applies any patches defined for the port
* `configure` configures the build for your system
* `build` (default target) performs the actual compilation
* `fake` installs the software into a temporary location
* `package` creates a binary package
* `install` installs that package

## uninstalling a port

* `uninstall` removes all files the `install` target has created
* `clean` removes the `work` and `fake` directory of the port
* `distclean` also removes the source tarball

## an easy example

A port is described by a `Makefile` in a subdirectory of the `ports` directory.
As an easy example, this is `mandoc/Makefile`:

```make
NAME		= mandoc
VERSION		= 1.14.4

DESCRIPTION	= UNIX manpage compiler
HOMEPAGE	= https://mandoc.bsd.lv/
DOWNLOAD	= https://mandoc.bsd.lv/snapshots/

CONFIGURE_ARGS	=

include ../ports.mk
```

This is a simple port, with no dependencies, as mandoc does not
need any extarnal libraries to configure, build or run. The makefile
declares the name and version, gives as simple description, points
to the homepage, and says where to get `mandoc-14.4.4.tar.gz`.

If there are any `extra-*` files found in the port's subdirectory,
they will be copied into the work directory.

makesum
checksum
extract
patch
make (all = build)
make package
make install

patch-*
