#! /usr/bin/bash

getopts "d:" option

if [[ $(echo $option) == '?' ]]; then 
  echo "Pass arg -d as up or down"
fi

increment=5000
case ${OPTARG} in
  down) increment=$((increment * -1));; 
  up) echo "up";; 
  *) echo "idk"; exit;;
esac


echo "changing thing by $increment"
echo $(($(cat /sys/class/backlight/intel_backlight/brightness) + $increment)) > /sys/class/backlight/intel_backlight/brightness
