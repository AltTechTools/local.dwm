#!/bin/sh

_start_SelectionDefault(){
theList="menus/menu_$1.conf"
res="reopen"
while [ "$res" = "reopen" ]
do
selectedt=$(_get_selectedNameFromList "$theList")
#notify-send "select" "${selectedt}"
#echo "$selectedt"
[ "$selectedt" = "" ] && selectedt="echo exit"
res="$(${selectedt})"
[ "$res" = "exit" ] && exit 0
done
[ "$res" = "lvlup" ] && res="reopen"
echo "$res"
}

_start_SelectionKeysym(){
theList="menus/keypress_$1.conf"
selectedt=$(_get_selectedNameFromList "$theList")
res="exit"
[ "$selectedt" = "" ]  && res="reopen"
_sendkeysym "$selectedt"
#notify-send "selectsym" ">$res<"
echo "$res"
}

_start_SelectionBackground(){
theList="menus/autogen_$1.conf"
selectedt=$(_get_selectedNameFromList "$theList")
res="exit"
[ "$selectedt" = "" ] && res="lvlup"
_setbg "$selectedt"
echo "$res"
}

_setbg(){
./linkdwm-default.sh "background"
./setdefaultBackground.sh
notify-send -t 800 "BG" "$1"
}

_sendkeysym(){
[ "$1" = "" ] && return 0
notify-send -t 2000 "Key" "$1"
sleep 2 && xdotool key "$1" &

}

_start_exec(){
"$@" > /dev/null &
notify-send -t 750 "start" "$1"
#echo "tst" >&2
echo "exit"
}

_get_selectedNameFromList(){

if [ "${#dwmargs}" -lt 1 ];then
selectedname="$(./confselect.sh $1 --dmenu '-i -l 11' --dmenu-prompt '..' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')" 
else
selectedname=$(./confselect.sh $1 $dwmargs)
fi

echo "$selectedname"
}
