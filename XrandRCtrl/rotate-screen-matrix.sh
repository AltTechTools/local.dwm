#!/bin/bash
# This script rotates the screen and touchscreen input 90 degrees each time it is called, 
# also disables the touchpad, and enables the virtual keyboard accordingly

# by Ruben Barkow: https://gist.github.com/rubo77/daa262e0229f6e398766


#FUD: Removed Touchpad device
#	Touchscreen name comes from $2
#	Now just returns the applicable Transformation Matrix, to be used as a sub script
#	Exit error code 1 if screenMatrix is empty, due to not being found
#	TODO:
#		add  xrandr --output  (e.v. from $3/loop through params and create other options)
#	


#### configuration
# find your Touchscreen and Touchpad device with `xinput`
TouchscreenDevice="$2"   #'ELAN Touchscreen'
#TouchpadDevice='SynPS/2 Synaptics TouchPad'

if [ "$1" = "--help"  ] || [ "$1" = "-h"  ] ; then
echo 'Usage: rotate-screen.sh [OPTION]'
echo
echo 'This script rotates the screen and touchscreen input 90 degrees each time it is called,' 
echo 'also disables the touchpad, and enables the virtual keyboard accordingly'
echo
echo Usage:
echo ' -h --help display this help'
echo ' -j (just horizontal) rotates the screen and touchscreen input only 180 degrees'
echo ' -n always rotates the screen back to normal'
exit 0
fi

#touchpadEnabled=$(xinput --list-props "$TouchpadDevice" | awk '/Device Enabled/{print $NF}')
screenMatrix=$(xinput --list-props "$TouchscreenDevice" | awk '/Coordinate Transformation Matrix/{print $5$6$7$8$9$10$11$12$NF}') || return 1

# Matrix for rotation
# ⎡ 1 0 0 ⎤
# ⎜ 0 1 0 ⎥
# ⎣ 0 0 1 ⎦
normal='1 0 0 0 1 0 0 0 1'
normal_float='1.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,1.000000'

#⎡ -1  0 1 ⎤
#⎜  0 -1 1 ⎥
#⎣  0  0 1 ⎦
inverted='-1 0 1 0 -1 1 0 0 1'
inverted_float='-1.000000,0.000000,1.000000,0.000000,-1.000000,1.000000,0.000000,0.000000,1.000000'

# 90° to the left 
# ⎡ 0 -1 1 ⎤
# ⎜ 1  0 0 ⎥
# ⎣ 0  0 1 ⎦
left='0 -1 1 1 0 0 0 0 1'
left_float='0.000000,-1.000000,1.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000'

# 90° to the right
#⎡  0 1 0 ⎤
#⎜ -1 0 1 ⎥
#⎣  0 0 1 ⎦
right='0 1 0 -1 0 1 0 0 1'

#echo "test: $screenMatrix"
[ "$screenMatrix" = "" ] && exit 1
if [ $screenMatrix == $normal_float ] && [ "$1" != "-n" ]
then
  #echo "Upside down"
  echo "$inverted"
elif [ $screenMatrix == $inverted_float ] && [ "$1" != "-j" ] && [ "$1" != "-n" ]
then
  #echo "90° to the left"
  echo "$left"
elif [ $screenMatrix == $left_float ] && [ "$1" != "-j" ] && [ "$1" != "-n" ]
then
  #echo "90° to the right"
  echo "$right"
else
  #echo "Back to normal"
  echo "$normal"
fi
