#!/bin/sh
source menus/selectsource.sh
dwmargs=$(./testgeneralised.sh "${@}")
thelist="menus/keypress_ListSettings.conf"

get_selectedName(){

if [ "${#dwmargs}" -lt 1000 ];then
selectedname="$(./confselect.sh $thelist --dmenu '-i -l 11' --dmenu-prompt 'Shortcut' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')" 
else
selectedname=$(./confselect.sh $thelist $dwmargs)
fi

echo "$selectedname"
}

selectedt=$(get_selectedName)
#echo "$selectedt"
#[ "$selectedt" = "" ] || "selectedt & > /dev/null"
[ "$selectedt" = "" ] || eval "${selectedt} & > /dev/null"
[ "$selectedt" = "" ] && ./customcommand.sh
echo ""