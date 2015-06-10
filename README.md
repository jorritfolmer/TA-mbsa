# Splunk TA for Microsoft Baseline Security Analyzer

This Splunk TA is meant as a reporting control for patch management on Microsoft Windows servers.
To this end, Microsoft Baseline Security Analyzer (MBSA) is used to report on missing Microsoft Security Bulletins and KBs.

This is a work in progress, currently only the data collection is working.

## Prerequisites

1. `mbsacli.exe` and `wsusscan.dll` from an MBSA installation. Download MBSA from [https://www.microsoft.com/en-us/download/details.aspx?id=7558](https://www.microsoft.com/en-us/download/details.aspx?id=7558)
2. `wsusscn2.cab` present on an internal webserver downloaded from [http://go.microsoft.com/fwlink/?LinkId=76054](http://go.microsoft.com/fwlink/?LinkId=76054)

## Installation

* Install this Splunk TA on your indexer(s), or manually include the provided props.conf to your indexer config
* Install this Splunk TA on your deployment server:

````
cd $SPLUNK_HOME/etc/deployment-apps
git clone https://github.com/jorritfolmer/splunk_ta_mbsa.git
````

* Copy `mbsacli.exe` and `wsusscan.dll` to the Splunk deployment server in `$SPLUNK_HOME/etc/deployment-apps/splunk_ta_mbsa/bin`
* Create a serverclass (e.g. `mbsa`) on the deployment-server
* Assign this app to the serverclass
* Assign clients the serverclass
* Update wsusscn2.cab download url in `$SPLUNK_HOME/etc/deployment-apps/splunk_ta_mbsa/bin/mbsa.cmd`
* Enable the scripted input on the deployment server by setting `disabled = 0` in `$SPLUNK_HOME/etc/deployment-apps/splunk_ta_mbsa/default/inputs.conf`
* `/opt/splunk/bin/splunk reload deploy-server`
