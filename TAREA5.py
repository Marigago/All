import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import  r2_score


df = pd.read_csv("C:/Users/maria/Desktop/Segundo_periodo/ANALISIS_MULT/Mexico_Environmental_Indicators.csv")
y=df.shape[0] 
for i in list(df.columns) : print(i)
print("\n")

# Obtener la cantidad de NaN en cada columna
columnas_con_nan = df.columns[df.isna().any()].tolist()
cantidad_nan_por_columna = df[columnas_con_nan].isna().sum()
print("Cantidad de NaN por columna:\n", cantidad_nan_por_columna)

#Tratamiento, copia de dataset, eliminacion de columnas que tienen mas de 15 columnas con Nan en sus filas 
df_sin_nan=df.copy()
df_sin_nan= df_sin_nan.drop("Renewable energy consumption (% of total final energy consumption)", axis=1)
df_sin_nan= df_sin_nan.drop("Access to electricity (% of population)", axis=1)
df_sin_nan= df_sin_nan.drop("CO2 emissions (kt)", axis=1)
df_sin_nan= df_sin_nan.drop("Total greenhouse gas emissions (kt of CO2 equivalent)", axis=1)
print("\n")

#Eliminar el resto de nans 
df_sin_nan = df_sin_nan.dropna()
columnas_con_nan=df_sin_nan.columns

#Obtener la cantidad de nan despues del tratamiento
cantidad_nan_por_columna = df_sin_nan[columnas_con_nan].isna().sum()
print("Cantidad de NaN por columna:\n", cantidad_nan_por_columna)
print("Porcentualmente nos quedamos en filas con:", (47/61)*100, "%" )

#Dataset final, reasignación 
df=df_sin_nan
print(df)
for i in df.columns: print(i)

# Calculate the correlation matrix
correlation_matrix = df.corr()

# Print the correlation matrix
print(correlation_matrix)

# Visualize the correlation matrix using a heatmap
plt.figure(figsize=(10, 8))
plt.title('Correlation Heatmap')
plt.imshow(correlation_matrix, cmap='coolwarm', interpolation='nearest')
plt.colorbar()
plt.xticks(ticks=np.arange(len(correlation_matrix.columns)), labels=correlation_matrix.columns, rotation=45)
plt.yticks(ticks=np.arange(len(correlation_matrix.columns)), labels=correlation_matrix.columns)
plt.show()

X = df["Year"]  # variable independiente
y = df["CO2 emissions from gaseous fuel consumption (kt)"]  # variable dependiente

# Añadir una constante al valor independiente
X = sm.add_constant(X)

# Realizar la regresión lineal 1 que es con el modelo OLS
modelo = sm.OLS(y, X)
resultados = modelo.fit()

# Imprimir las estadísticas
print(resultados.summary())

# Extraer la variable predictora (X) y la variable objetivo (y)
X = df[['Year']]  # Reemplazar con tu variable predictora elegida
y = df['CO2 emissions from gaseous fuel consumption (kt)']  # Reemplazar con tu variable objetivo

# Dividir los datos en conjuntos de entrenamiento y prueba (80% entrenamiento, 20% prueba)
X_entrenamiento, X_prueba, y_entrenamiento, y_prueba = train_test_split(X, y, test_size=0.2, random_state=42)

# Inicializar el modelo de Regresión Lineal 2 que es con el modelo simple Sklearn
modelo = LinearRegression()

# Ajustar el modelo usando los datos de entrenamiento
modelo.fit(X_entrenamiento, y_entrenamiento)

# Hacer predicciones usando los datos de prueba
y_prediccion = modelo.predict(X_prueba)

# Calcular el Error Porcentual Absoluto Medio (MAPE)
mape = np.mean(np.abs((y_prueba - y_prediccion) / y_prueba)) * 100

print(f"Error Porcentual Absoluto Medio (MAPE): {mape}%")
r2 = r2_score(y_prueba, y_prediccion)
print(f"Puntuación R cuadrado: {r2}")

# Visualizar la línea de regresión
plt.scatter(X_prueba, y_prueba, color='blue', label='Datos Reales')
plt.plot(X_prueba, y_prediccion, color='red', linewidth=2, label='Línea de Regresión')
plt.xlabel('Año')
plt.ylabel('Emisiones de CO2 (kt)')
plt.title('Regresión Lineal Simple')
plt.legend()
plt.show()

print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
# Extraer las variables predictoras (X) y la variable objetivo (y)
X = df[['Year', 'Agricultural land (% of land area)', 'Arable land (% of land area)', 'Other greenhouse gas emissions, HFC, PFC and SF6 (thousand metric tons of CO2 equivalent)']]
y = df['CO2 emissions from gaseous fuel consumption (kt)']

# Añadir una constante a las variables predictoras
X = sm.add_constant(X)

# Realizar la regresión lineal OLS
modelo = sm.OLS(y, X)
resultados = modelo.fit()

# Imprimir las estadísticas del modelo
print(resultados.summary())

# Extraer las variables predictoras (X) y la variable objetivo (y)
X = df[['Year', 'Agricultural land (% of land area)', 'Arable land (% of land area)', 'Other greenhouse gas emissions, HFC, PFC and SF6 (thousand metric tons of CO2 equivalent)']]
y = df['CO2 emissions from gaseous fuel consumption (kt)']

# Dividir los datos en conjuntos de entrenamiento y prueba (80% entrenamiento, 20% prueba)
X_entrenamiento, X_prueba, y_entrenamiento, y_prueba = train_test_split(X, y, test_size=0.2, random_state=42)

# Inicializar el modelo de Regresión Lineal
modelo = LinearRegression()

# Ajustar el modelo usando los datos de entrenamiento
modelo.fit(X_entrenamiento, y_entrenamiento)

# Hacer predicciones usando los datos de prueba
y_prediccion = modelo.predict(X_prueba)

# Calcular el Error Porcentual Absoluto Medio (MAPE)
mape = np.mean(np.abs((y_prueba - y_prediccion) / y_prueba)) * 100

print(f"Error Porcentual Absoluto Medio (MAPE): {mape}%")
r2 = r2_score(y_prueba, y_prediccion)
print(f"Puntuación R cuadrado: {r2}")