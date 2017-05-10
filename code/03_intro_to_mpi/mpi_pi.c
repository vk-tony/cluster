#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

#include <mpi.h>

/********
* self contained 32bit Mersenne Twister
* (libc's random wasn't producing good convergence)
* MT19937 coefficients
* see http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/ARTICLES/mt.pdf
* https://en.wikipedia.org/wiki/Mersenne_Twister
*********/
static uint32_t mt[624];
static uint16_t mt_idx;

void mt_init(uint32_t seed)
{
	uint32_t i;
	mt[0] = seed;
	for(i=1;i<624;i++)
	{
		mt[i] = (1812433253 * (mt[i-1] ^ (mt[i-1]>>30)) +i);
	}
	mt_idx = 624;
}
void mt_twist()
{
	uint32_t i,x,xa;
	for(i=0;i<624;i++)
	{
		x = (mt[i] & ((1ull << 31)-1) + (mt[(i+1)%624] & (1ull << 31)));
		xa = x >> 1;
		if(x & 0x1)
			xa ^= 0x9908B0DF;
		mt[i] = mt[(i+397)%624] ^ xa;
	}
	mt_idx = 0;
}

double mt_get_value()
{
	uint32_t x;
	if(mt_idx >= 624)
	{
		mt_twist();
	}
	x = mt[mt_idx];
	x ^= (mt[mt_idx] >> 11);
	x ^= (x << 7) & 0x9D2C5680;
	x ^= (x << 15) & 0xEFC60000;
	x ^= (x >> 18);
	mt_idx++;
	return((double) x/(double) (((1ull << 32)-1)));
}
/*********/


int main(int argc, char** argv)
{
	int rank;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	if(argc < 2)
	{
		printf("usage: %s [num_points]\n", argv[0]);
		goto cleanup;
	}
	int num_points = atoi(argv[1]);
	int i;
	double x,y;
	uint64_t in_circle = 0;
	uint64_t in_circle_total = 0;
	uint64_t in_square = 0;
	uint64_t in_square_total = 0;

	//seed the random number generator
	//include rank because many processes might start at about the same time
	mt_init(time(NULL)^rank);
	for(i=0;i<num_points;i++)
	{
		//where does this loop execute?
		
		//pick a random point
		x = mt_get_value();
		y = mt_get_value();
		if(x*x+y*y <= 1) //if in the circle
			in_circle++;
		in_square++; //all the points will be in the square
	}

	//this is a collective operation - each processor must call it
	//called this way, it will compute a cluster-wide sum
	MPI_Reduce(&in_circle, &in_circle_total, 1, MPI_UINT64_T, MPI_SUM, 0, MPI_COMM_WORLD);
	MPI_Reduce(&in_square, &in_square_total, 1, MPI_UINT64_T, MPI_SUM, 0, MPI_COMM_WORLD);

	if(rank == 0)
	{
		//printf("%d,%d\n", in_circle, in_square);
		printf("%Lg\n", 4.0L*((long double)in_circle/(long double)in_square));
	}
cleanup:
	MPI_Finalize();
}
