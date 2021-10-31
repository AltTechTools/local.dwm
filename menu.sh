#!/bin/sh

#menulist=$(grep -v "#" menu_List.conf)
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu -p "Menü")
#echo "$menulist" | grep "$selected;" | awk '{print $2}' FS=";"

dwmargs=$(./testgeneralised.sh "${@}")
#//test
#selectedsubmenu="$(./confselect.sh menus/menu_List.conf)"
#return 0


if [ "${#dwmargs}" -lt 1 ];then
selectedsubmenu="$(./confselect.sh menus/menu_List.conf --dmenu '-i -l 9' --dmenu-prompt ' Shortcut ' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')"
else
selectedsubmenu=$(./confselect.sh menus/menu_List.conf $dwmargs)
fi

#test
./notifybattery.sh


echo "$($selectedsubmenu $dwmargs)"
