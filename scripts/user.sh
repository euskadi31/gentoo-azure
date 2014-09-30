#!/bin/bash

chroot /mnt/gentoo /bin/bash <<'EOF'
USE="-sendmail" emerge app-admin/sudo
emerge net-fs/nfs-utils
useradd -m -s /bin/bash azure
echo azure:A1z2e4 | chpasswd
echo 'azure ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/azure
rc-update add sshd default
EOF
