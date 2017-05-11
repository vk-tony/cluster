#!/bin/bash

NODES=$(echo node0{2..5})

sudo hostname master
echo master | sudo tee /etc/hostname

for i in $NODES
do
	sudo ssh $i hostname $i 
	sudo ssh $i -t "echo $i > /etc/hostname"
done
