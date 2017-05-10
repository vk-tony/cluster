#!/bin/bash

NODES=$(echo node0{1..5})

#NODES=node02

#sudo ssh-keygen -t ecdsa
if [ ! -f .ssh_finished_configured ]; then

ssh-keyscan -t ecdsa $NODES > /tmp/ssh_known_hosts

for i in $NODES
do
        scp /tmp/ssh_known_hosts $i:/tmp
        scp root_id_ecdsa.pub $i:/tmp
        scp root_id_ecdsa $i:/tmp
        ssh -t $i '
sudo cp /tmp/ssh_known_hosts /etc/ssh/ssh_known_hosts
sudo mv /tmp/root_id_ecdsa /root/.ssh/id_ecdsa
sudo chown root:root /root/.ssh/id_ecdsa
sudo cat /tmp/root_id_ecdsa.pub /root/.ssh/authorized_keys > /tmp/new_auth_keys
sudo mv /root/.ssh/authorized_keys /root/.ssh/authorized_keys.bkp
sudo mv /tmp/new_auth_keys /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
sudo chown root:root /root/.ssh/authorized_keys
'
done

touch .ssh_finished_configured

else
        echo 'SSH already configured.'

fi
