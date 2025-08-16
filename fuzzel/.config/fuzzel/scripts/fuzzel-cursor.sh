#! /usr/bin/bash

niri_config=$HOME/.config/niri/config.kdl
size_file_path=$HOME/.config/niri/.cursor-sizes
size_str="~SIZE~"
cursors=($(ls $HOME/.local/share/icons | grep -i -e "^[^_].*cursor.*" -e "^.*bibata.*"))
cursors+=($size_str)
size_pats=($(
  while read line; do
    arrin=(${line//\s+/ })
    echo $(echo ${arrin[0]} | tr '[:upper:]' '[:lower:]')
  done < $size_file_path))
size_pats+=("_new_")

function handle_cursor_selection () {
  sed -i "s/\(^.*xcursor-theme\).*/\1 \"$1\"/" $niri_config
}

function delete_pat () {
  sed -i "s/^$1\t.*//I" $size_file_path
}

function show_size_prompt() {
    pattern=$1
    curr_size=""
    count=$(ls $HOME/.local/share/icons | grep -ic $pattern)
    while read line; do
      arrin=(${line//\s+/ })
      pat=$(echo ${arrin[0]} | tr '[:upper:]' '[:lower:]')
      if [[ $pat == $pattern ]]; 
        then
          curr_size="${arrin[1]}";
      fi
    done < $size_file_path
    echo $curr_size
    curr_str=""
    [[ $curr_size == "" ]] || curr_str=" (currently set to $curr_size)"
    while true; do
      size_str="$(fuzzel --dmenu --prompt-only="Matching cursors: $count. Enter size for pattern $pattern$curr_str or del to remove: " -w 100)"
      if [[ $size_str == "del" ]] then delete_pat $pattern; exit; fi
      if [[ $size_str =~ ^[0-9]+$ ]]; then break; fi
      done
    if (cat $size_file_path | grep -cqi $pattern);
      then 
        sed -i "s/^$pattern\t.*/$pattern\t$size_str/I" $size_file_path 
      else
        printf "$1\t$size_str\n" >> $size_file_path 
    fi

    sed -i "s/\(^.*xcursor-size\).*/\1 $size_str/" $niri_config
} 

function prompt_size_change() {
  curs_str="$(echo ${size_pats[@]} | sed 's/ /\n/g' | \
              fuzzel --dmenu -p "Select cursor pattern to edit or delete, or select _new_ for new: " -w 100)"
  if [[ $curs_str == "_new_" ]]
  then pattern="$(fuzzel --dmenu --prompt-only="Enter cursor pattern. Beware of overlapping with existing. " -w 100)"
  else pattern=$1
  fi
  ls $HOME/.local/share/icons | grep -Pqci $curs_str || (echo "no cursors matching pattern" && exit)
  [[ $curs_str == "" ]] && exit; 
  show_size_prompt $curs_str
}


function prompt_cursor_change() {
  SELECTION="$( echo ${cursors[@]} | sed 's/ /\n/g' | fuzzel --dmenu -p "Cursor: ")"
  if [ $SELECTION == "" ]; 
    then exit; 
  elif [ $SELECTION == "~SIZE~" ]; 
    then prompt_size_change;
  else handle_cursor_selection $SELECTION
  fi
}

prompt_cursor_change
