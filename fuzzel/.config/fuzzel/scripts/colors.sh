hue="$(printf 'Dark\nLight' | fuzzel --dmenu --prompt="Pick hue:" -w 25 -l 2)"

if [ $hue == 'Dark' ]; then
    ~/.config/niri/scripts/color-scheme.sh -d
else
    ~/.config/niri/scripts/color-scheme.sh -l
fi
