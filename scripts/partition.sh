#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Create partition..."
sgdisk \
  -n 1:0:+128M -t 1:8300 -c 1:"linux-boot" \
  -n 2:0:+32M  -t 2:ef02 -c 2:"bios-boot"  \
  -n 3:0:+1G   -t 3:8200 -c 3:"swap"       \
  -n 4:0:0     -t 4:8300 -c 4:"linux-root" \
  -p /dev/sda >> $SCRIPTS/build.log
end $?

ebegin "Sync partition..."
sync >> $SCRIPTS/build.log
end $?

ebegin "Make ext2..."
mkfs.ext2 /dev/sda1 >> $SCRIPTS/build.log
end $?

ebegin "Make ext4..."
mkfs.ext4 /dev/sda4 >> $SCRIPTS/build.log
end $?

ebegin "Make swap..."
mkswap /dev/sda3 >> $SCRIPTS/build.log
end $?

ebegin "Enable swap..."
swapon /dev/sda3 >> $SCRIPTS/build.log
end $?
