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

# Install docker composer
curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Instructions
echo "Create a .env file. Look at .env_example for inspiration."
echo ""
echo "Then run the following command inside the webserver folder to start the server:"
echo ""
echo "Boot up Webserver using docker"
echo "docker-compose docker-compose.yml up -d"
echo ""
echo "Set openlitespeed webser UI admin password (!IMPORTANT)"
echo "bin/webadmin.sh [PASSWORD]"
echo ""
echo "Enable ModSecurity OWASP Rules"
echo "bin/webadmin.sh -M enable"
echo ""
echo "Upgrade OLS Webserver to latest version"
echo "bin/webadmin.sh -U"
echo ""
echo "More information: https://github.com/ubivox/webserver"
echo ""
