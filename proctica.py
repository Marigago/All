import statsmodels as sm
from ucimlrepo import fetch_ucirepo 
  
# fetch dataset 
statlog_german_credit_data = fetch_ucirepo(id=144) 
  
# data (as pandas dataframes) 
df = statlog_german_credit_data.data.features 
y = statlog_german_credit_data.data.targets 

df

# Definir las variables independientes (X) y la variable dependiente (y)
X = df[['Attribute8', 'Attribute11', 'Attribute13', 'Attribute16', 'Attribute18']]
y = df['Attribute5']

# Ajustar el modelo utilizando Generalized Method of Moments (GMM)
gmm_model = sm.GMM(y, X)
gmm_results = gmm_model.fit()

# Imprimir los resultados
print(gmm_results.summary())
