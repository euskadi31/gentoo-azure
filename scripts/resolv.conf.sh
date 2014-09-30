#!/bin/bash

source $SCRIPTS/scripts/func.sh

ebegin "Copy resolv.conf..."
eend $(cp -L /etc/resolv.conf /mnt/gentoo/etc/ >> $SCRIPTS/build.log)

