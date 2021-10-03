#!/bin/sh

#menulist=$(grep -v "#" menu_List.conf)
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu -p "Menü")
#echo "$menulist" | grep "$selected;" | awk '{print $2}' FS=";"

dwmargs=$(./testgeneralised.sh "${@}")
if [ "${#dwmargs}" -lt 1 ];then
selectedname="$(./confselect.sh menu_List.conf --dmenu '-i -l 9' --dmenu-prompt 'Shortcut' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')"
else
selectedname=$(./confselect.sh menu_List.conf $dwmargs)
fi

case "$selectedname" in
	"GeneralList")
		echo "$(./selectkeycombos.sh)"
	;;
        "GoToList")
		echo "$(./selectkeyGoTo.sh)"
	;;
        "MvToList")
		echo "$(./selectkeyMvTo.sh)"
	;;
	"AudioList")
		echo "$(./selectAudioKey.sh)"
	;;
	*)
		echo ""
esac
