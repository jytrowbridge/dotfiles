#! /usr/bin/bash

IFS='!'
read -ra z <<< $(niri msg windows | sed 's/Window ID/!/g' | tr '\n' '?')
sw_id=$(for (( i=${#z[@]}; i>0; i-- )); do echo ${z[$i]} | grep -cq "floating: yes" && echo ${z[$i]} | grep -Po "^\s*(\d+)" | sed 's/ //g' && break; done)

if [[ $1 == 'b' ]] 
  then niri msg action focus-tiling && niri msg action move-window-to-workspace --window-id $sw_id "~s~"; exit; fi

read -ra z <<< $(niri msg workspaces | sed 's/Window ID/!/g' | tr '\n' '?')
curr_ws_id=$(niri msg workspaces | grep -Pom1 "\* (\d)" | sed 's/.*\([0-9]\+\)/\1/')

niri msg action move-window-to-workspace --window-id $sw_id $curr_ws_id && niri msg action focus-floating && niri msg action center-window


