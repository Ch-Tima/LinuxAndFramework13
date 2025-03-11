#! /bin/bash

if [ $(whoami) != 'root' ]; then
	echo "Please use 'sudo'"
	exit -1;
fi


PKG="ntfs-3g"
INSTALL_PKG="sudo pacman -Syu $PKG"

DISK=$1
DIRMOUNT=$2

if [ -z "$DISK" ] || [ -z "$DIRMOUNT" ]; then
	echo "command [DISK] [DIRMOUNT]"
	echo "EXAMPLE: automount /dev/sda1 /mnt"
	exit -2
fi

if [[ $(pacman -Qq $PKG) ]]; then
	echo "YES"
else
	echo "Do you want install $PKG (y/n)?"
	read answer

	if [[ "$answer" == "y" ]]; then
		echo $INSTALL_PKG
		$INSTALL_PKG
	else 
		exit -3
	fi
fi


sudo ntfsfix $DISK
sudo mount -t ntfs-3g $DISK $DIRMOUNT

exit 0
