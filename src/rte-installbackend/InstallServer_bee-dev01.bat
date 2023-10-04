@ECHO ON
@REM "C:\Program Files\Beyond Compare 4\BCompare.exe" @"InstallServer.txt" 178.62.45.198 138.68.152.245
ssh -t -E D:\Dropbox\Projects\RealTimeEvents\install\InstallRTEServer_s1.log root@178.62.45.198 "bash -x //usr/local/share/InstallRTEServer_s1.sh"
ssh -t -E InstallRTEServer_s2.log rtinstall@178.62.45.198 "bash -x //usr/local/share/InstallRTEServer_s2.sh InstallRTEServer_s2.ini"
@REM CALL UpdateWebServer_01_dev02.bat
