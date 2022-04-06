#!/bin/sh

dwmargs=$(./testgeneralised.sh "${@}")

if [ -e "menus/keypress_ListDevOpts.conf" ]
then
	thelist="menus/keypress_ListDevOpts.conf"
else
	echo ";./menus/selectSettings.sh" > menus/keypress_ListDevOpts.conf
	for folder in dev/*
	do
		folder=$(echo "$folder" | sed 's/dev\///')
		echo "$folder;./linkdwm-default.sh \"device\" \"${folder}\"" >> menus/keypress_ListDevOpts.conf
	done
	thelist="menus/keypress_ListDevOpts.conf"
fi

get_selectedName(){

if [ "${#dwmargs}" -lt 1 ];then
selectedname="$(./confselect.sh $thelist --dmenu '-i -l 11' --dmenu-prompt '..' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')" 
else
selectedname=$(./confselect.sh $thelist $dwmargs)
fi

echo "$selectedname"
}

selectedt=$(get_selectedName)
#echo "$selectedt"
eval "$selectedt & > /dev/null"
echo ""
