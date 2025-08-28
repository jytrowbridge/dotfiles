# /bin/bash


query=$(fuzzel -d --prompt-only "Query: ")
if [ "$query" = "" ]; then exit; fi
firefox --new-window --search "$query"
