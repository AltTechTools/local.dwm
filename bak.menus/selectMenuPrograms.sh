#!/bin/sh

dwmargs=$(./testgeneralised.sh "${@}")
thelist="keypress_ListMenuPrograms.conf"

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
eval "$selectedt & > /dev/null"
echo ""
