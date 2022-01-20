#!/bin/sh

gcc code1.c -o code1 -O3
gcc code2.c -o code2 -O3

FILENAME_DATA_INPUT="data.in"

# Variáveis do gen.py

SEED_GEN=$(shuf -i1-30000 -n1) 
# Variáveis do programa
SEED_PROGRAM=$(shuf -i1-30000 -n1) 
MAX_TIME=300  #in seconds



echo "n_exams probability_pairs seed_gen seed_program min_time_slots time_in_seconds" >> results_code1_meta3_hip2_2.txt
echo "n_exams probability_pairs seed_gen seed_program min_time_slots time_in_seconds" >> results_code2_meta3_hip2_2.txt

# Tests

for exams in 2 20 40
do
    for rep in $(seq 1 30)
    do
        # Run code
        python3 gen.py $exams 20 $SEED_GEN $FILENAME_DATA_INPUT
        SEED_GEN=$(shuf -i1-30000 -n1) 
        for k in 1 2 3
        do
            echo -n "$exams 20 $SEED_GEN $SEED_PROGRAM " >> results_code1_meta3_hip2_2.txt
            ./code1 $SEED_PROGRAM $MAX_TIME $FILENAME_DATA_INPUT >> results_code1_meta3_hip2_2.txt
            echo -n "$exams 20 $SEED_GEN $SEED_PROGRAM " >> results_code2_meta3_hip2_2.txt
            ./code2 $SEED_PROGRAM $MAX_TIME $FILENAME_DATA_INPUT >> results_code2_meta3_hip2_2.txt
        done

        SEED_PROGRAM=$(shuf -i1-30000 -n1)     
    done
done



