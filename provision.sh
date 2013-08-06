#!/usr/bin/env bash


## Verify if we already run provision code
#if [ -f "/var/vagrant_provision" ]; 
#     then exit 0
#fi

echo "Updating packages"
sudo apt-get update

echo "Adding base packages"
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install build-essential libz-dev libbz2-dev
sudo apt-get -y install  libxmlrpc-c3-dev

echo "Copying moses"
cp -R /vagrant/mosesdecoder/ .
cd mosesdecoder/

echo "Starting to compile moses"
./bjam

## Install pip
echo "Updating PIP"
sudo apt-get -y install python-pip
#pip install ipython

echo "Copying sample models"
cp /vagrant/sample-models.tgz .
tar -xzvf sample-models.tgz
cd sample-models/

~/mosesdecoder/bin/mosesserver -f phrase-model/moses.ini --server-log ../translation_log






# ### INDICATE THAT WE ALREADY RUN PROVISIONS

# touch /var/vagrant_provision
