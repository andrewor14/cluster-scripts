#!/bin/bash

# This script is written for ami-7fd3ae4f (SLES 11).
# 
# Usage:
#   ./setup-sles.sh
#   ./run-remote-command.sh scripts/setup-sles.sh

# Configure NTP
zypper --non-interactive --no-gpg-checks install ntp
/etc/init.d/ntp start
# Disable selinux and swappiness
echo 0 > /selinux/enforce
echo 0 > /proc/sys/vm/swappiness
# Install Java
wget http://javadl.sun.com/webapps/download/AutoDL?BundleId=95115 -O jre-7u67-linux-x64.rpm
rpm -ivh jre-7u67-linux-x64.rpm

