#!/bin/sh

MAX_ITERATIONS=10

FILENAME_DATA_INPUT="data.in"

# Variáveis do gen.py
N_EXAMS=50    # Max 299 segundo o enunciado
PROBABILITY_PAIRS=0.1 # 0.0 a 1.0
SEED_GEN=1234

# Variáveis do programa
SEED_PROGRAM=1234
MAX_TIME=100  #in seconds


# Tests
I=0
while [ $I -le $MAX_ITERATIONS ]
do
    
    # Run code
    python3 gen.py $N_EXAMS $PROBABILITY_PAIRS $SEED_GEN $FILENAME_DATA_INPUT
    ./code1 $SEED_PROGRAM $MAX_TIME $FILENAME_DATA_INPUT >> results.txt

    # Increment variables
    N_EXAMS=$(( N_EXAMS+10 ))
    #PROBABILITY_PAIRS=$(( PROBABILITY_PAIRS+0.02 ))

    I=$(( I+1 ))
done