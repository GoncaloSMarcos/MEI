# What do I do?
# I create inputs from 1000 to 200k w/step 1000 of prob between 1% to 15% w/ step 1%

# dont forget to create "inputs" folder before.
# RUN: python input_generator.py N_MIN N_MAX N_STEP
# E.g.: to run from n=1000 to 10000 with 1000 step, run python input_generator.py 1000 10000 1000
import sys
from random import *
from subprocess import call
from time import sleep

N_MIN = int(sys.argv[1])
N_MAX =  int(sys.argv[2])
N_STEP = int((sys.argv[3]))

EPS_MIN = 0.002
EPS_MAX = 0.10
EPS_STEP = 0.002

n = N_MIN
while(n <= N_MAX):
  eps = EPS_MIN

  while(eps <= EPS_MAX):
    max_r = int(n/3)

    while(max_r <= n):
      file_name = "N=" + str(n) + "_EPS=" + str(eps*100) + "%_MAXR=" + str(max_r) + ".in"
      print("Creating " + file_name +"...")
      f = open("inputs/" + file_name, "w")
      f.write(str(eps) + " " + str(n) + " " + str(max_r))

      for l in range(n):
        f.write(" " + str(randint(1,max_r)))
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

      for i in range(3):
        print("QUICKSORT")
        call("./quick <" + file_input_name + " >> " +  file_output_quick_name, shell = True)

        print("MERGESORT")
        call("./merge <" + file_input_name + " >> " +  file_output_merge_name, shell = True)

        print("INSERTIONSORT")
        call("./insert <" + file_input_name + " >> " +  file_output_insert_name, shell = True)

        if (n <= 52000):
          print("BUBBLESORT")
          call("./bubble <" + file_input_name + " >> " +  file_output_bubble_name, shell = True)

        sleep(1)

      call("python output_parser.py <" + file_output_quick_name + ">" + file_results_quick_name,shell= True)
      call("python output_parser.py <" + file_output_merge_name + ">" + file_results_merge_name,shell= True)
      call("python output_parser.py <" + file_output_insert_name + ">" + file_results_insert_name,shell= True)
      call("python output_parser.py <" + file_output_bubble_name + ">" + file_results_bubble_name,shell= True)

      max_r = max_r + n/3
    eps = eps + EPS_STEP
  n = n + N_STEP
