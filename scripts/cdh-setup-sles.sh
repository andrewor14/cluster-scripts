#!/bin/bash

# Usage:
#  sudo ./cdh-setup-sles.sh
#  ./run-remote-command cdh-setup-sles.sh slaves

# Configure NTP
zypper --non-interactive --no-gpg-checks install ntp
/etc/init.d/ntp start
# Disable selinux and swappiness
echo 0 > /selinux/enforce
echo 0 > /proc/sys/vm/swappiness

