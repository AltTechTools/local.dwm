#!/bin/sh
#xrandr --output "DSI-1" --rotate "left"
#./rotate-screen.sh -n "pointer:Goodix Capacitive TouchScreen"

#./rotate-screen.sh -n "8"
transformationmatrix=$(./rotate-screen-matrix.sh -- "dgdfg") || echo "failed"
echo "New: $transformationmatrix"
