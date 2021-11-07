#!/bin/sh
isReturnMap=$(xmodmap -pke | grep -c "keycode 124 = Return")
if [ $isReturnMap -eq 1 ]; then
	echo "Actionkey mode"
	xmodmap -e 'keycode 124 = XF86PowerOff'
else
	echo "Return mode"
	xmodmap -e 'keycode 124 = Return'
fi
