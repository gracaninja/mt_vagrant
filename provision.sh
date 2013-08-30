#!/usr/bin/env bash


echo "Updating packages"
sudo apt-get update

echo "Adding base packages"
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install build-essential libz-dev libbz2-dev
sudo apt-get -y install  libxmlrpc-c3-dev


echo "Getting cmph"
wget http://downloads.sourceforge.net/project/cmph/cmph/cmph-2.0.tar.gz
tar -xzvf cmph-2.0.tar.gz
cd cmph-2.0
./configure
make
sudo make install


echo "Copying moses"
cp -R /vagrant/mosesdecoder/ .
cd mosesdecoder/

echo "Starting to compile moses"
./bjam --with-cmph=/user/local/ 


echo "Copying sample models"
cp /vagrant/sample-models.tgz .
tar -xzvf sample-models.tgz
cd sample-models/




