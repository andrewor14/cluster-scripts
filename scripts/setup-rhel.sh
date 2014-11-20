#!/bin/bash

# Usage:
#   ./setup-rhel.sh
#   ./run-remote-command.sh scripts/setup-rhel.sh

# Install git
yum -y install git
# Disable iptables
service iptables stop
service iptables save
chkconfig iptables off
# Configure NTP
yum -y install ntp
chkconfig ntpd on
service ntpd start
# Disable selinux and swappiness
content=$(sed s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config)
echo "$content" > /etc/selinux/config
echo 0 > /proc/sys/vm/swappiness

