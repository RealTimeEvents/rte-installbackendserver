ECHO "%~2"
SETLOCAL ENABLEDELAYEDEXPANSION
@ECHO ******************************
@ECHO Install the RTE Backend Server
@ECHO ******************************

:: Check if parameter is provided
IF "%~1"=="" (
    set /P _github_token=GitHub Token:
    ) else (
    set _github_token="%~1"
)
@ECHO ** Setup security
ssh -t -E d:\dropbox\projects\rte\rte-installbackendserver\logs\rte-installbackendserver.log root@188.166.154.196 "echo 'y' | sudo ufw enable;sudo ufw allow OpenSSH;sudo apt update;sudo apt install openssh-server;sudo ufw allow 22;sudo systemctl start ssh"
@ECHO ** Copy install scripts
scp d:\dropbox\projects\rte\rte-installbackendserver\src\rte-installbackendserver\rte-installbackendserver_s1.* root@188.166.154.196://usr/local/share
@ECHO ** Run install script on the server
ssh -t -E d:\dropbox\projects\rte\rte-installbackendserver\logs\rte-installbackendserver.log root@188.166.154.196 "export GITHUB_TOKEN=$1;cd /usr/local/share;cd /usr/local/share;bash -x /usr/local/share/rte-installbackendserver_s1.sh rte-installbackendserver_s1.ini %_github_token%"
