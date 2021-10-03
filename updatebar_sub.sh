#!/bin/sh

case "$1" in
	"time")
		echo "t"
		./settime.sh
	;;
	*)
		echo "else"
	;;
esac
echo "done"
