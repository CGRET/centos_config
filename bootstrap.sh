#!/bin/sh

yum -y install openssh-server net-tools
systemctl enable sshd

# Infiniband support
yum -y groupinstall "Infiniband Support"
systemctl enable rdma

yum -y update
