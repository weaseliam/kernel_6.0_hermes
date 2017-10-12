#!/bin/bash

RAMDISK_DIR="ramdisk"

# create empty folders
mkdir $RAMDISK_DIR/data
mkdir $RAMDISK_DIR/dev
mkdir $RAMDISK_DIR/oem
mkdir $RAMDISK_DIR/proc
mkdir $RAMDISK_DIR/sys
mkdir $RAMDISK_DIR/system

# set permissions
chmod 771 $RAMDISK_DIR/data
chmod 755 $RAMDISK_DIR/dev
chmod 755 $RAMDISK_DIR/oem
chmod 755 $RAMDISK_DIR/proc
chmod 750 $RAMDISK_DIR/sbin
chmod 755 $RAMDISK_DIR/sys
chmod 755 $RAMDISK_DIR/system

chmod 777 $RAMDISK_DIR/charger
chmod 644 $RAMDISK_DIR/default.prop
chmod 644 $RAMDISK_DIR/enableswap.sh
chmod 644 $RAMDISK_DIR/factory_init.project.rc
chmod 644 $RAMDISK_DIR/factory_init.rc
chmod 644 $RAMDISK_DIR/file_contexts
chmod 640 $RAMDISK_DIR/fstab.mt6795
chmod 750 $RAMDISK_DIR/init
chmod 750 $RAMDISK_DIR/init.aee.rc
chmod 750 $RAMDISK_DIR/init.common_svc.rc
chmod 750 $RAMDISK_DIR/init.environ.rc
chmod 750 $RAMDISK_DIR/init.mal.rc
chmod 750 $RAMDISK_DIR/init.modem.rc
chmod 750 $RAMDISK_DIR/init.mt6595.rc
chmod 750 $RAMDISK_DIR/init.mt6795.rc
chmod 750 $RAMDISK_DIR/init.mt6795.usb.rc
chmod 750 $RAMDISK_DIR/init.project.rc
chmod 750 $RAMDISK_DIR/init.rc
chmod 750 $RAMDISK_DIR/init.trace.rc
chmod 750 $RAMDISK_DIR/init.usb.rc
chmod 750 $RAMDISK_DIR/init.volte.rc
chmod 750 $RAMDISK_DIR/init.xlog.rc
chmod 750 $RAMDISK_DIR/init.zygote32.rc
chmod 750 $RAMDISK_DIR/init.zygote64_32.rc
chmod 644 $RAMDISK_DIR/meta_init.modem.rc
chmod 644 $RAMDISK_DIR/meta_init.project.rc
chmod 644 $RAMDISK_DIR/meta_init.rc
chmod 644 $RAMDISK_DIR/property_contexts
chmod 644 $RAMDISK_DIR/seapp_contexts
chmod 644 $RAMDISK_DIR/selinux_version
chmod 644 $RAMDISK_DIR/sepolicy
chmod 644 $RAMDISK_DIR/service_contexts
chmod 644 $RAMDISK_DIR/ueventd.mt6595.rc
chmod 644 $RAMDISK_DIR/ueventd.mt6795.rc
chmod 644 $RAMDISK_DIR/ueventd.rc
chmod 644 $RAMDISK_DIR/verity_key

chmod 750 $RAMDISK_DIR/sbin/adbd
chmod 750 $RAMDISK_DIR/sbin/healthd
chmod 750 $RAMDISK_DIR/sbin/multi_init
chmod 750 $RAMDISK_DIR/sbin/sysinit
chmod 777 $RAMDISK_DIR/sbin/ueventd
chmod 777 $RAMDISK_DIR/sbin/watchdogd
