#!/bin/sh

cd "$HOME/.dwm/"
sleep 10
#background
#feh --bg-scale /home/damian/Bilder/Wallpapers/rwds.png #->inblocking script

while true; do
        #dttm=$(date +"%a %R")
	#xsetroot -name "$dttm"
	./settime.sh
	sleep 30
done &
