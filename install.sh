#!/bin/bash

# Set root password from environment variable
echo "root:${LINUX_ROOT_PWD}" | chpasswd

# Create user account from environment variables
useradd -rm -d /home/${LINUX_INSTALLER_USERID} -s /bin/bash -g root -G sudo ${LINUX_INSTALLER_USERID}
echo "${LINUX_INSTALLER_USERID}:${LINUX_INSTALLER_PWD}" | chpasswd

# Start the SSH server
/usr/sbin/sshd -D
