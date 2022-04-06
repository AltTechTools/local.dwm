#!/bin/sh

dwmargs=$(./testgeneralised.sh "${@}")
thelist="menus/keypress_ListAudio.conf"

get_selectedName(){

if [ "${#dwmargs}" -lt 1 ];then
selectedname="$(./confselect.sh $thelist --dmenu '-i -l 9' --dmenu-prompt 'Shortcut' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')" 
else
selectedname=$(./confselect.sh $thelist $dwmargs)
fi
[ "$selectedname" = "" ] && ./customcommand.sh &
echo "$selectedname"
}

selectedt=$(get_selectedName)
[ "selectedt" = "" ] || echo "$selectedt"
#[ "selectedt" != "" ] || echo "tst" #./customcommand.sh
