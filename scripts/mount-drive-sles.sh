#!/bin/bash

# WARNING: This script is written specifically for SLES 11 (ami-7fd3ae4f)
# launched with at least one instance store. The names of devices and mount
# directories may not apply.

mount /dev/xvdb /mnt
lsblk

