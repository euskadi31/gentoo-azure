#!/bin/bash

source $SCRIPTS/scripts/func.sh

cd /
ebegin "Mount boot..."
eend $(mount /dev/sda1 /mnt/gentoo/boot >> $SCRIPTS/build.log)
ebegin "Mount proc..."
eend $(mount -t proc proc /mnt/gentoo/proc >> $SCRIPTS/build.log)
ebegin "Mount dev..."
eend $(mount --rbind /dev /mnt/gentoo/dev >> $SCRIPTS/build.log)
ebegin "Mount sys..."
eend $(mount --rbind /sys /mnt/gentoo/sys >> $SCRIPTS/build.log)
