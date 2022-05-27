#!/bin/bash

sudo apt update && apt install git
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

cd /home/ubuntu/
git clone https://github.com/connext/nxtp-router-docker-compose.git
cd /home/ubuntu/nxtp-router-docker-compose
git config --global --add safe.directory /home/ubuntu/nxtp-router-docker-compose
git checkout amarok


cp .env.example .env
sed -i 's/latest/0.2.0-beta.8/g' .env
cp config.example.json config.json
cp key.example.yaml key.yaml
sed -i 's/dkadkjasjdlkasdladadasda/'$1'/g' key.yaml

docker-compose create
docker-compose up -d