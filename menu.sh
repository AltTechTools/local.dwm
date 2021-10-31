#!/bin/bash

#menulist=$(grep -v "#" menu_List.conf)
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu -p "Menü")
#echo "$menulist" | grep "$selected;" | awk '{print $2}' FS=";"
. ./genericdmenuargfilter.sh
dwmargs=$(filter_dmenuArgs "${@}")
#//test
#selectedsubmenu="$(./confselect.sh menus/menu_List.conf)"
#return 0


if [ "${#dwmargs}" -lt 1 ];then
dwmargs=$(filter_dmenuArgs --dmenu '-i' --dmenu-length 9 --dmenu-prompt "\"Shortcut\"" --dmenu-font "monospace:size=48" --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')
#selectedsubmenu="$(./confselect.sh menus/menu_List.conf --dmenu '-i' --dmenu-length 9 --dmenu-prompt ' Shortcut ' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')"
#echo "${dwmargs}"
#exit 0
selectedsubmenu=$(./confselect.sh menus/menu_List.conf $dwmargs)
else
selectedsubmenu=$(./confselect.sh menus/menu_List.conf $dwmargs)
fi


#test
[ "$selectedsubmenu" = "" ] && ./notifybattery.sh
[ "$selectedsubmenu" = "" ] && echo "" && exit 0

selectedsubmenuScript=$(echo "$selectedsubmenu" | awk '{print $1}' FS=';')
selectedsubmenuParams=$(echo "$selectedsubmenu" | awk '{print $2}' FS=';')

echo "$($selectedsubmenuScript $dwmargs $selectedsubmenuParams)"
#echo "$($selectedsubmenu $dwmargs)"
