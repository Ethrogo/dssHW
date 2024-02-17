import json
import pandas as pd

with open('coll bb_SortByConf.json') as f:
    data = json.load(f)

df = pd.json_normalize(data['teams'])

print(df.head(100))

#Question 1#
print("There are", len(df.index), "teams") #Answer = 320

#Question 2#
count = 0
reverse_count = 0
for index in df.index: 
    if df.state[index] == "VA":
        count += 1
print("There are", count, "teams in VA") #answer = 13
#Question 3#
mascot_list = {}
for index in df.index: 
    name = df.name[index]
    if name in mascot_list: 
        mascot_list[name] += 1
    else: 
        mascot_list[name] = 1
for key in mascot_list: 
    if mascot_list[key] > 1: 
        print("Team", key, "has", mascot_list[key])