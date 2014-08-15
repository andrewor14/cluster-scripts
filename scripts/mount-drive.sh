#!/bin/bash

if [[ "$#" -le 2 ]]; then
  echo "Usage: ./mount-drive.sh [drive name] [mount point]"
  echo "  e.g. ./mount-drive.sh /dev/xvdb /mnt"
  exit 1
fi

mount "$1" "$2"
lsblk

