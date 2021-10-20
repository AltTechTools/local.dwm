#!/bin/sh
cd "$HOME/.dwm/audioctr"
dwmargs=$(../testgeneralised.sh "${@}")
if [ "${#dwmargs}" -lt 1 ];then
choosedval="$(../confselect.sh audioctr/options.audio_volSet.conf --dmenu '-i -l 9' --dmenu-prompt ' Shortcut ' --dmenu-font 'monospace:size=48' --dmenu-nb '#99C3FC' --dmenu-nf '#FFFFFF' --dmenu-sb '#FF7A7E' --dmenu-sf '#000000')"
else
choosedval=$(../confselect.sh audioctr/options.audio_volSet.conf $dwmargs)
fi

#choosedval="+10%"
[ "$choosedval" = "" ] || ./audio_volSet.sh "$choosedval"
#[ "$choosedval" = "" ] &&  echo "no choice"
echo ""
