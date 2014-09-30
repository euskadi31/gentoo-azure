#!/bin/bash

source $SCRIPTS/scripts/func.sh

tarball=stage3-amd64-nomultilib-$STAGE3.tar.bz2

ebegin "Mount Gentoo..."
mount /dev/sda4 /mnt/gentoo >> $SCRIPTS/build.log
end $?

cd /mnt/gentoo

ebegin "Download stage3..."
wget http://distfiles.gentoo.org/releases/amd64/autobuilds/$STAGE3/$tarball >> $SCRIPTS/build.log
end $?

ebegin "Extract stage3..."
tar -xjpf $tarball >> $SCRIPTS/build.log
end $?

ebegin "Remove stage3 archive..."
rm -f $tarball >> $SCRIPTS/build.log
end $?
