#! /usr/bin/bash

ff=" "
ac=" "

#mapfile -t titles < <(niri msg windows | pcregrep -o1 'Title: (.*)')
mapfile -t titles < <(niri msg windows | grep 'Title: .*')
mapfile -t apps < <(niri msg windows | pcregrep -o1 'App ID: (.*)')
mapfile -t ids < <(niri msg windows | pcregrep -o1 'Window ID: (.*)')

len=$((${#titles[@]} - 1))
for i in $(seq 0 $len); 
  do 
    app=${apps[$i]}
    echo $app
    if [ "$app" == "firefox" ]; then echo "match"; fi
  
done

index=$(echo ${titles[*]} | sed 's/Title: \"/\n/g' |fuzzel --dmenu)
