#!/bin/sh
#isReturnMap=$(xmodmap -pke | grep -c "keycode 124 = Return") 
#if [ $isReturnMap -eq 1 ]; then
#	echo "allready ./btnS_symmode.sh" #> /dev/null
#else
#	[ -e menuactive ] || 
./pinephone/battery/notifybattery.sh
./pinephone/buttons/btnS_symmode.sh
#fi
#touch menuactive
