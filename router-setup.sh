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
sed -i 's/latest/sha-0039612/g' .env
cp config.example.json config.json
echo 'type: "azure-secret"\nkeyType: "SECP256K1"\nauthenticationMode: "CLIENT_SECRET"' > key.yaml
echo 'clientId: "'$1'"' >> key.yaml
echo 'clientSecret: "'$2'"' >> key.yaml
echo 'tenantId: "'$3'"' >> key.yaml
echo 'vaultName: "'$4'"' >> key.yaml
echo 'secretName: "'$5'"' >> key.yaml

cat key.yaml

docker-compose create
docker-compose up -d