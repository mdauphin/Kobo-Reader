#!/bin/bash
set -e -u
ARCHIVE=qt-everywhere-opensource-src-5.2.1.tar.gz
ARCHIVEDIR=qt-everywhere-opensource-src-5.2.1
. $KOBO_SCRIPT_DIR/build-common.sh

#see configure command there
#https://github.com/koen-github/Kobo-Trouw/blob/master/README.md

#-nomake docs -nomake translations -nomake demos -no-armfpa -xplatform qws/linux-arm-g++

pushd $ARCHIVEDIR
	./configure $CPPFLAGS $LIBS -release -no-accessibility -no-nis -no-cups -no-xshape -no-xrandr -no-xkb -no-xinerama -no-xcursor -no-sm -system-libpng -system-libjpeg -qt-zlib -xplatform linux-arm-gnueabi-g++ -opensource -no-pch -qt-freetype -confirm-license -dbus -ldbus-1 -nomake examples -nomake examples -no-opengl -no-neon -openssl -lrt -I${DEVICEROOT}/include/dbus-1.0 -I${DEVICEROOT}/lib/dbus-1.0/include $QT_EXTRA_ARGS
	$MAKE -j 4
	$MAKE install
popd
markbuilt


