import os
import datetime
import pymongo
import pprint
import pandas as pd


host_name = "localhost"
port = "27017"

atlas_cluster_name = "cluster0.xuibg2h"
atlas_default_dbname = "local"
atlas_user_name = "ds2002"
atlas_password = "uva1819"

conn_str = {
    "local" : f"mongodb://{host_name}:{port}/",
    "atlas" : f"mongodb+srv://{atlas_user_name}:{atlas_password}@{atlas_cluster_name}.mongodb.net/{atlas_default_dbname}"
}

client = pymongo.MongoClient(conn_str["atlas"])

db_name = "blog"

db = client[db_name]
# print(f"Local Connection String: {conn_str['local']}")
# print(f"Atlas Connection String: {conn_str['atlas']}")
client.list_database_names()