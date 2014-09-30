#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Clean sda..."
dd if=/dev/zero of=/dev/sda bs=512 count=1 conv=notrunc >> $SCRIPTS/build.log
eend $?

ebegin "Create partition..."
sgdisk \
  -n 1:0:+128M -t 1:8300 -c 1:"linux-boot" \
  -n 2:0:+32M  -t 2:ef02 -c 2:"bios-boot"  \
  -n 3:0:+1G   -t 3:8200 -c 3:"swap"       \
  -n 4:0:0     -t 4:8300 -c 4:"linux-root" \
  -p /dev/sda >> $SCRIPTS/build.log
eend $?

ebegin "Sync partition..."
sync >> $SCRIPTS/build.log
eend $?

ebegin "Make ext2..."
mkfs.ext2 /dev/sda1 >> $SCRIPTS/build.log
eend $?

ebegin "Make ext4..."
mkfs.ext4 /dev/sda4 >> $SCRIPTS/build.log
eend $?

ebegin "Make swap..."
mkswap /dev/sda3 >> $SCRIPTS/build.log
eend $?

ebegin "Enable swap..."
swapon /dev/sda3 >> $SCRIPTS/build.log
eend $?
