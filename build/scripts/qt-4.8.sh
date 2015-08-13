#!/bin/bash
set -e -u
#ARCHIVE=qt-everywhere-opensource-src-4.6.2.tar.gz
#ARCHIVEDIR=qt-everywhere-opensource-src-4.6.2
ARCHIVE=qt-everywhere-opensource-src-4.8.0.tar.gz
ARCHIVEDIR=qt-everywhere-opensource-src-4.8.0
. $KOBO_SCRIPT_DIR/build-common.sh

#see configure command there
#https://github.com/koen-github/Kobo-Trouw/blob/master/README.md

pushd $ARCHIVEDIR
	./configure $CPPFLAGS $LIBS -release -no-accessibility -system-libmng -no-nis -no-cups -no-xshape -no-xrandr -no-xkb -no-xinerama -no-xcursor -no-sm -system-libpng -system-libjpeg -qt-zlib -embedded arm -xplatform qws/linux-arm-g++ -no-qt3support -exceptions -opensource -no-pch -qt-freetype -confirm-license -dbus -ldbus-1 -nomake examples -nomake docs -nomake translations -nomake examples -nomake docs -nomake demos -scripttools -xmlpatterns -no-opengl -depths all -no-armfpa -no-neon -openssl -lrt -I${DEVICEROOT}/include/dbus-1.0 -I${DEVICEROOT}/lib/dbus-1.0/include $QT_EXTRA_ARGS
	$MAKE -j 4
	$MAKE install
popd
markbuilt


