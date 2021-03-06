#!/bin/sh

cd "$HOME/.dwm/"
#exec svkbd-mobile-intl &
sleep 0.2
#background
#feh --bg-scale /home/damian/Bilder/Wallpapers/rwds.png #->inblocking script

#Files(picntures) from Backgrounds are listed to select as a Background from the Menu (link files into this folder to have available as an option e.g.: ln -s <source filepath> <desired link name(will be shown as)>)
# Files in the Folder can be real or symbolic Links
#ls "Backgrounds/" | awk '{print $1";"$1"."$2}' FS="." > menus/autogen_ListBackground.conf
touch "test.touch"
./monitors.sh
./updateBGMenuList.sh
test -e defaultBG.ln && ./setdefaultBackground.sh

#start if disabled(e.g. for speeding up boot time)
[ systemctl status sendmail.service | grep -c "Active: active" -lt "1" ] && systemctl start sendmail.service &

while true; do
        #dttm=$(date +"%a %R")
	#xsetroot -name "$dttm"
	./settime.sh #e.v. error source
	sleep 30
done &
