#!/bin/bash
architecture=$(uname -a)
cores=$(getconf _NPROCESSORS_ONLN)
vcores=$(getconf _NPROCESSORS_CONF)
actual_memory=
percent_memory=
percent_cores=
last_boot=
lvm_on=
number_tcp=
user_count=
ipv4_adress=
mac_adress=
sudo_commands_count=
