#!/bin/bash

source $SCRIPTS/scripts/func.sh

tarball=stage3-amd64-nomultilib-$STAGE3.tar.bz2

ebegin "Mount Gentoo..."
eend $(mount /dev/sda4 /mnt/gentoo >> $SCRIPTS/build.log)

cd /mnt/gentoo

ebegin "Download stage3..."
eend $(wget http://distfiles.gentoo.org/releases/amd64/autobuilds/$STAGE3/$tarball >> $SCRIPTS/build.log)

ebegin "Extract stage3..."
eend $(tar -xjpf $tarball >> $SCRIPTS/build.log)

ebegin "Remove stage3 archive..."
eend $(rm -f $tarball >> $SCRIPTS/build.log)
