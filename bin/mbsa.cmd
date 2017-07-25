@ECHO OFF
REM Wait for a random time between 1 and 3600 seconds to prevent DDOSing the fileserver in large environments
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$delay = get-random -maximum 3600 -minimum 1; start-sleep $delay"
# REM Copy the wsusscn2.can to the temp dir, because we cannot use it from a CIFS share directly
copy /y \\dc01\Company\wsusscn2.cab %TEMP% >nul
# REM Do the actual mbsacli run, with XML output
"%SPLUNK_HOME%\etc\apps\TA-mbsa\bin\mbsacli" /xmlout /nd /nvc /wi /catalog %TEMP%\wsusscn2.cab
# REM Finish by deleting the wsusscn2.cab file from the temp dir
del %TEMP%\wsusscn2.cab
