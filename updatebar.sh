#!/bin/sh

defaultbarsize=$(cat barsize.conf) #5 

Main(){
	local bartext=$(get_bartext "$1")
	echo "$bartext"
	xsetroot -name "$bartext"
}

sub_result(){
case "$1" in
	"time")
		echo "$(get_time)"
	;;
	"custom")
		echo "CUSTOM"
	;;
	"battery")
		echo "Bat: $(get_bat)"
	;;
	*)
		echo "else"
	;;
esac
#echo "done"
}

get_time(){
#dttm=$(date +"%a %R %s") #test
local dttm=$(date +"%a %R")
echo "${dttm}"
}

get_bat(){
local percentage=$(dev.ln/battery/getbattery.sh)
echo "$percentage"
}

pad_text(){
local x="$1"
local xlen="${#x}"
#local xlen=$(($xlen+1))

while [ "$xlen" -lt "$defaultbarsize" ]; do
    #let "xlen+=1"
    local xlen=$(($xlen+1))
    x=" ${x}"
done

local xlen="${#x}"

[ "$xlen" -gt "$defaultbarsize" ] && echo "$xlen" > barsize.conf
#let "xlen=10"

echo "$x"
}

get_bartext(){
local subtext=$(sub_result "$1")
local paddedtext=$(pad_text "$subtext")

echo "| $(whoami): $paddedtext |"
}

Main "$1"
