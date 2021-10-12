#!/bin/sh
activesink=$(./getAudioSink.sh)
pactl set-sink-volume "$activesink" 20%
