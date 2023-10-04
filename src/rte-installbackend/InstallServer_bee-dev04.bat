@ECHO ON
@REM "C:\Program Files\Beyond Compare 4\BCompare.exe" @"InstallServer.txt" 178.62.45.198 138.68.152.245
ssh -t -E D:\Dropbox\Projects\RealTimeEvents\src\rte\install\Install.log root@159.65.19.237 "ufw enable;ufw allow OpenSSH;apt update;apt install openssh-server;ufw allow 22;systemctl start ssh"
scp d:\Dropbox\Projects\RealTimeEvents\src\rte\install\InstallServer_s1.* root@159.65.19.237://usr/local/share
ssh -t -E D:\Dropbox\Projects\RealTimeEvents\src\rte\install\Install.log root@159.65.19.237 "cd /usr/local/share;sudo chmod 777 InstallServer_s1.sh;bash -x /usr/local/share/InstallServer_s1.sh InstallServer_s1.ini"
@REM ssh -t -E Install.log rtinstall@159.65.19.237 "sudo -u rtinstall bash -x //usr/local/share/InstallServer_s2.sh InstallServer_s2.ini"
@REM CALL UpdateWebServer_01_dev02.bat
