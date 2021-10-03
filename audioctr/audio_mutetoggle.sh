activesink=$(pactl info | grep .a2dp_sink | awk '{print $2}')

pactl set-sink-mute "$activesink" toggle
#echo "$activesink"

