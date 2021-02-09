#!/bin/bash
WS_STRING=$(i3-msg -t get_workspaces   | jq '.[] | (.num)')
WS_ARRAY=()
ALL_WS=({1..10})

for ws in $WS_STRING; do WS_ARRAY+=($ws); done

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

moveContainer=false
# OPTIND=1

# check for mvoe container flag
while getopts 'm' opt; do
    case $opt in
        m) moveContainer=true ;;
        *) echo 'Error in command line parsing' >&2
            exit 1
    esac
done

for ws in ${ALL_WS[@]}
do 
    if  ! containsElement $ws "${WS_ARRAY[@]}"
    then
        if "$moveContainer"
        then
            ACTIVE_WIN=$(xprop -id $(xdotool getactivewindow) | grep 'WM_NAME(STRING)' | cut -d'"' -f2)
            i3-msg move container to workspace $ws
            wmctrl -r $ACTIVE_WIN -b add,demands_attention
        else
            i3-msg workspace $ws
        fi
        break
    fi
done