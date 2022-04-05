#!/bin/sh

#isReturnMap=$(xmodmap -pke | grep -c "keycode 124 = Return") 
#if [ $isReturnMap -eq 1 ]; then 
#[ -e menuactive ] && rm menuactive && 
./dev.ln/buttons/btnS_actnmode.sh
./notifybattery.sh
#fi
