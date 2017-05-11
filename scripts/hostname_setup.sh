#!/bin/bash

NODES=$(echo node0{2..5})

sudo hostname master
sudo echo master > /etc/hostname

for i in $NODES
do
	sudo ssh $i hostname $i 
	sudo ssh $i -t "echo $i > /etc/hostname"
done
