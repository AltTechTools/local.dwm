#!/bin/sh
source menus/selectsource.sh

dwmargs=$(./testgeneralised.sh "${@}")
#thelist="menus/keypress_ListBrowsers.conf"

_start_SelectionDefaultbak(){
theList="menus/$1.conf"
selectedt=$(_get_selectedNameFromList "$theList")
#echo "$selectedt"
eval "$selectedt & > /dev/null"
echo ""
}

_get_selectedNameFromListbak(){

if [ "${#dwmargs}" -lt 1 ];then
selectedname="$(./confselect.sh $1 --dmenu '-i -l 11' --dmenu-prompt '..' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')" 
else
selectedname=$(./confselect.sh $1 $dwmargs)
fi

echo "$selectedname"
}

echo "$(_start_SelectionDefault keypress_ListBrowsers)"
