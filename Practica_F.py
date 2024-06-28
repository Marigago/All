# -*- coding: utf-8 -*-
"""
Created on Mon Feb 19 07:28:47 2024

@author: maria
"""

import pandas as pd

filepath = open(r"C:\Users\maria\Desktop\Segundo_periodo\LAB\larger_sales_dataset.csv")
filepath.seek(0)
Data = filepath.readlines()
col = Data[0].split(",")
print(col)

Cantidad_product = len(Data)
print("Se vendieron {}".format(Cantidad_product))

index_TP= col.index("Total Price")

Total_price = [n.split(',')[index_TP].strip() for n in Data[1:]]
Total_price_int = [float(x) for x in Total_price]
Venta_total = sum(Total_price_int)
print("La venta total fue de $$ {}".format(Venta_total))

index_PT= col.index("Payment Type")
Sales_type = [n.split(',')[index_PT].strip() for n in Data[1:]]

set_sales = set(Sales_type)
diccionario ={}
for i in set_sales:
    count = Sales_type.count(i)
    diccionario[i] = count
print(diccionario)

for key, value in diccionario.items():
    print("{} Personas compraron con {}".format(value, key))
    
index_OS= col.index("Order Status\n")
Order_status = [n.split(',')[index_OS].strip() for n in Data[1:]]

set_Order = set(Order_status)
diccionario ={}
for i in set_Order:
    count = Order_status.count(i)
    diccionario[i] = count
print(diccionario)

for key, value in diccionario.items():
    print("{} Personas tiene la orden en status con {}".format(value, key))
    
df = pd.read_csv(r"C:\Users\maria\Desktop\Segundo_periodo\LAB\larger_sales_dataset.csv")
print(df.columns)
print(df.index)
print(df["Payment Type"].value_counts())
print(df["Order Status"].value_counts())
print(df["Total Price"].sum())
print(df["Product ID"].count())
