activesink=$(./getsink.sh)
#activesink=$(pactl info | grep .a2dp_sink | awk '{print $2}')

pactl set-sink-volume "$activesink" -0.50
#echo "$activesink"
