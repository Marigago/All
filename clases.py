# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

class Alien:
    def __init__(self, planeta=None, color=None, estatura=None, peso=None):
        self.planeta = planeta
        self.color= color
        self.estatura= estatura 
        self.peso= peso
        
    def mudarse(self, mudado=None):
        self.mudado= mudado
        return self

