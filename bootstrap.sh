#!/bin/sh

yum -y install openssh-server net-tools nano
systemctl enable sshd

# Infiniband support
yum -y groupinstall "Infiniband Support"
systemctl enable rdma

# Install and configure avahi (AKA Bonjour)
yum -y install avahi-daemon avahi-tools
systemctl enable avahi-daemon
avahi-set-host-name $(hostname)

# Update
yum -y update

exit 0
