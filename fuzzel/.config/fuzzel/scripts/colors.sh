# hue="$(printf 'Dark\nLight' | fuzzel --dmenu --prompt="Pick hue:" -w 25 -l 2)"
curr=$(gsettings get org.gnome.desktop.interface color-scheme)
cd ~/dotfiles/fuzzel/.config/fuzzel/

if [ "$curr" = "'prefer-light'" ]; then
    # ln -sf ./dark-theme ./theme.ini 
    echo "setting to dark"
    ln -sf $HOME/dotfiles/fuzzel/.config/fuzzel/dark-theme $HOME/dotfiles/fuzzel/.config/fuzzel/theme.ini
    $HOME/.config/niri/scripts/color-scheme.sh -d
else
    echo "setting to light"
    ln -sf $HOME/dotfiles/fuzzel/.config/fuzzel/light-theme $HOME/dotfiles/fuzzel/.config/fuzzel/theme.ini
    $HOME/.config/niri/scripts/color-scheme.sh -l
fi
