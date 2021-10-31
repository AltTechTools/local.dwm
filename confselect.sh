#!/bin/bash
#cd "$HOME/.dwm/menues"
#e.g.: 
#./confselect.sh keypress_List.conf --dmenu '-l 8' --dmenu-prompt "test" --dmenu-font "monospace:size=36" --dmenu-nb "#FF0000"
#$1=menu_List.conf
#$2=dmenu -l 9 -p "Select Action: " -fn "monospace:size=72"
#echo "$@"
#echo "each"
#echo "$0" #script name
#echo "$1" #file name 
#echo "$2" #setting indicator e.g. --demenu
#echo "$3" #setting e.g. dmenu
#echo "$4"
#echo "$5"
#dmenuargs="$3"
#echo "$3"

cd "$HOME/.dwm"

round()
{
	echo $((($1 + $2/2) / $2))
}
round_up()
{
	let "more=$1+$2-1"
	let "divided=($more / $2)"
#	echo $($more / $2)
	echo "$divided"
}

#declare -a paramArr
paramArr=()
dmenuargs=""
dmenuprompt=""
dmenuargstot=""

for param in "$@" 
do
    paramArr+=("${param}");
done
. ./genericdmenuargfilter.sh
dmenuargs=$(filter_dmenuArgs "${@}")

#echo "${dmenuargs}"


if [ "${#dmenuargs}" -lt 1 ]; then
  dmenuargs=$(filter_dmenuArgs "-l 9 -p \"Select Action: \" -fn \"monospace:size=72\"")
fi
#echo "$dmenuargs"
echo "$dmenuargsorig"

#menulist=$(grep -v "#" "menus/$1")
menulist=$(grep -v "#" "$1")
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu $dmenuargs -p "$dmenuprompt")
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu $(echo "$dmenuargstot"))
selectionList=$(echo "$menulist" | awk '{print $1}' FS=";")

dyndwm=$(printenv DWM_DYNDMENU)
if [ "$dyndwm" = "1" ]; then
	listlen=$(echo "$selectionList" | wc -l)
	echo "$DWM_DMENU_LENGTH" > tmpX.txt
	exit 0
	pagescount=$(round_up $listlen $(printenv DWM_DMENU_LENGTH))
	pagelist=$(echo "")
	for i in {1..$pagescount}
	do
		pageslist=$({ echo "$pageslist"; echo "$i"; })
	done
	echo "$pageslist"
fi

selected=$(echo "$selectionList" | dmenu $dmenuargstot)
#echo "$menulist" | grep "$selected;" | awk '{print $2}' FS=";"
echo "$menulist" | grep -- "^${selected};" | sed "s/$selected;//"
#echo "$PWD"
