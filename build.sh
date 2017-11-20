#!/bin/sh

# Compiles fftw3 for Android
# Make sure you have NDK_DIR defined in .bashrc or .bash_profile

#NDK Version r9c  http://dl.google.com/android/ndk/android-ndk-r9c-linux-x86_64.tar.bz2
NDK_DIR="/home/qjb/Downloads/android-ndk-r15"
INSTALL_DIR="`pwd`/jni/fftw3"
SRC_DIR="`pwd`/../fftw-3.3.7"

cd $SRC_DIR

export PATH="$NDK_DIR/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin:$PATH"
#export SYS_ROOT="$NDK_DIR/platforms/android-8/arch-arm/"
export SYS_ROOT="$NDK_DIR/platforms/android-26/arch-arm64/"
#export CC="aarch64-linux-android-gcc --sysroot=$SYS_ROOT -march=armv8-a -mfloat-abi=softfp"
export CC="aarch64-linux-android-gcc --sysroot=$SYS_ROOT -march=armv8-a"
export LD="aarch64-linux-android-ld"
export AR="aarch64-linux-android-ar"
export RANLIB="aarch64-linux-android-ranlib"
export STRIP="aarch64-linux-android-strip"
#export CFLAGS="-mfpu=neon -mfloat-abi=softfp"

mkdir -p $INSTALL_DIR
#./configure --host=arm-eabi \
./configure --host=aarch64 \
	--prefix=$INSTALL_DIR \
	LIBS="-lc -lgcc" \
	--enable-float \
#	--enable-threads \
#	--with-combined-threads \
	--enable-neon

make
make install

exit 0
