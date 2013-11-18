#!/bin/bash 
##This script is intended to collect network statistics. It is adivisable to 
##remotley run this as a cron job for the time window you are experiencing 
#network issues on your remote server.

##CHANGE output_dir to /what_you_prefer if you do not want log(s) going to 
##home directory. 
output_dir="$HOME" 
##CHANGE destination IP address to what you prefer 
ip="166.78.155.210" 
{ 
echo -e "\n--------------------------------" $(date +%H:%M:%S) "------------------------------------" 
traceroute "$ip" 
ping -c 100 "$ip" 
} >>"$output_dir"/net_tests-$(date +%F).txt 2>&1
