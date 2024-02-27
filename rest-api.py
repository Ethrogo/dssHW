import requests, sys
import pandas as pd

url = "https://restcountries.com/v3.1/name/"
country_name = input("Enter a country name: ")
url += country_name
response = requests.request("GET", url)

if response.status_code != 200:
    print("Country does not exist")
    sys.exit(0)

response = response.json()
capital = response[0]['capital'][0]
population = response[0]['population']
print("The capital of", country_name, "is", capital)
print("The population of", country_name, "is", population)

df = pd.DataFrame(["Capital", capital], ["Population", population])

json = df.to_json()
with open("countries.json", 'a') as f: 
    f.write(json + "\n")
    