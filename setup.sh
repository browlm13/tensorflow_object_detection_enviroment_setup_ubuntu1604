#! /bin/sh

#Installing Tensorflow Object Detection on Ubuntu 16.04
#modify scripts permissions chmod 400 setup.sh
#sudo chmod 755 setup.sh
#run
#sudo ./setup.sh
#You should see OK at the end

#update
sudo apt-get update

#install python
#sudo apt-get install python3.6

#install pip
sudo apt-get install python-setuptools python-dev build-essential
sudo easy_install pip

#Install tensorflow for CPU
pip install tensorflow

#Install tensorflow object detection dependencies (https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/installation.md)
sudo apt-get install protobuf-compiler python-pil python-lxml

sudo pip install pillow
sudo pip install lxml
sudo pip install jupyter
sudo pip install matplotlib

#create new tensorflow directory and cd in
mkdir tensorflow
cd tensorflow

#clone github tensorflow object detection (https://github.com/tensorflow/models.git)
git clone https://github.com/tensorflow/models.git

# Protobuf Compilation
# From tensorflow/models/research/
cd models/research/
protoc object_detection/protos/*.proto --python_out=.

#adding libraies to python path
# From tensorflow/models/research/
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

#~/.bashrc file and add line for restart
echo 'export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim' >> ~/.bashrc

#testing installation
python object_detection/builders/model_builder_test.py
