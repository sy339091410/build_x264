#!/bin/bash
	
	echo ">>>>>>>>> build x264 for android arm-v7a <<<<<<<<"
	
	#NDK位置，编译结果保存位置
	export NDK=/home/tsdl/Android/Sdk/ndk/android-ndk-r24-linux/android-ndk-r24
	export TARGET=~/x264/build_arm64-v8a
	
	#C、C++编译器所在位置
	export PLATFORM=linux-x86_64
	export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$PLATFORM
	export CC=$TOOLCHAIN/bin/aarch64-linux-android28-clang
	export CXX=$TOOLCHAIN/bin/aarch64-linux-android28-clang++
	
	
	function build
	{
	echo ">>>>>>>> build start <<<<<<<<<<"
	
	  ./configure \
	  --prefix=$TARGET \
	  --enable-static \
	  --enable-shared \
	  --enable-pic \
	  --disable-asm \
	  --disable-opencl \
	  --disable-cli \
	  --sysroot=$TOOLCHAIN/sysroot \
	
	make clean
	make
	make install
	
	echo ">>>>>> build done <<<<<<"
	}
	
	build