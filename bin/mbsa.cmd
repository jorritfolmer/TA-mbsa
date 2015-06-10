@ECHO OFF
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$delay = get-random -maximum 3600 -minimum 1; start-sleep $delay"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$webclient = New-Object System.Net.WebClient; $url = \"http://internal-mirror.myorg.local//wsusscn2.cab\"; $file = \"$env:temp\wsusscn2.cab\";$webclient.DownloadFile($url,$file)"
"C:\Program Files\SplunkUniversalForwarder\etc\apps\ta_mbsa\bin\mbsacli" /xmlout /nd /nvc /wi /catalog %TEMP%\wsusscn2.cab
del %TEMP%\wsusscn2.cab

