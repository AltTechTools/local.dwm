#!/bin/sh
#xrandr --output "DSI-1" --rotate "left"
#./rotate-screen.sh -n "pointer:Goodix Capacitive TouchScreen"

cd "$HOME/.dwm/XrandRCtrl/"
#./rotate-screen.sh -n "8"
transformationmatrix=$(./rotate-screen-matrix.sh -- "8") || exit 1 #echo "failed"
transformationmatrix2=$(echo "$transformationmatrix" | sed 's/ /,/g')
#echo "New: $transformationmatrix"


xinput set-prop "8" 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1 #$transformationmatrix
xrandr --output "DSI-1" --rotate left
#xrandr --output "DSI-1" --transform $transformationmatrix2
