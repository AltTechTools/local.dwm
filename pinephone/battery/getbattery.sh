#/bin/sh
percentage=$(upower -i $(upower -e | grep "/battery_") | grep "percentage" | awk '{print $2}')
echo "$percentage"
