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


cd /root/
fail=0
mkdir ./lscript/ || fail=1

if [ $fail = 1 ]; then
	echo "Please restart the script"
	rm -r /root/lscript/
	exit 3	
fi

cd ./lscript/


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
git clone https://github.com/arismelachroinos/lscript foldertmp

mv ./foldertmp/* ./

clear
echo "Thank you for choosing MascaCorp Incorporated for this downloader/installer"
sleep 5
echo "Launching installer !"
sleep 1
bash ./install.sh
	

