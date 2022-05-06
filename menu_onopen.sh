#!/bin/sh
#isReturnMap=$(xmodmap -pke | grep -c "keycode 124 = Return") 
#if [ $isReturnMap -eq 1 ]; then
#	echo "allready ./btnS_symmode.sh" #> /dev/null
#else
#	[ -e menuactive ] || 
#./dev.ln/buttons/btnS_symmode.sh
source dev.ln/buttons/buttons.src
_set_hwbuttonsMode "navigation"
#fi
#touch menuactive
