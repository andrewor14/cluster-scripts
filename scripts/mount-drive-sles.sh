#!/bin/bash

# WARNING: This script is written specifically for SLES 11 (ami-7fd3ae4f)
# launched with at least one instance store. The names of devices and mount
# directories may not apply.

if [[ "$#" -le 2 ]]; then
  echo "Usage: ./mount-drive-sles.sh [drive name] [mount point]"
  echo "  e.g. ./mount-drive-sles.sh /dev/xvdb /mnt"
  exit 1
fi

mount "$1" "$2"
lsblk

