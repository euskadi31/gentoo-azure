#!/bin/bash

cp -f $SCRIPTS/scripts/make.conf /mnt/gentoo/etc/portage/

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync
emerge app-portage/eix app-editors/vim app-portage/layman
emerge --oneshot >=app-shells/bash-4.2_p48-r1
EOF
