#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Copy make.conf..."
cp -f $SCRIPTS/scripts/make.conf /mnt/gentoo/etc/portage/ >> $SCRIPTS/build.log
end $?

chroot /mnt/gentoo /bin/bash <<'EOF'
mkdir /usr/portage
emerge-webrsync
emerge app-portage/eix app-editors/vim app-portage/layman
mkdir -p /var/lib/layman
echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf
emerge --oneshot >=app-shells/bash-4.2_p48-r1
EOF
