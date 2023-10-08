@ECHO OFF
setlocal

:: Stop the existing container if it's running
docker stop rte-installbackendserver || echo No running container named rte-installbackendserver

:: Remove the stopped container
docker rm rte-installbackendserver || echo No container to remove

:: Build the new image
docker build -t rte-installbackendserver .

:: Run the container
docker run -d -p 2222:22 --name rte-installbackendserver -e LINUX_ROOT_PWD=%LINUX_ROOT_PWD% -e LINUX_INSTALLER_USERID=%LINUX_INSTALLER_USERID% -e LINUX_INSTALLER_PWD=%LINUX_INSTALLER_PWD% rte-installbackendserver
::docker run -d -p 2222:22 --name rte-installbackendserver rte-installbackendserver

endlocal
