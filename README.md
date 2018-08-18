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
* `checksum` makes sure it is the intended source file
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
DOWNLOAD	= $(HOMEPAGE)/snapshots/

CONFIGURE_ARGS	=

include ../ports.mk
```

This is a simple port, with no dependencies, as mandoc does not
need any external libraries or binaries to configure, to build or to run.
The makefile declares the name and version, gives a simple description,
points to the homepage, and says where to get `mandoc-14.4.4.tar.gz`.

The `fetch` target will download `mandoc-14.4.4.tar.gz`
into `~/ports/distfiles`. The downloaded file will be checked
against what `mandoc/distinfo` says:

```sh
SHA256(mandoc-1.14.4.tar.gz)= 24eb72103768987dcc63b53d27fdc085796330782f44b3b40c4660b1e1ee9b9c
```

This makes sure it is the actual `mandoc-14.4.4.tar.gz`,
uncorrupted and not tampered with.

The `extract` target will then untar `mandoc-14.4.4.tar.gz`
into `./work/mandoc-14.4.4` in the `mandoc` directory.

If there are any `extra-*` files found in the port's subdirectory,
they will be copied into the work directory. In this example,
the `mandoc` port contains `extra-configure.local`:

```sh
INSTALL_LIBMANDOC=0
BUILD_CGI=0
BUILD_CATMAN=0

MANPATH_DEFAULT="${PREFIX}/man:/usr/local/share/man:/usr/share/man"
```

This is a local configuration file which mandoc will use.
The `configure` target will simply run the `./configure` script
without any arguments, as specified by the empty `CONFIGURE_ARGS`,
overriding the defaults. The `./configure` script of mandoc takes
no arguments; it uses the above config file instead.

As there are no patches to apply, the `patch` target does nothing here.
In general, all files named `patch-*` are applied as patches to the source.

The `build` target will then run `make` in `work/mandoc-14.4.4`,
building the actual binary. In general this also builds libraries,
typesets documentation, etc.

The `fake` target will install the compiled mandoc into `./fake`.
This is a temporary directory that makes this installation isolated.
Files named in the `content` file of the port, in this case

```
bin/apropos
bin/demandoc
bin/man
bin/mandoc
bin/soelim
bin/whatis
man/man1/apropos.1
man/man1/demandoc.1
man/man1/man.1
man/man1/mandoc.1
man/man1/soelim.1
man/man1/whatis.1
man/man5/man.conf.5
man/man5/mandoc.db.5
man/man7/eqn.7
man/man7/man.7
man/man7/mandoc_char.7
man/man7/mdoc.7
man/man7/roff.7
man/man7/tbl.7
man/man8/makewhatis.8
sbin/makewhatis
```

that are found in the temporary directory will be bundled
into a binary package created by the `package` target.
This will create `~/ports/packages/mandoc-1.14.4-x86_64.tar.gz`
(named after the port, the version, and the architecture).

Ultimately, the `install` target will install the content of that package
into `PREFIX`, which is `/usr/local` by default,
and will register the installation in `~/ports/index/mandoc-14.4.4`.

If you later decide to uninstall `mandoc`, running `make uninstall`
in the port subdirectory will remove the entire content of the package,
and will unregister the installation.

