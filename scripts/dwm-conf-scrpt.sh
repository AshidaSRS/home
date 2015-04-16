#!/bin/bash
 
while true; do
  date=`date +"%I:%M%P"`
  batt=`acpi -b | awk '{ sub(",","",$4); print "batt:"$4 }'`
  mem=`free -m | awk '/cache:/ { printf "mem:"$4"M " } /Swap:/ { print "swap:"$4"M" }'`
  uptime=`uptime | awk '{ split($0,s,"average: "); print s[2] }'`
  space=`df -h | awk '/home$/ { print "/home:"$4 } /\/$/ { printf "/:"$4" " }'`
  xsetroot -name "$date :: $batt $mem $space :: $uptime          " # leave some space for trayer
  sleep 30
done