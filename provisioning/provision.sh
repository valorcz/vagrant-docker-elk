#!/bin/bash

# CentOS 8 workaround
sudo yum -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
sudo yum config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce

# Start-up the Docker service
sudo systemctl enable --now docker
sudo systemctl start docker.service

# So that vagrant can work with docker easily
sudo usermod -a -G docker vagrant

# As this doesn't seem to exist by default in CentOS 8
sudo mkdir -p /usr/local/bin/

# Download the Docker compose command
COMPOSE_LATEST=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
sudo curl -sL https://github.com/docker/compose/releases/download/${COMPOSE_LATEST}/docker-compose-linux-`uname -m` -o /usr/local/bin/docker-compose

# Fix the permissions
sudo chmod 755 /usr/local/bin/docker-compose

# Just to make sure it's in the PATH
sudo ln -s /usr/local/bin/docker-compose /usr/bin/

## Start setting-up the cluster
# Version of the ELK stack we'd like to use
cp /vagrant/env ~/.env

#sudo docker-compose -f "/vagrant/docker-elk/docker-compose.yml" up -d
sudo docker-compose -f /vagrant/docker-elk/docker-compose.yml -f /vagrant/docker-elk/extensions/logspout/logspout-compose.yml up -d
