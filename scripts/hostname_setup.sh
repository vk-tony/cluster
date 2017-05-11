#!/bin/bash

NODES=$(echo node0{2..5})

sudo hostname master
sudo echo master > /etc/hostname

for i in $NODES
do
	sudo ssh hostname $i 
	sudo ssh echo $i > /etc/hostname
done
