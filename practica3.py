import pandas as pd

import os

def buscar_archivo(nombre_archivo, directorio_inicial='C:\\'):
    for ruta_actual, directorios, archivos in os.walk(directorio_inicial):
        if nombre_archivo in archivos:
            return os.path.join(ruta_actual, nombre_archivo)
    return None

Data = buscar_archivo("heart.csv")
print("Datos en:\n",Data,'\n')

DataSet = pd.read_csv(Data)
print("Dataset:\n",DataSet,'\n')
print("Método head:\n",DataSet.head(1),'\n')
print("Método info:\n",DataSet.info(),'\n')
print("Método tail:\n" ,DataSet.tail(1),'\n')
print("Método shape:\n",DataSet.shape,'\n')
print("Métod index:\n", DataSet.index,'\n')
print("Método count:\n",DataSet.count)



