#!/bin/bash

# Usage:
#  sudo ./cdh-setup-sles.sh
#  ./run-remote-command cdh-setup-sles.sh slaves

# Configure NTP
zypper --non-interactive install ntp
/etc/init.d/ntp start
# Ignore zypper gpg checks
zypper --no-gpg-checks search ntp
# Disable selinux
echo 0 > /selinux/enforce
# Disable swappiness
echo 0 > /proc/sys/vm/swappiness

