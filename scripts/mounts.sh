#!/bin/bash

source $SCRIPTS/scripts/func.sh

cd /
ebegin "Mount boot..."
mount /dev/sda1 /mnt/gentoo/boot >> $SCRIPTS/build.log
eend $?
ebegin "Mount proc..."
mount -t proc proc /mnt/gentoo/proc >> $SCRIPTS/build.log
eend $?
ebegin "Mount dev..."
mount --rbind /dev /mnt/gentoo/dev >> $SCRIPTS/build.log
eend $?
ebegin "Mount sys..."
mount --rbind /sys /mnt/gentoo/sys >> $SCRIPTS/build.log
eend $?
