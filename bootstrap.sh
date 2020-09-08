#!/bin/sh

yum -y install openssh-server net-tools nano
systemctl enable sshd

# Infiniband support
yum -y groupinstall "Infiniband Support"
systemctl enable rdma

yum -y update

exit 0
