//Adapted Rosetta Code

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MAX 1000000

int A[MAX], B[MAX];
double eps;
long N_COMP = 0;

double r()
{
	return (double)rand() / (double)RAND_MAX;
}

// computes the length of the longest non-decreasing string
//
int LNDS(int n)
{

	int max = 1;
	int len = 1;
	for (int i = 1; i < n; i++)
	{
		if (A[i - 1] <= A[i])
		{
			len++;
			if (len > max)
				max = len;
		}
		else
			len = 1;
	}
	return max;
}

// computes the number of unsorted sub-arrays
int unsorted(int n, int V[])
{

	int count = 0;
	for (int i = 1; i < n; i++)
	{
		if (V[i - 1] > V[i])
		{
			count++;
		}
	}
	return count;
}

//#elementos fora do sitio
int xxx(int n)
{
	int max = -1;
	int count = 0;

	for (int i = 0; i < n; i++)
	{
		if (A[i] >= max)
		{
			max = A[i];
		}
		else
		{
			count++;
		}
	}

	return count;
}

void swap(int *a, int *b)
{
	int c = *a;
	*a = *b;
	*b = c;
}

int partition(int A[], int p, int q)
{
	swap(&A[p + (rand() % (q - p + 1))], &A[q]); // PIVOT = A[q]

	int i = p - 1;
	for (int j = p; j <= q; j++)
	{
		N_COMP++;
		if (r() > eps)
		{ // no failure
			if (A[j] <= A[q])
				swap(&A[++i], &A[j]);
		}
		else
		{ // failure
			if (A[j] > A[q])

				swap(&A[++i], &A[j]);
		}
	}

	return i;
}

void quicksort(int A[], int p, int q)
{

	if (p < q)
	{
		int pivotIndx = partition(A, p, q);
		quicksort(A, p, pivotIndx - 1);
		quicksort(A, pivotIndx + 1, q);
	}
}

int main()
{
	int n, i, max_r;

	scanf("%lf", &eps);
	double eps_to_print = eps;

	scanf("%d", &n);

	scanf("%d", &max_r);

	for (i = 0; i < n; i++)
		scanf("%d", &A[i]);
	srand((unsigned)time(NULL));
	memcpy(B, A, sizeof(A));

	/*
//original
	printf("%d",A[0]);
	for (i=1; i<n;i++)
		printf(" %d", A[i]);
	printf("\n");
*/

	//memory fault
	quicksort(A, 0, n - 1);
	long N_WRONG_COMP = N_COMP;
	N_COMP = 0;

	//ordenada com falhas
	/*
	printf("%d",A[0]);
	for (i=1; i<n;i++)
		printf(" %d", A[i]);
	printf("\n");
*/

	//count = length of the longest non-decreasing string
	int count = LNDS(n);
	int c = xxx(n);

	eps = -1.0;

	//no memory fault
	quicksort(B,0,n-1);

	//ordenada corretamente
	/*
	printf("%d",B[0]);
        for (i=1; i<n;i++)
                printf(" %d", B[i]);

*/

	//printf("\n%d", max)

	//imprime size of array
	printf("%d\n", n);

	//imprime eps
	printf("%lf\n", eps_to_print);

	//imprime max_r
	printf("%d\n", max_r);

	//imprime #ordenados seguidos
	printf("%d\n", count);

	int unordered = unsorted(n, A);

	//imprime #sub-arrays desordenados
	printf("%d\n", unordered);

	//imprime #elementos desordenados
	printf("%d\n", c);

	//imprime o numero de comparações efectudas
	printf("%ld\n", N_WRONG_COMP);
	printf("%ld\n", N_COMP);
	printf("%f\n", (double)((double)(N_WRONG_COMP)/(double)(N_COMP)));

	return 0;
}
