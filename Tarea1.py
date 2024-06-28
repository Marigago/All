#import pandas as pd 
import os
def buscar_archivo(nombre_archivo, directorio_inicial='C:\\'):
    for ruta_actual, directorios, archivos in os.walk(directorio_inicial):
        if nombre_archivo in archivos:
            return os.path.join(ruta_actual, nombre_archivo)
    return None

Data = buscar_archivo("HousePrices.csv")
