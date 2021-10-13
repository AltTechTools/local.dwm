#!/bin/sh

#echo "1"
dwmargs=$(./testgeneralised.sh "${@}")
#echo "2"
#echo "$dwmargs"
#exit 0

#cd "keySim"
#get_selected(){
##ls | grep "keypress_" | awk '{print $1}' FS=".sh" | sed 's/keypress_//' | dmenu -i -l 9 -p "Select Action: " -fn "monospace:size=72" # -l param must fit on the screen scrollign is possible, so long, as it is not out of screen size
#grep -v "#" keypress_List.conf | awk '{print $1}' FS=";" | dmenu -l 9 -p "Select Action: " -fn "monospace:size=72"
#}

get_selectedName(){
#selectedname="$(get_selected)" # "keypress_$(get_selected).sh"
#selectedname="$(./confselect.sh keypress_List.conf)" #working
if [ "${#dwmargs}" -lt 1 ];then
selectedname="$(./confselect.sh keypress_List.conf --dmenu '-i -l 9' --dmenu-prompt 'Shortcut' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')" 
else
selectedname=$(./confselect.sh keypress_List.conf $dwmargs)
fi

#e.g. ./confselect.sh keypress_List.conf  --dmenu-prompt "test" --dmenu-font "monospace:size=36" --dmenu-nb "#FF0000"

echo "$selectedname"
}

#get_CommandToName(){
##grep "$1" keypress_List.conf | awk '{print $2}' FS=";"
#}
selectedt=$(get_selectedName)
echo "$selectedt"

#echo "$selectedt"
#"./$selectedt"
