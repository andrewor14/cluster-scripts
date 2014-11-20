#!/bin/bash

# This script is written for ami-7fd3ae4f (SLES 11).
# 
# Usage:
#   ./setup-sles.sh
#   ./run-remote-command.sh scripts/setup-sles.sh

# Install git
zypper addrepo http://download.opensuse.org/repositories/devel:/languages:/perl/SLE_11_SP3/devel:languages:perl.repo
zypper addrepo http://download.opensuse.org/repositories/devel:/tools:/scm/SLE_11_SP2/devel:tools:scm.repo
zypper --non-interactive --no-gpg-checks install git
git config --global core.pager more
# Configure NTP
zypper --non-interactive --no-gpg-checks install ntp
/etc/init.d/ntp start
# Disable selinux and swappiness
echo 0 > /selinux/enforce
echo 0 > /proc/sys/vm/swappiness
# Install Java
wget http://javadl.sun.com/webapps/download/AutoDL?BundleId=95115 -O jre-7u67-linux-x64.rpm
rpm -ivh jre-7u67-linux-x64.rpm
rm jre-7u67-linux-x64.rpm
