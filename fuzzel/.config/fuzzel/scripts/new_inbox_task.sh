#! /bin/bash

t="$(fuzzel --dmenu --prompt-only="New Task: " -w 50)"

task add +in $t
