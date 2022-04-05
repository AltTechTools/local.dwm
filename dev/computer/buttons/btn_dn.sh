#!/bin/sh
#resuzlt: dwm workdir is $HOME
cd "$HOME/.dwm"
#xsetroot -name "Custom"
./updatebar.sh "custom"
notify-send "down" "down"
exit 0
#kill $(ps ax | grep "dmenu")
#./keypress_switchWindow.sh
#test=$(./selectkeycombos.sh)
#"./keySim/$test"
#./keypress_Action.sh
#/home/damian/.dwm/keypress_switchWindow.sh

#windowid=$(xdotool getwindowfocus -f)

winidhex=$(xwininfo -root | grep "xwininfo" | awk '{print $3}' FS=": " | awk '{print $1}' | sed 's/0x//')
#windowid=$(xdotool getwindowfocus -f) #getactivewindow)
windowid=$(echo "ibase=16; $winidhex" | bc)

#keyaction="Super_L+Return"
prcbef=$(ps ax | grep -c "dmenu")
#keyaction="$(./selectkeycombos.sh)" #this fucks everything somehow
keyaction="$(./menu.sh)"
#keyaction="Super_R+b" #soo a 'B' does not work, only 'b'

#all use less, the capital B not b was the problem
#xsetroot -name "$windowid"
#windowactivate --sync "$windowid"
#windowfocus --sync "$windowid"
#while [ $(ps ax | grep -c "dmenu") -gt prcbef ];do
#xsetroot -name "sleeploop" #never enters , what's hoing on. the 5s sleep works(even just 0.3331)
#sleep 5 #0.25
#done
#sleep 0.1
##xdotool key -window "$windowid" "$keyaction"
#xdotool key "$keyaction"


#sleep 0.1
sleep 1
#
xdotool key "$keyaction"
#sleep 6
./settime.sh
