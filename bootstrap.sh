#!/bin/sh

# This scripts is called by curtin.
# Check /etc/maas/preseeds/curtin_userdata_centos for the invocation

# Install ssh server and some tools
yum -y install openssh-server net-tools nano wget gcc rpm-build kernel-devel-$(uname-r)
systemctl enable sshd

# Infiniband support
yum -y groupinstall "Infiniband Support"
systemctl enable rdma
yum -y install mstflint

# Install and configure avahi (AKA Bonjour)
#yum -y install avahi-daemon avahi-tools
#systemctl enable avahi-daemon
#sed --in-place=.orig "s/#host-name=foo/host-name=$(hostname)/" /etc/avahi/avahi-daemon.conf

# Update
yum -y update

rm /srv/.pass

exit 0
