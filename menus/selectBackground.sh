#!/bin/sh

dwmargs=$(./testgeneralised.sh "${@}")
thelist="menus/autogen_ListBackground.conf"

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
#eval "feh --bg-scale $selectedt & > /dev/null"
cd "$HOME/.dwm/Backgrounds"
#echo "feh --bg-scale $selectedt &"
#echo "$selectedt" > ../defaultBG.conf
echo "$selectedt"
#exit 1
cd ./../
ln -s -f "./Backgrounds/$selectedt" "defaultBG.ln"
#feh --bg-scale "$selectedt" &
echo $(pwd)
#test "$selectedt" = "" && cd ./../ && ./menus/selectMenuPrograms.sh
test "$selectedt" = "" && ./menus/selectMenuPrograms.sh
test "$selectedt" = "" || ./setdefaultBackground.sh
echo ""
