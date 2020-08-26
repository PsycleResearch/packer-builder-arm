sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y install nano screen curl python3-pip libjpeg-dev zlib1g-dev libopenblas-base libopenmpi-dev cryptsetup python3-matplotlib python3-scipy gfortran build-essential libatlas-base-dev
# Pip3 libs installation
pip3 install --upgrade pip
pip3 install Cython==0.29.21
pip3 install numpy==1.19.1
pip3 install git+https://github.com/PsycleResearch/RepsycleDatascience  # TODO: manage authentication
# Torch installation
wget https://nvidia.box.com/shared/static/9eptse6jyly1ggt9axbja2yrmj6pbarc.whl -O /tmp/torch-1.6.0-cp36-cp36m-linux_aarch64.whl
pip3 install /tmp/torch-1.6.0-cp36-cp36m-linux_aarch64.whl
# Torchvision installation
cd /tmp && git clone --branch v0.7.0 https://github.com/pytorch/vision torchvision && cd torchvision && export BUILD_VERSION=0.7.0 && sudo python3 setup.py install
# get-cameras library
wget http://downloads.get-cameras.com/Galaxy_Linux%20armhf_Gige%20U3_32bits%2064bits_1.3.1911.9271.tar.gz -O /tmp/get_cameras_lib.tar.gz
tar xf /tmp/get_cameras_lib.tar.gz -C /tmp
cd /tmp/Galaxy_Linux-armhf_Gige-U3_32bits-64bits_1.3.1911.9271 && sudo ./Galaxy_camera.run  # TODO: check how to automate without user input
# get-cameras library for Python
wget http://downloads.get-cameras.com/Galaxy_Linux_Python_1.0.1905.9081.tar.gz -O /tmp/get_cameras_lib_python.tar.gz
tar xf /tmp/get_cameras_lib_python.tar.gz -C /tmp
cd /tmp/Galaxy_Linux_Python_1.0.1905.9081/api && python3 setup.py build && sudo python3 setup.py install

# Cleaning
rm /home/psycle/examples.desktop
rmdir /home/psycle/Music
rmdir /home/psycle/Pictures
rmdir /home/psycle/Public
rmdir /home/psycle/Templates
rmdir /home/psycle/Videos
rmdir /home/psycle/Documents
# Set the launcher icons to Naulitus and Terminal
gsettings set com.canonical.Unity.Launcher favorites "['application://org.gnome.Nautilus.desktop', 'application://org.gnome.Terminal.desktop']"
