#!/bin/bash

if [[ -z $SCRIPTS ]]
then
    SCRIPTS=.
fi

source $SCRIPTS/scripts/func.sh

if [[ -z $STAGE3 ]]
then
    eerror "STAGE3 environment variable must be set to a timestamp."
    exit 1
fi


chmod +x $SCRIPTS/scripts/*.sh

for script in \
  partition   \
  stage3      \
  mounts      \
  resolv.conf \
  portage     \
  layman      \
  timezone    \
  fstab       \
  kernel      \
  grub        \
  network     \
  user        \
  cleanup
do
  "$SCRIPTS/scripts/$script.sh"
done

einfo "All done."
