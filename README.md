# Microsoft Baseline Security Analyzer (MBSA) add-on for Splunk

This CIM compliant add-on can be used to onboard security patching information
from Windows systems.

For example, this helps fill the following panels in Splunk Enterprise Security:

* Update Center
* Update Search

## Prerequisites

1. [Download MBSA from Microsoft](https://www.microsoft.com/en-us/download/details.aspx?id=7558)
2. [Download wsusscn2.cab from Microsoft](http://go.microsoft.com/fwlink/?LinkId=76054)

## Installation

0. Install MBSA temporarily on a Windows system
0. Put wsusscn2.cab on a public CIFS share
1. Install this TA on your indexer(s)
2. Install this TA on your search head(s)
3. Install this TA on your deployment server:

    * `cd $SPLUNK_HOME/etc/deployment-apps`
    * `git clone https://github.com/jorritfolmer/TA-mbsa.git`
    * Copy `mbsacli.exe` from the temp VM to `$SPLUNK_HOME/etc/deployment-apps/TA-mbsa/bin`
    * Copy `wusscan.dll` from the temp VM to `$SPLUNK_HOME/etc/deployment-apps/TA-mbsa/bin`
    * Enable the scripted input by setting `disabled = 0` in `$SPLUNK_HOME/etc/deployment-apps/TA-mbsa/default/inputs.conf`

## Configuration

1. Edit the wsusscn2.cab CIFS share location in bin/mbsa.cmd
2. (Optional) edit the random wait interval before downloading wsusscn2.cab from the CIFS share. This prevents the file server from being DDOSsed.
3. (Optional) edit the local destination folder to which the wsusscn2.cab file is copied. Unfortunately you can't use the wsusscn2.cab file directly from a CIFS share directory.

