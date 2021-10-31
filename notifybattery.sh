#/bin/sh
percentage=$(./getbattery.sh)
notify-send "Battery" "$percentage"
