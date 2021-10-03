#!/bin/sh

cd "keySim"
get_selected(){
ls | grep "keypress_" | awk '{print $1}' FS=".sh" | sed 's/keypress_//' | dmenu -l 9 -p "Select Action: " -fn "monospace:size=72" # -l param must fit on the screen scrollign is possible, so long, as it is not out of screen size
}

get_selectedName(){
selectedname="keypress_$(get_selected).sh"
echo "$selectedname"
}

selectedt=$(get_selectedName)
echo "$selectedt"
#"./$selectedt"
