#/bin/sh
percentage=$(cat /sys/class/power_supply/BAT1/status)
echo "$percentage"
