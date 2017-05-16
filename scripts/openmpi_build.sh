#!/bin/bash
#
# Simple script to build OpenMPI 2.1.0 from source
#

VERS=2.1.0
PREFIX=/apps/gcc/4.8/openmpi/${VERS}

if [ ! -f "openmpi-$VERS.tar.bz2" ]; then
	wget https://www.open-mpi.org/software/ompi/v2.1/downloads/openmpi-$VERS.tar.bz2
fi

if [ -d "./openmpi-$VERS" ]; then
	rm -fr ./openmpi-$VERS
fi

tar xvf openmpi-$VERS.tar.bz2

cd openmpi-$VERS

CPPFLAGS="-I/opt/pbs/include" \
LDFLAGS="-L/opt/pbs/lib -Wl,-rpath,/opt/pbs/lib" \
LIBS="-lpbs -lpthread -lcrypto" \
./configure \
	--prefix=${PREFIX} \
	--with-tm=/opt/pbs

make -j 2
sudo make install

cd ..

# Should probably clean up after here, but in case of errors ...

# Add modulefile to system
