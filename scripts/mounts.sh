#!/bin/bash

source $SCRIPTS/scripts/func.sh

cd /
ebegin "Mount boot..."
mount /dev/sda1 /mnt/gentoo/boot >> $SCRIPTS/build.log
end $?
ebegin "Mount proc..."
mount -t proc proc /mnt/gentoo/proc >> $SCRIPTS/build.log
end $?
ebegin "Mount dev..."
mount --rbind /dev /mnt/gentoo/dev >> $SCRIPTS/build.log
end $?
ebegin "Mount sys..."
mount --rbind /sys /mnt/gentoo/sys >> $SCRIPTS/build.log
end $?
