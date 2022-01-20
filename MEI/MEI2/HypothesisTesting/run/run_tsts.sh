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

echo "N MIN: $1"
echo "N MAX: $2"
echo "STEP: $3"

echo "Compiling quicksort..."
gcc quicksort.c -o quick
echo "Compiling mergesort..."
gcc mergesort.c -o merge
echo "Compiling insertionsort..."
gcc insertionsort.c -o insert
echo "Compiling bubblesort..."
gcc bubblesort.c -o bubble


echo "Running input generator..."
python input_generator.py $1 $2 $3

echo "Cleaning Inputs Folder..."
rm -rf inputs/
