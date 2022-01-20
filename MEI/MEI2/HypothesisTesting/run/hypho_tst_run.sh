echo "Welcome to the script created by aeloi for the  MEI assignment"

mkdir inputs/

mkdir outputs
mkdir outputs/quicksort
mkdir outputs/mergesort
mkdir outputs/insertionsort
mkdir outputs/bubblesort

mkdir results/
mkdir results/quicksort
mkdir results/mergesort
mkdir results/insertionsort
mkdir results/bubblesort

echo "EPS_1: $1"
echo "EPS_2: $2"

echo "First EPS"
echo "Compiling quicksort..."
gcc quicksort.c -o quick
echo "Compiling mergesort..."
gcc mergesort.c -o merge
echo "Compiling insertionsort..."
gcc insertionsort.c -o insert
echo "Compiling bubblesort..."
gcc bubblesort.c -o bubble


echo "Running input generator..."
python3 hypho_tst_run.py $1

echo "Cleaning Inputs Folder..."
#rm -rf inputs/

echo "Second EPS"
echo "Running input generator..."
python3 hypho_tst_run.py $2

echo "Cleaning Inputs Folder..."
#rm -rf inputs/
