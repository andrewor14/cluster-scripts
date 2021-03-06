#!/bin/bash

# WARNING: This script is dangerous because it reformats your drive!
# Currently it is hard-coded to use ext3.

if [[ "$#" -lt 2 ]]; then
  echo "Usage: ./mount-drive.sh [drive name] [mount point]"
  echo "  e.g. ./mount-drive.sh /dev/xvdb /mnt"
  exit 1
fi

mkfs.ext3 "$1"
mount -t ext3 "$1" "$2"
lsblk

