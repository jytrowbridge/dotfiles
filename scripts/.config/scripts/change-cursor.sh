#! /usr/bin/bash

cursors=($(ls -p $HOME/.local/share/icons/ | pcregrep -oi ".*cursor.*(?=/)"))

function validate_sel() {
  if    
      [  $1 == '' ] || \
    ! [[ $1 =~ [0-9]+ ]] || \
      [  $1 -ge ${#cursors[@]} ]; 
    then return 1; 
    else return 0; 
  fi
}

echo "Available cursors:"
for i in ${!cursors[@]}; do 
  printf "\t%s) %s\n" "$i" "${cursors[$i]}"; 
done

while true; do
  read -p "Enter selection, or q to quit: " sel;
  if (validate_sel $sel) 
    then break;
    elif [ $sel == "q" ] 
    then exit; 
  fi
  echo "please enter a valid index, or q to quit"
done;

cursor_name=${cursors[$sel]}
niri_config=$HOME/.config/niri/config.kdl
sed -i "s/\(^.*xcursor-theme\).*/\1 \"$cursor_name\"/" $niri_config

