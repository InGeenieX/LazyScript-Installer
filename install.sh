#!/bin/bash


if [ $(id -u) -ne 0 ]; then
	echo "This script need to be runned in root !"
	exit 1
fi

clear

echo "Install script created by MascaCorp Incorporated."
echo "LazyScript created by Aris Melachroinos"
echo "This script isn't affiliated with any other script"
sleep 3


cd /tmp/
fail=0
mkdir ./lazyscript/ || fail=1

if [ $fail = 1 ]; then
	echo "Please restart the script"
	rm -r /tmp/lazyscript/
	exit 3	
fi

cd ./lazyscript/


if [[ $(git version) = 0 ]]
then
	echo "Please install github !"
	sleep 2
	echo "Oh I remember that you are lazy..."
	sleep 2
	echo "So I will do it for you !"
	echo "Updating database"
	apt-get update
	echo "Installing git please wait..."
	sleep 2
	echo "Awhile"
	apt-get install -y git
	if [[ $(git version) -ne 0 ]]
	then
		echo "Git doesn't want to install"	
		exit 1
	fi
fi



echo "Cloning LazyScript"
sleep 2
if [ $(git clone https://github.com/arismelachroinos/lscript) -ne 0 ]; then
	echo "Git clone failed..."
	sleep 2
	echo "Trying again"
	if [ $(git clone https://github.com/arismelachroinos/lscript) -ne 0 ]; then
		echo "Can't download from here"
		echo "Downloading from direct link"
		apt-get install -y unzip
		wget https://github.com/arismelachroinos/lscript/archive/master.zip
		unzip master.zip

	fi

fi

cd ./lscri*
clear
echo "Thank you for choosing MascaCorp Incorporated for this downloader/installer"
sleep 5
echo "Launching installer !"
sleep 1
bash ./install.sh
	

