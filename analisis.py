import pandas as pd
import numpy as np
path="C:/Users/maria/Desktop/Segundo_periodo/LAB/data_electronics_no_spck_comwdrm.csv"
df=pd.read_csv(path)
df.pop("Campaign ID")
df.pop("Influencer ID")
print(df.isna().sum())

variables = df.columns
for i in variables:
    hist2 = df[i].hist(bins=50)
    print(hist2)





