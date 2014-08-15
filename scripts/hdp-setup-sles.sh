#!/bin/bash

# Usage:
#   ./hdp-setup-sles.sh
#   ./run-remote-command.sh scripts/hdp-setup-sles.sh

# Configure NTP
zypper --non-interactive --no-gpg-checks install ntp
/etc/init.d/ntp start
# Disable selinux
echo 0 > /selinux/enforce
