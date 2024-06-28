# -*- coding: utf-8 -*-
"""
Created on Mon Jan 29 07:30:59 2024

@author: maria
"""

import cv2
import numpy as np

image_path = r"C:/Users/maria/Desktop/Segundo periodo/LAB/D.jpg"
image_path="D.jpg"
imagen_original = cv2.imread(image_path)

cv2.imshow('Imagen original', imagen_original)
if cv2.waitKey(0)==ord('q'):
   cv2.destroyAllWindows()


def white_pass(imagen):
        
    r, c, d = imagen.shape
    
    for i in range(r):
        max_value_b = np.max(imagen[:,:,0]) 
        max_value_g = np.max(imagen[:,:,1])  
        max_value_r = np.max(imagen[:,:,2])  
        if max_value_b != 0:
            imagen[:,:,0] = (imagen[:,:,0] / max_value_b) *255 
            imagen[:,:,1] = (imagen[:,:,1] / max_value_g) *255 
            imagen[:,:,2] = (imagen[:,:,2] / max_value_r) *255 
    return imagen

def clasificador(imagen, imagen_bin, r, c):
    # BGR
    for i in range(r):
        for j in range(c):
            if 27 <= imagen[i, j, 0] < 85:  # B
                if 61 <= imagen[i, j, 1] < 167:  # G
                    if 167 <= imagen[i, j, 2] < 255:  # R
                        imagen_bin[i, j, :] = 255
    return imagen_bin


def clasificador_chromatic(imagen_original,r,c):
    imagen_cr = imagen_original.copy()
    imagen = np.asarray(imagen_original, dtype = np.uint16)
    imagen_cr = np.asarray(imagen_cr, dtype = np.float32)

    for i in range(r):
        for j in range(c):
            sumaRGB = (imagen[i,j,2] + imagen[i,j,1] + imagen[i,j,0]) 
            if imagen[i,j,2] + imagen[i,j,1] + imagen[i,j,0] !=0:
                imagen_cr[i,j,2] = imagen[i,j,2] / sumaRGB
                imagen_cr[i,j,1] = imagen[i,j,1] / sumaRGB
                imagen_cr[i,j,0] = imagen[i,j,0] / sumaRGB
            else:
                imagen_cr[i,j,2] = imagen[i,j,2] / 1
                imagen_cr[i,j,1] = imagen[i,j,1] / 1
                imagen_cr[i,j,0] = imagen[i,j,0] / 1

    imagen = np.asarray(imagen, dtype = np.uint8)
    
    return imagen_cr 

r, c, d = imagen_original.shape
imagen_cromatica = clasificador_chromatic(imagen_original, r,c)
cv2.imshow("Imagen_cromatica", imagen_cromatica)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_bin = np.zeros_like(imagen_original)
imagen_bin=clasificador(imagen_original, imagen_bin, r, c)
cv2.imshow("Imagen_bin", clasificador(imagen_cromatica, imagen_bin, r, c))
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()
    
imagen_nivel_uno = imagen_original.copy()
imagen_nivel_uno=imagen_nivel_uno*0.3
imagen_nivel_uno=imagen_nivel_uno.astype(np.uint8)
cv2.imshow("Imagen_nivel_uno", imagen_nivel_uno)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_bin_nivel_uno = imagen_nivel_uno.copy()
imagen_cromatica_nivel_uno = clasificador_chromatic(imagen_bin_nivel_uno, r, c)
cv2.imshow("Imagen_cromatica_nivel_uno", imagen_cromatica_nivel_uno)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_bin_nivel_uno = clasificador(imagen_bin_nivel_uno, imagen_bin, r, c)
cv2.imshow("Imagen_bin_nivel_uno", imagen_bin_nivel_uno)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_nivel_dos= imagen_original.copy()
imagen_nivel_dos=imagen_nivel_dos*0.6
imagen_nivel_dos=imagen_nivel_dos.astype(np.uint8)
cv2.imshow("Imagen_nivel_dos", imagen_nivel_dos)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_bin_nivel_dos = imagen_nivel_dos.copy()
imagen_cromatica_nivel_dos = clasificador_chromatic(imagen_bin_nivel_dos, r, c)
cv2.imshow("Imagen_cromatica_nivel_dos", imagen_cromatica_nivel_dos)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_bin_nivel_dos = clasificador(imagen_bin_nivel_dos, imagen_bin, r, c)
cv2.imshow("Imagen_bin_nivel_dos", imagen_bin_nivel_dos)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

#####
imagen_whitp =imagen_original.copy()
imagen_whitp [:,:,2]= imagen_whitp + 60
cv2.imshow("Imagen_aumentada 1", imagen_whitp)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_whitp_Normalizada =imagen_whitp.copy()
imagen_whitp_Normalizada = white_pass(imagen_whitp_Normalizada)
cv2.imshow("Imagen_aumentada Normalizada", imagen_whitp_Normalizada)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()  

imagen_whitp_Normalizada_cromatica = imagen_whitp_Normalizada.copy()
imagen_whitp_Normalizada_cromatica = clasificador_chromatic(imagen_whitp_Normalizada_cromatica, r, c)
cv2.imshow("Imagen_cromatica_del normalizado 1", imagen_whitp_Normalizada_cromatica)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_cromatica = clasificador_chromatic(imagen_original, r,c)
imagen_bin = np.zeros_like(imagen_original)
imagen_bin=clasificador(imagen_original, imagen_bin, r, c)
cv2.imshow("Imagen_bin_ del aumentado", clasificador(imagen_cromatica, imagen_bin, r, c))
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

###

imagen_whitp2 =imagen_original.copy()
imagen_whitp [:,:,1]= imagen_whitp2 + 60
cv2.imshow("Imagen_aumentada 2", imagen_whitp2)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_whitp_Normalizada2 =imagen_whitp2.copy()
imagen_whitp_Normalizada2 = white_pass(imagen_whitp_Normalizada2)
cv2.imshow("Imagen_aumentada Normalizada 2", imagen_whitp_Normalizada2)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()  

imagen_whitp_Normalizada_cromatica2 = imagen_whitp_Normalizada.copy()
imagen_whitp_Normalizada_cromatica2 = clasificador_chromatic(imagen_whitp_Normalizada_cromatica2, r, c)
cv2.imshow("Imagen_cromatica_del normalizado 2", imagen_whitp_Normalizada_cromatica2)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_cromatica = clasificador_chromatic(imagen_whitp2, r,c)
imagen_bin = np.zeros_like(imagen_whitp2)
imagen_bin=clasificador(imagen_whitp2, imagen_bin, r, c)
cv2.imshow("Imagen_bin_del aumentado 2", clasificador(imagen_cromatica, imagen_bin, r, c))
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

###
imagen_whitp3 =imagen_original.copy()
imagen_whitp [:,:,0]= imagen_whitp3 + 60
cv2.imshow("Imagen_aumentada 3", imagen_whitp3)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_whitp_Normalizada3 =imagen_whitp3.copy()
imagen_whitp_Normalizada3 = white_pass(imagen_whitp_Normalizada3)
cv2.imshow("Imagen_aumentada Normalizada 3", imagen_whitp_Normalizada3)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()  

imagen_whitp_Normalizada_cromatica3 = imagen_whitp_Normalizada.copy()
imagen_whitp_Normalizada_cromatica3 = clasificador_chromatic(imagen_whitp_Normalizada_cromatica3, r, c)
cv2.imshow("Imagen_cromatica_del normalizado 3", imagen_whitp_Normalizada_cromatica3)
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

imagen_cromatica = clasificador_chromatic(imagen_whitp3, r,c)
imagen_bin = np.zeros_like(imagen_whitp3)
imagen_bin=clasificador(imagen_whitp3, imagen_bin, r, c)
cv2.imshow("Imagen_bin_del aumentado 23", clasificador(imagen_cromatica, imagen_bin, r, c))
if cv2.waitKey(0)==ord('q'):
    cv2.destroyAllWindows()

    

    

    





