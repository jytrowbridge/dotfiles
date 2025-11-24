#! /usr/bin/bash

# requires loading i2c-dev kernel module

if [[ $1 == "" ]]; 
  then 
    echo "please enter value 0-100";
    exit;
fi

if [[ $1 -gt 100 ]] || [[ $1 -lt 0 ]];
  then 
    echo "Enter value between 0 and 100"; 
    exit;
fi

ddcutil setvcp 10 $1
