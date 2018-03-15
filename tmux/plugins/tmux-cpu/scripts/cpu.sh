#!/bin/bash

#prev_total=0
#prev_idle=0
declare -A cpus
declare -A maxcpu
while true; do
  while read line; do
    if [[ "$line" =~ ^cpu[0-9] ]]; then
      number=$(echo $line | awk '{print $1}' | sed 's/cpu//')

      #cpus[$number+idle]=$idle

      idle=`echo $line | awk '{print $5}'`
      total=$(echo $line | awk '{ s = 0; for (i = 2; i <= NF; i++) s=s+$i }; END{print s}')

      prev_total=${cpus[${number}total]}
      prev_idle=${cpus[${number}idle]}
      if [[ -z "$prev_total" ]]; then prev_total=0; prev_idle=0; fi

      diff_idle=$(($idle-$prev_idle))
      diff_total=$(($total-$prev_total))
      usage=$(($((1000*$(($diff_total-$diff_idle))/$diff_total+5))/10))
      maxcpu[$number]=$usage

      cpus[${number}total]=$total
      cpus[${number}idle]=$idle
      # echo $TOTAL
    fi
  done < /proc/stat
  clear
  max=${maxcpu[0]}
  for n in "${maxcpu[@]}" ; do
      ((n > max)) && max=$n
  done
  echo $max > /tmp/cpupercent
# cpu=`cat /proc/stat | head -n1 | sed 's/cpu //'`
# user=`echo $cpu | awk '{print $1}'`
# system=`echo $cpu | awk '{print $2}'`
# nice=`echo $cpu | awk '{print $3}'`
# idle=`echo $cpu | awk '{print $4}'`
# wait=`echo $cpu | awk '{print $5}'`
# irq=`echo $cpu | awk '{print $6}'`
# srq=`echo $cpu | awk '{print $7}'`
# zero=`echo $cpu | awk '{print $8}'`
# total=$(($user+$system+$nice+$idle+$wait+$irq+$srq+$zero))
# diff_idle=$(($idle-$prev_idle))
# diff_total=$(($total-$prev_total))
# usage=$(($((1000*$(($diff_total-$diff_idle))/$diff_total+5))/10))
# clear
# echo "Current Usage: $usage%"
# prev_total=$total
# prev_idle=$idle
sleep 1
done
