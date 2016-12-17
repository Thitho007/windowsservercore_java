# escape=`
FROM microsoft/windowsservercore

ENV JAVA_HOME c:\\Java\\jre

RUN powershell -Command `
    (New-Object System.Net.WebClient).DownloadFile('http://javadl.oracle.com/webapps/download/AutoDL?BundleId=210185', 'C:\jreinstaller.exe') ; `
    Start-Process -filepath C:\jreinstaller.exe -passthru -wait -argumentlist "/s,INSTALLDIR=C:\Java\jre" ; `
    del C:\jreinstaller.exe ; `
    setx PATH %PATH%;%JAVA_HOME%\bin
