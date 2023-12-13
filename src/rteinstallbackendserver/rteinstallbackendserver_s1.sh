#!/bin/bash
#clear

# Exit on any error
#set -e

# Variables
_github_org="RealTimeEvents"
_github_token=$2
_ini=$1 # Ini configuration file specific to platform and machine
_repo_name="rteinstallbackendserver"
_venv_base_dir="/usr/venv"
_share_dir="/usr/local/share"
_src_dir="/usr/local/src"

_github_url="https://$_github_token:@github.com/$_github_org/$_repo_name.git"
_venv_name_dir="$_venv_base_dir/$_repo_name"

echo "** Set the environment variables"
mv $_share_dir/env_var.sh /etc/profile.d
chmod +x /etc/profile.d/env_var.sh
source /etc/profile.d/env_var.sh

echo "** Create installation sudo user"
#_user_name=rtinstall
#useradd $_user_name
#adduser $_user_name
#usermod -aG sudo $_user_name
useradd -rm -d /home/${LINUX_INSTALLER_USERID} -s /bin/bash -g root -G sudo ${LINUX_INSTALLER_USERID}
echo ${LINUX_INSTALLER_USERID}:${LINUX_INSTALLER_PWD} | chpasswd

echo "** Install pre-req packages"
apt update
apt-get -y install python3-pip
apt-get -y install python3-venv

echo "** Create virtual environment"
mkdir $_venv_base_dir
chmod 777 $_venv_base_dir
python3 -m venv --clear $_venv_name_dir
source $_venv_name_dir/bin/activate
pip install --upgrade InstallIt

echo "Cloning the private repository from GitHub..."
cd $_src_dir
git clone $_github_url

echo "** Install and configure the server packages"
cd $_repo_name
pip install -e .
#
echo "** Start the Python installation"
python3 src/$_repo_name/$_repo_name.py -c src/$_repo_name/$_ini

@ECHO ** Prompt to close the session
echo Session completed
echo Press any key to f_inish and quit
read quit





# Step 2: Navigate into the repository directory and install the python package
#cd $REPO_NAME
#echo "Installing the python package..."
#pip install .

# Step 3: Cleanup (Optional: Remove the cloned repository after installation)
#cd ..
#rm -rf $REPO_NAME
#URS Prod / 2 GB Memory / 1 Intel vCPU / 50 GB Disk / LON1 - Ubuntu urs-prod-backend-clean
#URS Prod / 2 GB Memory / 1 Intel vCPU / 50 GB Disk / LON1 - Ubuntu urs-prod-backend-clean
