#/bin/bash
#https://github.com/dylanaraps/neofetch/blob/master/neofetch
get_model(){
	    if [[ -d /system/app/ && -d /system/priv-app ]]; then
                model="$(getprop ro.product.brand) $(getprop ro.product.model)"

            elif [[ -f /sys/devices/virtual/dmi/id/product_name ||
                    -f /sys/devices/virtual/dmi/id/product_version ]]; then
                model=$(< /sys/devices/virtual/dmi/id/product_name)
                model+=" $(< /sys/devices/virtual/dmi/id/product_version)"

#            elif [[ -f /sys/devices/virtual/dmi/id/board_vendor ||
#                    -f /sys/devices/virtual/dmi/id/board_name ]]; then
#                model=$(< /sys/devices/virtual/dmi/id/board_vendor)
#                model+=" $(< /sys/devices/virtual/dmi/id/board_name)"

            elif [[ -f /sys/firmware/devicetree/base/model ]]; then
                model=$(< /sys/firmware/devicetree/base/model)

            elif [[ -f /tmp/sysinfo/model ]]; then
                model=$(< /tmp/sysinfo/model)
            fi

}
       
get_model
if [ $(echo "$model" | grep -c -i "pinephone") -lt 1 ]
then
	type="computer"
else
	type="pinephone"
fi

cd "$HOME/.dwm"
[ -e "dev" ] && rm "dev"
[ "$type" = "" ] || ln -s "$type" "dev"
