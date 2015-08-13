#!/bin/bash
set -e -u
ARCHIVE=libpng-1.2.43.tar.gz
ARCHIVEDIR=libpng-1.2.43
#ARCHIVE=libpng-1.6.2.tar.gz
#ARCHIVEDIR=libpng-1.6.2
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --with-libpng-compat --prefix=/ --host=${CROSSTARGET} --build=${BUILDHOST}
	$MAKE -j$MAKE_JOBS
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
