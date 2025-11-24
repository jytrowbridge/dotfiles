#! /usr/bin/bash

sink="$(/home/jack/.local/bin/audioSinkSelect list | fuzzel --dmenu --prompt="Select Sink:" -w 40 -l 5| sed -r 's/^- ([0-9]*).*/\1/')"
if [ "$sink" = "" ]; then
    exit 0;
fi
/home/jack/.local/bin/audioSinkSelect set $sink
