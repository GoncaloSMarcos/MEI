// Adapted from Rosetta Code

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MAX 1000000

int A[MAX], B[MAX];
double eps;
long N_COMP = 0;

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

double r()
{
	return (double)rand() / (double)RAND_MAX;
}

void merge(int *a, int n, int m)
{
	int i, j, k;
	int *x = malloc(n * sizeof(int));
	for (i = 0, j = m, k = 0; k < n; k++)
	{
		N_COMP++;
		if (r() > eps)
		{ //no failure
			x[k] = j == n ? a[i++]
						  : i == m ? a[j++]
								   : a[j] < a[i] ? a[j++]
												 : a[i++];
		}
		else
		{ // failure
			x[k] = j == n ? a[i++]
						  : i == m ? a[j++]
								   : a[j] >= a[i] ? a[j++]
												  : a[i++];
		}
	}
	for (i = 0; i < n; i++)
	{
		a[i] = x[i];
	}
	free(x);
}

void merge_sort(int *a, int n)
{
	if (n < 2)
		return;
	int m = n / 2;
	merge_sort(a, m);
	merge_sort(a + m, n - m);
	merge(a, n, m);
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
	merge_sort(A, n);
	long N_WRONG_COMP = N_COMP;
	N_COMP = 0;

	/*
	//ordenada com falhas
        printf("%d",A[0]);
        for (i=1; i<n;i++)
                printf(" %d", A[i]);
        printf("\n");
*/

	//count = length of the longest non-decreasing string
	int count = LNDS(n);
	int c = xxx(n);


        eps = -1.0;

	//no memory fault;
        merge_sort(B,n);

	/*
	//ordenada corretamente
        printf("%d",B[0]);
        for (i=1; i<n;i++)
                printf(" %d", B[i]);
	*/

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
