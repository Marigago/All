# -*- coding: utf-8 -*-
"""
Created on Mon Feb 26 16:29:39 2024

@author: maria
"""
import pandas as pd 
import os 

Datas = os.listdir("/Users/maria/Desktop/Segundo_periodo/LAB/folder")
print(Datas)

def archive_type(path):
    _, extencion = os.path.splitext(path)
    return extencion

for data_file in Datas:
    extenxion = archive_type(data_file)
    print(extenxion)
    if extenxion == ".csv":
        df = pd.read_csv("/Users/maria/Desktop/Segundo_periodo/LAB/folder/" + data_file)
    elif extenxion == ".json":
        df = pd.read_json("/Users/maria/Desktop/Segundo_periodo/LAB/folder/" + data_file)
    
    print(df.head(5))
    print(df.tail(5))
    print(df.columns)
    print(df.iloc[:, 1])
    print(df.info())
    print(df.describe())
    print(df.shape) 
    numeric_cols = df.select_dtypes(include=['float64', 'int64'])   
    print(numeric_cols.max())   
    print(numeric_cols.min())  
    print(numeric_cols.cumsum())  
