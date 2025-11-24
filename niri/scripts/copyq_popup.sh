#! /bin/bash

niri msg action do-screen-transition -d 500
niri msg action spawn -- copyq show
#nirius focus-or-spawn -a copyq copyq show
sleep 0.2
nirius focus -a copyq
niri msg action move-window-to-floating
niri msg action set-window-width 500
niri msg action set-window-height 300
sleep 0.05
niri msg action center-window
