#!/bin/bash

# prepare env
export TOP=$(pwd)
export TOOLCHAIN=$TOP/../aarch64-linux-android-4.9-linaro-master/bin/aarch64-linux-android-
export CROSS_COMPILE=$TOOLCHAIN
echo "Work folder: $TOP"
echo "Toolchain: $TOOLCHAIN"

# compile kernel
mkdir -p $TOP/KERNEL_OBJ
make -C kernel-3.10 O=$TOP/KERNEL_OBJ ARCH=arm64 MTK_TARGET_PROJECT=hermes TARGET_BUILD_VARIANT=user CROSS_COMPILE=$TOOLCHAIN ROOTDIR=$TOP hermes_defconfig
make -C kernel-3.10 O=$TOP/KERNEL_OBJ ROOTDIR=$TOP

# clear output folder
mkdir -p $TOP/out
rm -rf $TOP/out/*

# pack kernel
$TOP/tools/mkimage $TOP/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb KERNEL > $TOP/out/zImage
echo "Kernel: $TOP/out/zImage"

# pack ramdisk
$TOP/tools/repack_ramdisk $TOP/ramdisk out/initrd.img
echo "Ramdisk: $TOP/out/initrd.img"

# pack boot.img
$TOP/tools/abootimg --create $TOP/out/boot.img -f $TOP/bootimg.cfg -k $TOP/out/zImage -r $TOP/out/initrd.img

# done
echo "boot.img to be flashed: $TOP/out/boot.img"
