
#!/usr/bin/env sh
tempa=$(sudo smartctl -x /dev/sda | grep "Current Temperature" | awk  '{print $3}')
tempb=$(sudo smartctl -x /dev/sdb | grep "Current Temperature" | awk  '{print $3}')
tempc=$(sudo smartctl -x /dev/sdc | grep "Current Temperature" | awk  '{print $3}')
smarta=$(sudo smartctl -x /dev/sda | grep "SMART overall-health self-assessment test result:" | awk '{print$6}')
smartb=$(sudo smartctl -x /dev/sdb | grep "SMART overall-health self-assessment test result:" | awk '{print$6}')
smartc=$(sudo smartctl -x /dev/sdc | grep "SMART overall-health self-assessment test result:" | awk '{print$6}')
usagea=$(df -Th | grep /dev/sda2 | awk '{print$6}')
usageb=$(df -Th | grep /dev/sdb1 | awk '{print$6}')
usagec=$(df -Th | grep /dev/sdc1 | awk '{print$6}')
totalstatus=$(systemctl status plexmediaserver)
sdaused=$(df -Th | grep /dev/sda2 | awk '{print$4}')
sdacapy=$(df -Th | grep /dev/sda2 | awk '{print$3}')
sdafree=$(df -Th | grep /dev/sda2 | awk '{print$5}')
sdbused=$(df -Th | grep /dev/sdb1 | awk '{print$4}')
sdbcapy=$(df -Th | grep /dev/sdb1 | awk '{print$3}')
sdbfree=$(df -Th | grep /dev/sdb1 | awk '{print$5}')
sdcused=$(df -Th | grep /dev/sdc1 | awk '{print$4}')
sdccapy=$(df -Th | grep /dev/sdc1 | awk '{print$3}')
sdcfree=$(df -Th | grep /dev/sdc1 | awk '{print$5}')
echo
echo '========================='
echo 'PLEX MEDIA SERVER STATUS:'
echo '========================='
echo
echo
echo "$totalstatus"
echo
echo '==============='
echo 'DRIVE STATUSES:'
echo '==============='
echo
echo
echo '*** System Drive:'
echo '     Temp is '$tempa'°C'
echo '     SMART health assessment: '$smarta
echo '     Disk usage is '$usagea' ('$sdaused' / '$sdacapy' with '$sdafree' free)'
echo
echo
echo '*** /dev/sdb (Movies):'
echo '     Temp is '$tempb'°C'
echo '     SMART health assessment: '$smartb
echo '     Disk usage is '$usageb' ('$sdbused' / '$sdbcapy' with '$sdbfree' free)'
echo
echo
echo '*** /dev/sdc (TV):'
echo '     Temp is '$tempc'°C'
echo '     SMART health assessment: '$smartc
echo '     Disk usage is '$usagec' ('$sdcused' / '$sdccapy' with '$sdcfree' free)'
echo
echo
