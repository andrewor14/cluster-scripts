#!/bin/bash

# Disable iptables
service iptables stop
service iptables save
chkconfig iptables off
# Configure NTP
yum -y install ntp
chkconfig ntpd on
service ntpd start
# Disable selinux
content=$(sed s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config)
echo "$content" > /etc/selinux/config

