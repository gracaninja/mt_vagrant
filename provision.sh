#!/usr/bin/env bash

USER=vagrant
HOME=/home/$USER/
NR_PROCESSORS=$(grep -c ^processor /proc/cpuinfo)

echo "HOME " + $HOME
echo "NR PROCESSORS: " + $NR_PROCESSORS


su $USER 

echo "Updating packages"
sudo apt-get update

echo "Adding base packages"
sudo apt-get -y install git
sudo apt-get -y install emacs23-lucid
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
## Back to base directory
cd $HOME


echo "Copying moses"
echo $PWD
git clone git://github.com/moses-smt/mosesdecoder.git
cd $HOME/mosesdecoder/
echo $PWD

echo "Starting to compile moses"
bjam --with-cmph=/user/local/ -j$NR_PROCESSORS

cd $HOME

echo "Copying sample models"
wget http://www.statmt.org/moses/download/sample-models.tgz
tar -xzvf sample-models.tgz





