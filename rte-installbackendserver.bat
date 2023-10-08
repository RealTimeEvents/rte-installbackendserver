ECHO "%~2"
SETLOCAL ENABLEDELAYEDEXPANSION
@ECHO ******************************
@ECHO Install the RTE Backend Server
@ECHO ******************************

:: Set the debug level
IF /I "%~2"=="ON" (
    set _debug=ON
    ) ELSE (
    set _debug=OFF
)
@ECHO %_debug%

:: Check if configuration is provided
if "%~1"=="" (
    set /P _configuration_name=Configuration name:
) else (
    set _configuration_name="%~1"
)
if %GITHUB_TOKEN%=="" (
    set /P _github_token=GitHub Token:
) else (
    set _github_token=%GITHUB_TOKEN%
)

IF /I %_configuration_name%=="docker" (
    CALL :SetDockerConfig
) ELSE IF /I %_configuration_name%=="prod" (
    CALL :SetProdConfig
)

:Exit
@ECHO ** Setup security
ssh -t -E logs\rte-installbackendserver.log root@%_host% %_port_ssh% "echo 'y' | sudo ufw enable;sudo ufw allow OpenSSH;sudo apt update;sudo apt install openssh-server;sudo ufw allow 22;sudo systemctl start ssh"
@ECHO ** Copy install scripts
scp %_port_scp% src\rte-installbackendserver\rte-installbackendserver_s1.* root@%_host%://usr/local/share
@ECHO ** Run install script on the server
ssh -t -E logs\rte-installbackendserver.log root@%_host%  %_port_ssh% "cd /usr/local/share;cd /usr/local/share;bash -x /usr/local/share/rte-installbackendserver_s1.sh rte-installbackendserver_s1.ini %_github_token%"
EXIT /B

:SetDockerConfig
SET _host=localhost
SET _port_ssh=-p 2222
SET _port_scp=-P 2222
goto :eof

:SetProdConfig
SET _host=188.166.154.196
SET _port_ssh=""
SET _port_scp=""
goto :eof
