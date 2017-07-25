@ECHO OFF
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$delay = get-random -maximum 3600 -minimum 1; start-sleep $delay"
copy /y \\dc01\Company\wsusscn2.cab %TEMP% >nul
"C:\Program Files\SplunkUniversalForwarder\etc\apps\TA_mbsa\bin\mbsacli" /xmlout /nd /nvc /wi /catalog %TEMP%\wsusscn2.cab
del %TEMP%\wsusscn2.cab

