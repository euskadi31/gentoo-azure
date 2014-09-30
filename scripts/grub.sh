#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
emerge ">=sys-boot/grub-2.0"
echo "set timeout=0" >> /etc/grub.d/40_custom
sed -i -e 's/GRUB_CMDLINE_LINUX="net.ifnames=0"/GRUB_CMDLINE_LINUX="net.ifnames=0 console=ttyS0 earlyprintk=ttyS0 rootdelay=300"/g' /etc/default/grub
grub2-install /dev/sda
grub2-mkconfig -o /boot/grub/grub.cfg
EOF
