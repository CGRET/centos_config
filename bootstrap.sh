#!/bin/sh

yum -y install openssh-server net-tools nano
systemctl enable sshd

# Infiniband support
yum -y groupinstall "Infiniband Support"
systemctl enable rdma

# Install and configure avahi (AKA Bonjour)
yum -y install avahi-daemon avahi-tools
systemctl enable avahi-daemon
sed --in-place=.orig "s/#host-name=foo/host-name=$(hostname)/" /etc/avahi/avahi-daemon.conf

# Update
yum -y update

exit 0
