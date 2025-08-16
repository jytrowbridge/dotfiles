#! /usr/bin/bash

title=$(playerctl metadata | sed -rEn 's/^.*title\s+(.*)/\1/p')
artist=$(playerctl metadata | sed -rEn 's/^.*artist\s+(.*)/\1/p')
echo "$title - $artist"
