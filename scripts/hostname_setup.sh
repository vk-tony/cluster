#!/bin/bash

NODES=$(echo victor@10.0.2.{4..8})

sudo hostname master
echo master | sudo tee /etc/hostname

for i in $NODES
do
	sudo ssh $i hostname $i 
	sudo ssh $i -t "echo $i > /etc/hostname"
done
