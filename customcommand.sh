#!/bin/sh
#resuzlt: dwm workdir is $HOME
cd "$HOME/.dwm"
source dev.ln/buttons/buttons.src
./updatebar.sh "custom"
./menu_onopen.sh #> /dev/null

winidhex=$(xwininfo -root | grep "xwininfo" | awk '{print $3}' FS=": " | awk '{print $1}' | sed 's/0x//')
windowid=$(echo "ibase=16; $winidhex" | bc)

prcbef=$(ps ax | grep -c "dmenu")
keyaction="$(./menu.sh)"

sleep 1

#xdotool key "$keyaction"

cd "$HOME/.dwm"
./menu_onclose.sh & #> /dev/null
./settime.sh
