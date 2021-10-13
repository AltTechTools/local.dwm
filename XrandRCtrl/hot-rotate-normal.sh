#!/bin/sh
#xrandr --output "DSI-1" --rotate "left"
#./rotate-screen.sh -n "pointer:Goodix Capacitive TouchScreen"

#./rotate-screen.sh -n "8"
transformationmatrix=$(./rotate-screen-matrix.sh -n "8") || echo "failed"
transformationmatrix2=$(echo "$transformationmatrix" | sed 's/ /,/g')
#echo "$transformationmatrix2"
#exit 1
#echo "New: $transformationmatrix"
xinput set-prop "8" 'Coordinate Transformation Matrix' "$transformationmatrix"
xrandr --output "DSI-1" --transform $transformationmatrix2
