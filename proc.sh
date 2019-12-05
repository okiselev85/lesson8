#!/bin/bash


echo "PID||STAT||COMMAND"

for pid in $(ls -l /proc | awk '{print $9}' | grep -s "^[0-9]*[0-9]$"| sort -n );
do

stat=$(cat 2>/dev/null /proc/$pid/stat | awk '{print $3}')
utime=$(cat 2>/dev/null /proc/$pid/stat | awk '{print $14}')
stime=$(cat  2>/dev/null /proc/$pid/stat | awk '{print $17}')
cmd=$(cat 2>/dev/null /proc/$pid/cmdline | awk '{print $0}')

ttime=$((utime + stime))
printf "%-8s | %-15s | %s\n" "$pid | $stat | $cmd" | column -t  -s '|'
done
