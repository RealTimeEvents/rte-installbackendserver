@ECHO $1
setlocal

:: Stop the existing container if it's running
docker stop rteinstallbackendserver || echo No running container named rteinstallbackendserver

:: Remove the stopped container
docker rm rteinstallbackendserver || echo No container to remove

:: Build the new image
docker build -t rteinstallbackendserver .

:: Run the container
docker run -d -p 2222:22 --name rteinstallbackendserver -e LINUX_ROOT_PWD=%LINUX_ROOT_PWD% -e INSTALLER_USERID=%INSTALLER_USERID% -e INSTALLER_PWD=%INSTALLER_PWD% rteinstallbackendserver
::docker run -d -p 2222:22 --name rteinstallbackendserver rteinstallbackendserver

endlocal
