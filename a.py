with open("results_code2_meta3_hip2_2.txt", "r") as f:
    lines = f.readlines();

with open("hip2_a", "a") as f:
    for line in lines:
        f.write("2 " + line)
 
