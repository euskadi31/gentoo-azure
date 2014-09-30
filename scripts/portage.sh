#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Copy make.conf..."
cp -f $SCRIPTS/scripts/make.conf /mnt/gentoo/etc/portage/ >> $SCRIPTS/build.log
eend $?

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync
emerge app-portage/eix app-editors/vim app-shells/bash
EOF
