#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y openssh-server
mkdir -p /home/vagrant/.ssh
cp /vagrant/id_rsa.pub /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

