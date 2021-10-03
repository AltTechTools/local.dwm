#!/bin/sh

#menulist=$(grep -v "#" menu_List.conf)
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu -p "Menü")
#echo "$menulist" | grep "$selected;" | awk '{print $2}' FS=";"

dwmargs=$(./testgeneralised.sh "${@}")
if [ "${#dwmargs}" -lt 1 ];then
selectedsubmenu="$(./confselect.sh menu_List.conf --dmenu '-i -l 9' --dmenu-prompt ' Shortcut ' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')"
else
selectedsubmenu=$(./confselect.sh menu_List.conf $dwmargs)
fi

echo "$($selectedsubmenu)"

case "$selectedname" in
	"GeneralList")
		echo "$(./selectkeycombos.sh --dmenu-prompt '')"
	;;
        "GoToList")
		echo "$(./selectkeyGoTo.sh --dmenu-prompt '')"
	;;
        "MvToList")
		echo "$(./selectkeyMvTo.sh --dmenu-prompt '')"
	;;
	"AudioList")
		echo "$(./selectAudioKey.sh --dmenu-promt '')"
	;;
	"ProgramList")
		echo "$(./selectProgram.sh --dmenu-promt '')"
	;;
	"ProgramList2")
		echo "$(./selectMenuPrograms.sh --dmenu-prompt '')"
	;;
	"")
		echo ""
	;;
	*)
		echo "$(./menu.sh --dmenu-prompt '')"
esac
