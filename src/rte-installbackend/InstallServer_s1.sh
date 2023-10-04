#!/bin/bash
#clear

# Variables
ini=$1 # Ini configuration file specific to platform and machine
usr_dir=/usr
venv_dir=$usr_dir/venv
rte_install_venv=$venv_dir/rte_install_env
rte_install_dir=$rte_install_venv/lib/python3.8/site-packages/rte/install

# Create instlation sudo user
user_name=rtinstall
#useradd $user_name
adduser $user_name
usermod -aG sudo $user_name

# Install pre-req packages
apt update
apt-get -y install python3-pip
apt-get -y install mysql-server
apt-get -y install python3-venv

# Install home-grown packages
mkdir $venv_dir
chmod 777 $venv_dir
python3 -m venv --clear $rte_install_venv
source $rte_install_venv/bin/activate
echo 'machine github.com login hendrikdutoit password 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' >> ~/.netrc
pip install --upgrade git+https://github.com/hendrikdutoit/RealTimeEvents.git
pip install --upgrade InstallIt

#Install and configure the server packages
python3 $rte_install_dir/installserver.py -c $rte_install_dir/InstallServer_s1.ini


# Prompt to close the session
echo Session completed
echo Press any key to finish and quit
read quit
