#!/bin/bash
architecture=$(uname -a)
cores=$(getconf _NPROCESSORS_ONLN)
vcores=$(getconf _NPROCESSORS_CONF)
actual_ram=$(free -m | grep 'Mem:'| awk '{print $3}')
total_ram=$(free -m | grep 'Mem:'| awk '{print $2}')
percent_ram=$(free -m | grep 'Mem:' | awk '{printf("%.2f", $2/(100*$3))}')
actual_memory=$(df -BM | grep '/dev/' | awk '{actual += $3} END {print actual}')
total_memory=$(df -BM | grep '/dev/' | awk '{total += $2} END {print total}')
percent_memory=$(df -BM | grep '/dev/' | awk '{total += $2} {used += $3} END {printf("%.2f", (used*100)/total)}')
percent_cores=$(top -bn1 | grep '%Cpu' | awk '{printf("%.2f\n",  $2 + $4)}')
last_boot=$(uptime -s)
lvm_on=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
number_tcp=$()
user_count=$(users | wc -w)
ipv4_adress=$()
mac_adress=$()
sudo_commands_count=$()

wall "	#Architecture:	$architecture
	#CPU phisical:	$cores
	#vCPU:		$vcores
	#Memory Usage:	$actual_ram/$total_ram MB ($percent_ram%)
	#Disk Usage:	$actual_memory/$total_memory MB ($percent_memory%)
	#CPU load:	$percent_cores%
	#Last boot:	$last_boot
	#LVM use:	$lvm_on
	#Conexions TCP:	$number_tcp
	#User log:	$user_count
	#Network:	IP $ipv4_adress	($mac_adress)
	#Sudo		$sudo_commands_count
"
