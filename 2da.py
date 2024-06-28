# -*- coding: utf-8 -*-
"""
Created on Mon Jan 22 07:40:25 2024

@author: maria
"""

import pandas as pd
'''
Nombres= "Cristofer", "Roi", "Ivan", "Rafa", "Esteban"
Edades= 21, 20, 19, 18, 18

Alumnos = pd.Series(data= Edades, index= Nombres)
Alumnos_dic= {"Cristofer":21, "Roi":19, "Ivan":29, "Esteban":18}

#Series: un indice y una columna 
Alumnos_dic_Series= pd.Series(Alumnos_dic)
print(Nombres)
print(Edades)
print(Alumnos)
print(Alumnos_dic_Series)

Alumnos_list_df= pd.DataFrame(index= Nombres, data=Edades)
print(Alumnos_list_df)

data= [[21,1.80],[19,1.70],[20, 1.75],[18, 1.65],[18,1.70]]
Alumnos_df= pd.DataFrame(index= Nombres, data=data, columns=['Edad', 'Estatura'])
print(Alumnos_df)

url='https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
col_names=['Sepal_lenght', 'Sepal_width', 'Petal_lenght', 'Petal_width','Class']
iris_pd=pd.read_csv(url, names=col_names)
print(iris_pd)

iris_pd.head()
iris_pd.tail()'''

Title="Coquer Spaniel", "Schnoutzer", "Pug", "Chihuahua", "Pastor Aleman", "French Puddle", "Chau Chau", "Dalmata", "Maltes", "Rod Wailer"
Title_S=pd.Series(Title)
print(Title_S)
Perros= pd.DataFrame(index= Nombres, data=data, columns=['Edad_Prom', 'Peso', 'Origen', ''])
print(Alumnos_df)

