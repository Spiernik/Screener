#!/bin/bash
# adb devices
x=100;
speed=700;

echo "Scrolling with $speed"

echo "Creating save dir...";
save_dir=$(date +'%Y_%m_%d');
mkdir -p $save_dir;

while true
do
	echo "Making screenshot...";
	adb shell screencap -p /sdcard/screen.png
	sleep 0.5;
	filename=$(date +'%Y%m%d_%H%M%S');
	adb pull /sdcard/screen.png $save_dir/$filename.png
	sleep 0.5;
	adb shell rm /sdcard/screen.png;
	sleep 0.5;
	echo "Swiping...";
	adb shell input swipe $x $speed $x 0
	sleep 0.5;
done