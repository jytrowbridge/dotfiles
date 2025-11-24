#! /bin/bash

text=$(curl -s wttr.in/?format='%t+(%f)+%C+%m')
tooltip=$(curl -s wttr.in | jq -Rsa)

JSON_FMT='{"text":"%s","tooltip":%s}'

printf "$JSON_FMT" "$text" "$tooltip" 
