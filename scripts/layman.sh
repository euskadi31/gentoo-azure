#!/bin/bash

#!/bin/bash

source $SCRIPTS/scripts/func.sh

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge app-portage/layman
mkdir -p /var/lib/layman
echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf
wget https://raw.githubusercontent.com/euskadi31/azure-overlay/master/azure-overlay.xml -P /etc/layman/overlays
layman -a azure-overlay
EOF
