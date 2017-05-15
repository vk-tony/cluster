#!/bin/bash
#
# Script to build and install PBS Pro
#

# Clone the open source version of PBS Pro
git clone https://github.com/PBSPro/pbspro.git

cd pbspro

# Check out a specific release for a known good condition
git checkout release_to_be_determined #TODO 

# Not sure why this is here
git reset --hard
git clean -f -d -x -f

# Generate the configure script
bash ./autogen.sh

# Configure the installation
./configure --prefix=/opt/pbs --libexecdir=/opt/pbs/libexec

# Build the binaries and generate a compressed tarballs
make -j4 dist

# Copy all tarballs to the appropriate rpmbuild directory
mkdir -p ~/rpmbuild/SOURCES
cp -fv pbspro-*.tar.gz ~/rpmbuild/SOURCES/

# Build the RPMs from the tarballs
rpmbuild -bb pbspro.spec

# Add the RPMs to the HPC repo
sudo cp ~/rpmbuild/RPMS/x86_64/pbs*rpm /var/www/html/hpc-repo/Packages

# Update the YUM repo
cd /var/www/html/hpc-repo
sudo createrepo $(pwd)

# Update the YUM cache on all nodes
sudo clush -w @all yum makecache fast

# Install the PBS Pro Server on master node
sudo yum install pbspro-server

# Install the PBS Pro Execution package on compute nodes
# (This should be done with configuration management technically)
# sudo clush -w @compute yum install -y pbspro-execution


# Edit the /etc/pbs.conf for master server


# Edit the /etc/pbs.conf for compute nodes

# Start the PBS server on the master
sudo systemctl start pbs

# Add the compute nodes to the server configuration
NODES=$(cluset -e @compute)
for i in $NODES
do
	sudo qmgr -c "c n $i"
done
# Start the PBS MOMs on the compute nodes
sudo clush -bw @compute systemctl start pbs

# Verify nodes are up and running with PBS
/opt/pbs/bin/pbsnodes -l | grep state | sort | uniq -c 

# Make some optimizations about shared filesystems
# See /var/spool/pbs/mom_priv/config

# Next -> Build OpenMPI


