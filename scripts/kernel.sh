#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Copy resolv.conf..."
eend $(cp $SCRIPTS/scripts/kernel.config /mnt/gentoo/tmp/ >> $SCRIPTS/build.log)

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge sys-kernel/gentoo-sources
emerge sys-kernel/genkernel
cd /usr/src/linux
mv /tmp/kernel.config .config
genkernel --install --symlink --oldconfig all
emerge -c sys-kernel/genkernel
EOF
