#include <stdio.h>
#include <mpi.h>

int main(int argc, char** argv) 
{
	int rank;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	if(rank == 0)
	{
		printf("hello world\n");
	}
	MPI_Finalize();
	return(0);
} 
