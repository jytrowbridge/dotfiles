#f!/usr/bin/bash

#SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Hard reboot\n7 - Shutdown" | fuzzel --dmenu -l 7 -w 25 -p "Power Menu: ")" 

if [[ $1 == "" ]]; then echo "Please enter command <list>" && exit; fi

function show_inbox() {
  task_id="$(task in |\
    grep -P "^\d+" |\
    sed -E "s/[0-9]+ tasks//g" |\
    sed '/^[[:space:]]*$/d' |\
    fuzzel --dmenu -w 75 |\
    grep -Po "^\d+")"
  
  declare -A fields_dic
  fields=(Descripion Project Tags Brainpower annotation

  task_info="$(task $task_id |\
    grep
    fuzzel --dmenu -w 75)"
}

case $1 in 
  show_inbox) show_inbox;; 
  *) echo m; exit;;
esacad
