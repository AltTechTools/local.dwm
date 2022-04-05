#/bin/sh
percentage=$(cat /sys/class/power_supply/BAT1/capacity)
echo "$percentage"
