#! /usr/bin/bash

trap "exit 1" TERM
export TOP_PID=$$

function abort() {
   kill -s TERM $TOP_PID
}

dir="$HOME/Pictures/Wallpaper"; 
function set_dir() {
  [[ -d $1 ]] || (echo "path $1 is not a valid directory" && abort);
  dir=$1;
}

blur="75x25"
blur_pat='^[0-9]+x[0-9]+$'

function set_blur() {
  [[ $1 =~ $blur_pat ]] || (echo "$1 is not in valid _x_ format" && abort);
  blur=$1
}

while getopts ":d:b:" opt; do
  case $opt in
    d) set_dir $OPTARG;;
    b) set_blur $OPTARG;;
  esac
done;

if [[ $2 == "" ]];
  then blur="75x25";
  else
    if [[ $2 =~ $num_re ]];
      then blur=$2;
      else echo "blur $2 not in valid _x_ format"; exit;
    fi
fi


cd $dir && \
  cp _current _current_blurred && \
  magick mogrify -blur $blur _current_blurred
