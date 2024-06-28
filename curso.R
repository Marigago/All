#funcion scan() para vector R 
# - scan () nos permite introducir una lista desde la consola 
# -scan(fichero) define un vector a vartir de un fichero 

datos1= scan()
datos1

datos2 =  scan("C:\\Users\\maria\\Documents\\datos.txt")
datos2[14]

length(datos2)

#Admite parametros 
#sep: especifica el signo de la seperacion en las entradas. Por defecto es espacio en blanco
scan(sep=',')

#Tenemos un seprador para decimale, por defecto es el punto

scan(dec=',', sep='.')
#parametro what: especifica el tipo de dato
#los caracteres se ponian entre comillas 

scan(what="character")

