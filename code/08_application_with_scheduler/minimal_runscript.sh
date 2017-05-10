#!/bin/bash

#PBS -l select=4:ncpus=1

export PATH=/apps/gcc/4.8/openmpi/2.1.0/bin:$PATH
export LD_LIBRARY_PATH=/apps/gcc/4.8/openmpi/2.1.0/lib:$LD_LIBRARY_PATH
mpirun /apps/build-a-cluster/code/03_intro_to_mpi/a.out 10000000
