#!/bin/bash

# Update
apt update && apt upgrade -y

# Install tools
apt install -y build-essential apt-transport-https ca-certificates curl software-properties-common ufw 

# Install Node
curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt install nodejs -y

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt install -y docker-ce
systemctl status docker
sudo usermod -aG docker ${USER}
