#! /usr/bin/bash

# remove killed windows
sw_file=$HOME/.config/scripts/scratch_windows.txt
scratch_ws="~s~"

function remove_killed() {
  extant=($(niri msg windows | pcregrep -o1 "Window ID (\d+)"))
  readarray -t in_scratch < $sw_file
  (for i in ${in_scratch[@]}; do 
    echo ${extant[@]} | tr ' ' '\n' | grep -qc "^$i$" && echo $i || :
  done) > $sw_file
}


function remove_unscratched() {
  IFS="!"; read -ra z <<< $(niri msg windows | sed 's/!/bang/' | sed 's/Window ID/!Window ID/g' | tr '\n' '?')
  curr_floating=($(for i in ${z[@]}; do echo $i | grep "floating: yes" | pcregrep -o1 "^Window ID (\d+)"; done))
  readarray -t in_scratch < $sw_file
  (for i in ${in_scratch[@]}; do
    echo ${curr_floating[@]} | grep -qc "^$i$" && echo $i || :
  done) > $sw_file
}

function send_to_scratch() {
  curr_win=$(niri msg windows | pcregrep -o1 "Window ID (\d+): \(focused\)")
  echo $curr_win
  echo $curr_win >> $sw_file
  niri msg action move-window-to-floating
  niri msg action focus-tiling
  niri msg action move-window-to-workspace --window-id $curr_win $scratch_ws
}

function summon_from_scratch() {
  remove_killed
  remove_unscratched
  last_scratched=$(tail -n 1 $sw_file)
  curr_ws_id=$(niri msg workspaces | grep -Pom1 "\* (\d)" | sed 's/.*\([0-9]\+\)/\1/')
  niri msg action move-window-to-workspace --window-id $last_scratched $curr_ws_id &&\
  niri msg action focus-floating &&\
  niri msg action center-window
}


if [[ "$1" == "banish" ]]; then send_to_scratch; fi 
if [[ "$1" == "summon" ]]; then summon_from_scratch; fi 
