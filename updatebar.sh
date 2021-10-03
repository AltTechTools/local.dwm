#!/bin/sh

defaultbarsize=$(cat barsize.conf) #5 

sub_result(){
case "$1" in
	"time")
		echo "$(get_time)"
	;;
	"custom")
		echo "CUSTOM"
	;;
	*)
		echo "else"
	;;
esac
#echo "done"
}

get_time(){
#dttm=$(date +"%a %R %s") #test
dttm=$(date +"%a %R")
echo "${dttm}"
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
subtext=$(sub_result "$1")
paddedtext=$(pad_text "$subtext")

echo "| $(whoami): $paddedtext |"
}

bartext=$(get_bartext "$1")
echo "$bartext"
xsetroot -name "$bartext"
#xsetroot -name "$(get_bartext "$1")"

