# Read configuration overrides file from the build directory, if present. Use
# this file instead of editing build-config.sh directly, as it will never be
# checked into revision control.
#
# All these variables may be overridden by setting them in build-config-user.sh
# or in the environment, as values are only set if the variable is empty.
#
[ -e $KOBO_SCRIPT_DIR/build-config-user.sh ] && . $KOBO_SCRIPT_DIR/build-config-user.sh

# Where produced binaries should be installed to. It must not have a trailing slash.
def_device_root=/home/max/Prog/kobolabs/build/chroot
DEVICEROOT=${DEVICEROOT:-$def_device_root}

def_archives_dir=$KOBO_SCRIPT_DIR/../packages
def_patches_dir=$KOBO_SCRIPT_DIR/../patches
ARCHIVESDIR=${ARCHIVESDIR:-$def_archives_dir}
PATCHESDIR=${PATCHESDIR:-$def_patches_dir}

# How to invoke make
MAKE=${MAKE:-"make"}
MAKE_JOBS=${MAKE_JOBS:-"2"}

CROSSTARGET=${CROSSTARGET:-"arm-linux-gnueabihf"}
BUILDHOST=${BUILDHOST:-"x86_64-pc-linux-gnu"}

# Invocation of tools. These should NOT be exported to the environment; the
# individual scripts decide how and when to pass them to commands.
CPPFLAGS=${CPPFLAGS:-"-I${DEVICEROOT}/include -I${DEVICEROOT}/usr/include"}
CFLAGS="-O2 -ffast-math -pipe -fomit-frame-pointer -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mthumb -mfloat-abi=hard -fno-finite-math-only -fno-stack-protector -U_FORTIFY_SOURCE -fPIC -DKOBO_PLATFORM"
CFLAGS=${CFLAGS:-"${CPPFLAGS}"}
LIBS=${LIBS:-"-L${DEVICEROOT}/lib -L${DEVICEROOT}/usr/lib"}
LDFLAGS=${LDFLAGS:-"${LIBS}"}

LIBTOOL=${LIBTOOL:-"${DEVICEROOT}/usr/local/bin/${CROSSTARGET}-libtool"}
CC=${CC:-"${CROSSTARGET}-gcc"}

# Qt options are empty by default, but may be overridden by the user.
QT_EXTRA_ARGS="${QT_EXTRA_ARGS:-}"
