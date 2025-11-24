#! /bin/bash

playerctl status -s 
using_pctl=$( if [[ $? == 0 ]]; then echo 'true'; else echo 'false'; fi)

toggle () {
    [ $using_pctl = 'true' ] && playerctl play-pause -s || mpc toggle -q
}


next () {
    [ $using_pctl = 'true' ] && playerctl next -s || mpc next -q
}

prev () {
    [ $using_pctl = 'true' ] && playerctl previous -s || mpc prev -q
}

status () {
    [ $using_pctl = 'true' ] && playerctl status || mpc status
}

case $1 in
    tog     ) toggle;;
    next    ) next;;
    prev    ) prev;;
    status  ) status;; 
esac
