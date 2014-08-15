#!/bin/bash

# Usage:
#  ./cdh-setup-sles.sh
#  ./run-remote-command.sh scripts/cdh-setup-sles.sh

# Configure NTP
zypper --non-interactive --no-gpg-checks install ntp
/etc/init.d/ntp start
# Disable selinux and swappiness
echo 0 > /selinux/enforce
echo 0 > /proc/sys/vm/swappiness

