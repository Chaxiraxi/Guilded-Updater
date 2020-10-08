#!/bin/bash
if [ "$EUID" -ne 0 ]
then
	echo "Le programme doit être lancé en tant que root"
	exit
fi

update()
{
	cd /tmp/
	rm Minecraft.deb > /dev/null 2>&1
	wget https://launcher.mojang.com/download/Minecraft.deb /tmp/Minecraft.deb
	apt install /tmp/Minecraft.deb -y
	rm Minecraft.deb > /dev/null 2>&1
}

if [ $1 = "--gui" ]
then
	update
	zenity --info
else
	update
fi
