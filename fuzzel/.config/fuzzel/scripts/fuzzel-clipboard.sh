#! /usr/bin/bash

count=$(copyq count)
f=$(for ((i = 0; i<count; i++)); do 
  lines=$(copyq read $i | grep -cP "$")
  formatted=$(copyq read $i)
  if [ $lines > 10 ]; then
    otherLineCount=$(( $lines - 1 ));
    formatted="big"
    #formatted= $(echo $formatted | sed -z "s/\n.*/...($otherLineCount more lines)/");
    #formatted= $(echo "shiiiit" | sed "s/i/m/g");
  fi
  echo $formatted
done | fuzzel -d -w 100 -p test)
