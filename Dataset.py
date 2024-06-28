# -*- coding: utf-8 -*-
"""
Created on Mon Feb 12 08:23:44 2024

@author: maria
"""

#import pandas as pd

#df = pd.read_csv('C:\\Users\\maria\\Desktop\\Segundo_periodo\\LAB\\larger_sales_dataset.csv', "r")

data = open('C:\\Users\\maria\\Desktop\\Segundo_periodo\\LAB\\larger_sales_dataset.csv', "r")
msg=data.readlines()
columnas=msg[0]
datos=msg[1:]
print ("Columnas:", columnas, "datos:", datos)