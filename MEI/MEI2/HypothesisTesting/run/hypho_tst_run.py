# What do I do?
# I create inputs from 1000 to 200k w/step 1000 of prob between 1% to 15% w/ step 1%

# dont forget to create "inputs" folder before.
# RUN: python input_generator.py N_MIN N_MAX N_STEP
# E.g.: to run from n=1000 to 10000 with 1000 step, run python input_generator.py 1000 10000 1000
import sys
from random import *
from subprocess import call
from time import sleep

EPS = int(sys.argv[1])
EPS = EPS/100
N= 80000
MAX_R = int(N/2)
file_name = "N=" + str(N) + "_EPS=" + str(EPS*100) + "%_MAX_R=" + str(MAX_R) + ".in"
print("Creating " + file_name +"...")
f = open("inputs/" + file_name, "w")
f.write(str(EPS) + " " + str(N) + " " + str(MAX_R))
f.write("\n")
for l in range(N):
  f.write(" " + str(randint(1,MAX_R)))
  f.write("\n")
f.close()

# Run Tests
file_input_name = "inputs/" + file_name
file_output_quick_name = "outputs/quicksort/" + file_name
file_output_merge_name = "outputs/mergesort/" + file_name
file_output_insert_name = "outputs/insertionsort/" + file_name
file_output_bubble_name = "outputs/bubblesort/" + file_name

file_results_quick_name = "results/quicksort/" + file_name
file_results_merge_name = "results/mergesort/" + file_name
file_results_insert_name = "results/insertionsort/" + file_name
file_results_bubble_name = "results/bubblesort/" + file_name


print("ON " + file_input_name + "...")

for i in range(25):
    print("QUICKSORT")
    call("./quick <" + file_input_name + " >> " +  file_output_quick_name, shell = True)

    print("MERGESORT")
    call("./merge <" + file_input_name + " >> " +  file_output_merge_name, shell = True)

    print("INSERTIONSORT")
    call("./insert <" + file_input_name + " >> " +  file_output_insert_name, shell = True)

    print("BUBBLESORT")
    call("./bubble <" + file_input_name + " >> " +  file_output_bubble_name, shell = True)

    sleep(1)

call("python output_parser.py <" + file_output_quick_name + ">" + file_results_quick_name,shell= True)
call("python output_parser.py <" + file_output_merge_name + ">" + file_results_merge_name,shell= True)
call("python output_parser.py <" + file_output_insert_name + ">" + file_results_insert_name,shell= True)
call("python output_parser.py <" + file_output_bubble_name + ">" + file_results_bubble_name,shell= True)
