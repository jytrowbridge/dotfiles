# /bin/bash

source /home/jack/Projects/mlb_bot/.venv/bin/activate
url=$(mlb_bot lastgame)
firefox --new-window $url 
