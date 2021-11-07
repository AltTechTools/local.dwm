#!/bin/sh
isReturnMap=$(xmodmap -pke | grep -c "keycode 124 = Return")
if [ $isReturnMap -eq 1 ]; then
	echo "Actionkey mode"
	xmodmap -e 'keycode 124 = XF86PowerOff'
	xmodmap -e 'keycode 122 = XF86AudioLowerVolume'
	xmodmap -e 'keycode 123 = XF86AudioRaiseVolume'
else
	echo "KeySym mode"
	xmodmap -e 'keycode 124 = Return'
	xmodmap -e 'keycode 122 = Down'
	xmodmap -e 'keycode 123 = Up'
fi
