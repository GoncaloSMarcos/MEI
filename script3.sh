#!/bin/sh

gcc code1.c -o code1 -O3
gcc code2.c -o code2 -O3

FILENAME_DATA_INPUT="data.in"

# Variáveis do gen.py
N_EXAMS=50  # Max 299 segundo o enunciado
PROBABILITY_PAIRS=20 # Out of 100
EXAMS_INCREMENT_VALUE=2
SEED_GEN=$(shuf -i1-30000 -n1) 
# Variáveis do programa
SEED_PROGRAM=$(shuf -i1-30000 -n1) 
MAX_TIME=120  #in seconds



echo "n_exams probability_pairs seed_gen seed_program min_time_slots time_in_seconds" >> results_code1.txt
echo "n_exams probability_pairs seed_gen seed_program min_time_slots time_in_seconds" >> results_code2.txt

# Tests

for i in $(seq 1 20)
do
    for exams in $(seq 10 40)
    do
        for probs in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
        do
            # Run code
            python3 gen.py $exams $probs $SEED_GEN $FILENAME_DATA_INPUT
            SEED_GEN=$(shuf -i1-30000 -n1) 

            echo -n "$exams $probs $SEED_GEN $SEED_PROGRAM " >> results_code1.txt
            ./code1 $SEED_PROGRAM $MAX_TIME $FILENAME_DATA_INPUT >> results_code1.txt
            echo -n "$exams $probs $SEED_GEN $SEED_PROGRAM " >> results_code2.txt
            ./code2 $SEED_PROGRAM $MAX_TIME $FILENAME_DATA_INPUT >> results_code2.txt
        done
        SEED_PROGRAM=$(shuf -i1-30000 -n1)     
    done
done
