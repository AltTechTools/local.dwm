#/bin/sh
percentage=$(upower -i $(upower -e | grep "/battery_"))
echo "$percentage"
