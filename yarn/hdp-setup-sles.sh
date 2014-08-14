#!/bin/bash

# Usage:
#   ./hdp-setup-sles.sh
#   ./run-remote-command hdp-setup-sles.sh slaves

# Configure NTP
zypper --non-interactive install ntp
/etc/init.d/ntp start
# Disable selinux
echo 0 > /selinux/enforce
