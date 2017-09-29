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

# extract prebuilt ramdisk
if [ ! -e "$TOP/prebuilt/bootimg.cfg" ];
then
    cd $TOP/prebuilt
    abootimg -x boot.img
    sed -i '/bootsize =/d' bootimg.cfg
    cd $TOP
fi

# create boot img with kernel and ramdisk
mkdir -p $TOP/out
rm -rf $TOP/out/*
$TOP/mkimage $TOP/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb KERNEL > $TOP/out/zImage
abootimg --create $TOP/out/boot.img -f $TOP/prebuilt/bootimg.cfg -k $TOP/out/zImage -r $TOP/prebuilt/initrd.img

# done
echo "Output folder: $TOP/out"

