import pandas as pd
import numpy as np


df = pd.read_csv(r'C:\Users\maria\Desktop\Segundo_periodo\LAB\dataset.csv')
print(df)

###############
min=df.min()
max=df.max()
rest=(max-min)
x=(df-min)/rest
print(x)
###############
mean=df.mean()
x1=(df-mean)/rest
print(x1)
##############
desvest= np.std(df)
x2=(df-mean)/desvest
print(x2)
############
norma = np.linalg.norm(df)
x3=df/norma
print(x3)