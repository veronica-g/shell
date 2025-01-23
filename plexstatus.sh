#!/usr/bin/env sh
#
# Replace the below values with the ones correct for your system or your results will be incorrect.
#
systemdrive=/dev/sda
moviedrive=/dev/sdb
tvdrive=/dev/sdc
#
systempartition=/dev/sda2
moviepartition=/dev/sdb1
tvpartition=/dev/sdc1
#
#
tempa=$(sudo smartctl -x $systemdrive | grep "Current Temperature" | awk  '{print $3}')
tempb=$(sudo smartctl -x $moviedrive | grep "Current Temperature" | awk  '{print $3}')
tempc=$(sudo smartctl -x $tvdrive | grep "Current Temperature" | awk  '{print $3}')
smarta=$(sudo smartctl -x $systemdrive | grep "SMART overall-health self-assessment test result:" | awk '{print$6}')
smartb=$(sudo smartctl -x $moviedrive | grep "SMART overall-health self-assessment test result:" | awk '{print$6}')
smartc=$(sudo smartctl -x $tvdrive | grep "SMART overall-health self-assessment test result:" | awk '{print$6}')
usagea=$(df -Th | grep $systempartition | awk '{print$6}')
usageb=$(df -Th | grep $moviepartition | awk '{print$6}')
usagec=$(df -Th | grep $tvpartition | awk '{print$6}')
plexserverstatus=$(sudo systemctl status plexmediaserver | grep Loaded && sudo systemctl status plexmediaserver | grep Active)
dlnaserverstatus=$(sudo systemctl status minidlna | grep Loaded && sudo systemctl status minidlna | grep Active)
sdaused=$(df -Th | grep $systempartition | awk '{print$4}')
sdacapy=$(df -Th | grep $systempartition | awk '{print$3}')
sdafree=$(df -Th | grep $systempartition | awk '{print$5}')
sdbused=$(df -Th | grep $moviepartition | awk '{print$4}')
sdbcapy=$(df -Th | grep $moviepartition | awk '{print$3}')
sdbfree=$(df -Th | grep $moviepartition | awk '{print$5}')
sdcused=$(df -Th | grep $tvpartition | awk '{print$4}')
sdccapy=$(df -Th | grep $tvpartition | awk '{print$3}')
sdcfree=$(df -Th | grep $tvpartition | awk '{print$5}')
upthyme=$(uptime)
echo
echo '==========================='
echo ' PLEX MEDIA SERVER STATUS: '
echo '==========================='
echo
echo "$plexserverstatus"
echo
echo '========================='
echo ' miniDLNA SERVER STATUS: '
echo '========================='
echo
echo "$dlnaserverstatus"
echo
echo '================'
echo ' SYSTEM STATUS: '
echo '================'
echo
echo '*** '$systemdrive' (System Drive):'
echo '     Temp is '$tempa'°C'
echo '     SMART health assessment: '$smarta
echo '     Disk usage is '$usagea' ('$sdaused' / '$sdacapy' with '$sdafree' free)'
echo
echo
echo '*** '$moviedrive' (Movies):'
echo '     Temp is '$tempb'°C'
echo '     SMART health assessment: '$smartb
echo '     Disk usage is '$usageb' ('$sdbused' / '$sdbcapy' with '$sdbfree' free)'
echo
echo
echo '*** '$tvdrive' (TV Shows):'
echo '     Temp is '$tempc'°C'
echo '     SMART health assessment: '$smartc
echo '     Disk usage is '$usagec' ('$sdcused' / '$sdccapy' with '$sdcfree' free)'
echo
echo
echo '*** Uptime result:'
echo '    '$upthyme
echo
echo
