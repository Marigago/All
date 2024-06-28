# -*- coding: utf-8 -*-
"""
Created on Thu Feb 22 08:53:14 2024

@author: maria
"""

import cv2
import numpy as np

def white_pass(imagen):
    max_value_b = np.max(imagen[:, :, 0])
    max_value_g = np.max(imagen[:, :, 1])
    max_value_r = np.max(imagen[:, :, 2])

    if max_value_b != 0:
        imagen[:, :, 0] = (imagen[:, :, 0] / max_value_b) * 255 * 2
    if max_value_g != 0:
        imagen[:, :, 1] = (imagen[:, :, 1] / max_value_g) * 255 * 2
    if max_value_r != 0:
        imagen[:, :, 2] = (imagen[:, :, 2] / max_value_r) * 255 * 2

    return imagen


def clasificador(imagen, imagen_bin):
    for i in range(imagen.shape[0]):
        for j in range(imagen.shape[1]):
            if 20 <= imagen[i, j, 0] < 90 and 60 <= imagen[i, j, 1] < 170 and 170 <= imagen[i, j, 2] < 255:
                imagen_bin[i, j, :] = 255
    return imagen_bin

def clasificador_chromatic(imagen):
    imagen_cr = imagen.astype(np.float32)

    for i in range(imagen.shape[0]):
        for j in range(imagen.shape[1]):
            sumaRGB = np.sum(imagen[i, j])
            if sumaRGB != 0:
                imagen_cr[i, j, 2] = imagen[i, j, 2] / sumaRGB
                imagen_cr[i, j, 1] = imagen[i, j, 1] / sumaRGB
                imagen_cr[i, j, 0] = imagen[i, j, 0] / sumaRGB

    return imagen_cr

def mostrar_imagen(nombre_ventana, imagen):
    cv2.imshow(nombre_ventana, imagen)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

image_path = "C:/Users/maria/Desktop/Segundo_periodo/LAB/D.jpg"
imagen_original = cv2.imread(image_path)
mostrar_imagen('Imagen original', imagen_original)

imagen_whitp = imagen_original.copy()
imagen_whitp[:, :, 2] += 60
mostrar_imagen("Imagen_aumentada 1", imagen_whitp)

imagen_whitp_Normalizada = white_pass(imagen_whitp)
mostrar_imagen("Imagen_aumentada Normalizada", imagen_whitp_Normalizada)

imagen_whitp_Normalizada_cromatica = clasificador_chromatic(imagen_whitp_Normalizada)
imagen_bin_del_aumentado = clasificador(imagen_whitp_Normalizada_cromatica, np.zeros_like(imagen_whitp))
mostrar_imagen("Imagen_bin_del aumentado con el normalizado", imagen_bin_del_aumentado)

imagen_cromatica = clasificador_chromatic(imagen_whitp)
imagen_bin = clasificador(imagen_whitp, np.zeros_like(imagen_whitp))
mostrar_imagen("Imagen_bin_del aumentado con la primer imagen", imagen_bin)

imagen_whitp2 = imagen_original.copy()
imagen_whitp2[:, :, 1] += 60
mostrar_imagen("Imagen_aumentada 2", imagen_whitp2)

imagen_whitp_Normalizada2 = white_pass(imagen_whitp2)
mostrar_imagen("Imagen_aumentada Normalizada 2", imagen_whitp_Normalizada2)

imagen_whitp_cromatica2 = clasificador_chromatic(imagen_whitp2)
imagen_bin_2 = clasificador(imagen_whitp_cromatica2, np.zeros_like(imagen_whitp2))
mostrar_imagen("Imagen_bin_del aumentado 2 del normalizado", imagen_bin_2)

imagen_cromatica2 = clasificador_chromatic(imagen_whitp2)
imagen_bin2 = clasificador(imagen_whitp2, np.zeros_like(imagen_whitp2))
mostrar_imagen("Imagen_bin_del aumentado 2 con la primer imagen", imagen_bin2)

imagen_whitp3 = imagen_original.copy()
imagen_whitp3[:, :, 0] += 60
mostrar_imagen("Imagen_aumentada 3", imagen_whitp3)

imagen_whitp_Normalizada3 = white_pass(imagen_whitp3)
mostrar_imagen("Imagen_aumentada Normalizada 3", imagen_whitp_Normalizada3)

imagen_whitp_Normalizada_cromatica3 = clasificador_chromatic(imagen_whitp_Normalizada3)
imagen_bin3 = clasificador(imagen_whitp_Normalizada_cromatica3, np.zeros_like(imagen_whitp3))
mostrar_imagen("Imagen_bin_del aumentado 3 Normalizado", imagen_bin3)

imagen_cromatica3 = clasificador_chromatic(imagen_whitp3)
imagen_bin3 = clasificador(imagen_cromatica3, np.zeros_like(imagen_whitp3))
mostrar_imagen("Imagen_bin_del aumentado 3 con la primer imagen", imagen_bin3)
