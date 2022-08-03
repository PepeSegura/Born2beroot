#!/bin/bash
architecture=$(uname -a)
cores=$()
vcores=$()
actual_ram=$(free -m | grep 'Mem:'| awk '{print $3}')
total_ram=$(free -m | grep 'Mem:'| awk '{print $2}')
percent_ram=$(free -m | grep 'Mem:' | awk '{printf("%.2f", $2/(100*$3))}')
actual_memory=$()
total_memory=$()
percent_memory=$()
percent_cores=$()
last_boot=$()
lvm_on=$()
number_tcp=$()
user_count=$()
ipv4_adress=$()
mac_adress=$()
sudo_commands_count=$()

wall "	#Architecture:	$architecture
	      #CPU phisical:	$cores
	      #vCPU:		$vcores
	      #Memory Usage:	$actual_ram/$total_ram MB ($percent_ram%)
      	#Disk Usage:	$actual_memory/$total_memory ($percent_memory)
	      #CPU load:	$percent_cores
	      #Last boot:	$last_boot
	      #LVM use:	$lvm_on
	      #Conexions TCP:	$number_tcp
	      #User log:	$user_count
	      #Network:	IP $ipv4_adress	($mac_adress)
	      #Sudo		$sudo_commands_count
"
