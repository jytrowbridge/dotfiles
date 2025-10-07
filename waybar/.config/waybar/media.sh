#! /usr/bin/bash

# -f '{{artist}}-{{album}}'
pctl_status() {
    # title=$(playerctl metadata | sed -rEn 's/^.*title\s+(.*)/\1/p')
    # artist=$(playerctl metadata | sed -rEn 's/^.*artist\s+(.*)/\1/p')
    # echo "$title - $artist"
    playerctl metadata -f '{{title}} | {{artist}}'
}

mpd_status() {
    mpc current -f '%artist% - %title%'
}

if [[ $(playerctl status -s) ]]; then 
    pctl_status;
else
    mpd_status;
fi
