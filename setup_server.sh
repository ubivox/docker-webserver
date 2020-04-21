#!/bin/bash

# Export the vars in .env into your shell:
export $(egrep -v '^#' .env | xargs)

# Set dir
DIR="$(dirname "$(readlink -f "$0")")"

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

# Start docker
docker-compose -f webserver/docker-compose.yml -d --build

# Setup webserver
echo "Setting up password for openlitespeed webserver webadmin on port 7080"
echo "Please enter password"
read WEBSERVER_ADMIN_PASSWORD

bin/webadmin.sh $WEBSERVER_ADMIN_PASSWORD

# Update webserver to newest
bin/webadmin.sh -U

# Activate modsecure OWASP
bin/webadmin.sh -M enable