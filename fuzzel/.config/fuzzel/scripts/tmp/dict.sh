#! /usr/bin/bash

declare -A dictionary

cursor_theme=$(grep xcursor-theme $HOME/.config/niri/config.kdl | tr '[:upper:]' '[:lower:]')
while read line; do
  arrin=(${line//\t/ })
  pat=$(echo ${arrin[0]} | tr '[:upper:]' '[:lower:]')
  echo $pat
  if [[ $cursor_theme =~ $pat ]]; then echo match; fi

done < file.txt


