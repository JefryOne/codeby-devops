#!/bin/bash
# Установка необходимых пакетов
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y openssh-client sshpass

# Создание SSH ключа
ssh-keygen -t rsa -b 2048 -f /home/vagrant/.ssh/id_rsa -q -N ""
sudo chown vagrant:vagrant ~/.ssh/id_rsa.pub
sudo chown vagrant:vagrant ~/.ssh/id_rsa
# Копирование публичного ключа на сервер
sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.56.102
