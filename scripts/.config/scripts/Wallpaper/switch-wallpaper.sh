#! /usr/bin/bash

img_path=$1
[[ -s $img_path ]] || (echo "Cannot find image at path '$img_path'" && exit)
img_file=$(basename ${img_path})

wp_dir=$HOME/Pictures/Wallpaper/ # maybe stash in env

cp $img_path $wp_dir -n
ln -sf $wpdir$img_file $wp_dir"_current"

$HOME/.config/scripts/Wallpaper/create-blurred.sh

systemctl --user restart swaybg
swww img $wp_dir"_current"
