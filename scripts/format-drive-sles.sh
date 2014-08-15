#!/bin/bash

# WARNING: This script is written specifically for SLES 11 (ami-7fd3ae4f)
# The names of devices and root volume sizes may not apply

umount /mnt
parted -s /dev/hda rm 1
parted -s /dev/hda mkpart logical 0GB 40GB
parted -s /dev/hda print list
parted -s /dev/hda name 1 new-partition
mkfs.ext3 /dev/hda1
mount /dev/hda1 /mnt
lsblk

