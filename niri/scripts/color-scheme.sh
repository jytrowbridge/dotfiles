#! /bin/bash
#
# curr=$(gsettings get org.gnome.desktop.interface color-scheme)
# echo "~$curr~"
#
# if [ "$curr" = "'prefer-dark'" ]; then
#     echo "changing to light"
#     gsettings set org.gnome.desktop.interface color-scheme 'prefer-light';
# else
#     echo "changing to dark"
#     gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark';
# fi
#
# exit 1

while getopts ':dl' opt; do
    case $opt in 
        d)
            gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
            ~/dotfiles/alacritty/alacritty/change-theme.sh 'catppuccin_frappe'
            ;;
        l)
            gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
            ~/dotfiles/alacritty/alacritty/change-theme.sh 'catppuccin_latte'
            ;;
        ?)
            echo 'idk'
            exit 0;
            ;;
    esac
done
