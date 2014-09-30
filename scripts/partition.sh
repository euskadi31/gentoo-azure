#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Create partition..."
eend $(sgdisk \
  -n 1:0:+128M -t 1:8300 -c 1:"linux-boot" \
  -n 2:0:+32M  -t 2:ef02 -c 2:"bios-boot"  \
  -n 3:0:+1G   -t 3:8200 -c 3:"swap"       \
  -n 4:0:0     -t 4:8300 -c 4:"linux-root" \
  -p /dev/sda >> $SCRIPTS/build.log)

ebegin "Sync partition..."
eend $(sync >> $SCRIPTS/build.log)

ebegin "Make ext2..."
eend $(mkfs.ext2 /dev/sda1 >> $SCRIPTS/build.log)

ebegin "Make ext4..."
eend $(mkfs.ext4 /dev/sda4 >> $SCRIPTS/build.log)

ebegin "Make swap..."
eend $(mkswap /dev/sda3 >> $SCRIPTS/build.log)
ebegin "Enable swap..."
eend $(swapon /dev/sda3 >> $SCRIPTS/build.log)
