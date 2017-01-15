#!/bin/bash

####################################
#                                  # 
#   ansible install on centos 7    #
#                                  #
####################################
# hadoop cluster 2+3

yum -y update
echo iii|sudo -S yum install -y wget
echo iii|sudo -S easy_install pip
echo iii|sudo rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo iii|sudo -S yum install -y ansible

#### set /etc/ansible/hosts 

echo iii|sudo -S chmod 777 /etc/ansible/*
echo "## Hadoop Setting ##" >> /etc/ansible/hosts
echo "[all]" >> /etc/ansible/hosts
echo "10.120.37.140" >> /etc/ansible/hosts
echo "10.120.37.143" >> /etc/ansible/hosts
echo "10.120.37.144" >> /etc/ansible/hosts
echo "10.120.37.145" >> /etc/ansible/hosts
echo "10.120.37.146" >> /etc/ansible/hosts
echo "[master]" >> /etc/ansible/hosts
echo "10.120.37.140" >> /etc/ansible/hosts
echo "10.120.37.143" >> /etc/ansible/hosts
echo "[slave]" >> /etc/ansible/hosts
echo "10.120.37.144" >> /etc/ansible/hosts
echo "10.120.37.145" >> /etc/ansible/hosts
echo "10.120.37.146" >> /etc/ansible/hosts
echo iii|sudo -S chmod 755 /etc/ansible/*

#### set /etc/hosts

file=/etc/hosts
if [ ! -f "$file" ]; then
  echo iii|sudo -S touch /etc/hosts
fi
echo iii|sudo -S chmod 777 /etc/hosts
echo "10.120.37.140 master1" >> /etc/hosts
echo "10.120.37.143 master2" >> /etc/hosts
echo "10.120.37.144 slaver1" >> /etc/hosts
echo "10.120.37.145 slaver2" >> /etc/hosts
echo "10.120.37.146 slaver3" >> /etc/hosts

echo iii|sudo -S chmod 755 /etc/hosts
ssh-keyscan -4 $(cat /etc/hosts | awk '{print $1}')  >> /home/iii/.ssh/known_hosts




 


