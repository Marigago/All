USE produccion3;
GO


-- Crear una nueva tabla con la estructura deseada
CREATE TABLE orden_temp (
    idorden INT IDENTITY(1,1),
    orden VARCHAR(50),
    fecha DATE,
    idpanadero INT,
    idturno INT
);

-- Copiar los datos de la tabla antigua a la nueva
INSERT INTO orden_temp (orden, fecha, idpanadero, idturno)
SELECT orden, fecha, idpanadero, idturno FROM orden;

--Desacctivar las conecciones
ALTER TABLE Ordendetalle
DROP CONSTRAINT FK_Ordendetalle_Orden;
ALTER TABLE Ordenpedido
DROP CONSTRAINT FK_OrdenPedido_Orden;

-- Eliminar la tabla antigua
DROP TABLE orden;

-- Renombrar la nueva tabla para reemplazar a la antigua
EXEC sp_rename 'orden_temp', 'Orden';

----------------

--Hacer idorden una llave primaria
ALTER TABLE orden
ADD PRIMARY KEY (idorden);

--Reactivar las restricciones
ALTER TABLE Ordendetalle
ADD CONSTRAINT FK_Ordendetalle_Orden
FOREIGN KEY (idorden)
REFERENCES orden (idorden);

ALTER TABLE Ordenpedido
ADD CONSTRAINT FK_OrdenPedido_Orden
FOREIGN KEY (idorden)
REFERENCES orden (idorden);

ALTER TABLE Orden
ADD CONSTRAINT FK_Orden_Panadero
FOREIGN KEY (idpanadero)
REFERENCES panadero (idpanadero);

ALTER TABLE Orden
ADD CONSTRAINT FK_Orden_Turno
FOREIGN KEY (idturno)
REFERENCES turno (idturno);

--Confirmacion
SELECT COLUMN_NAME, TABLE_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orden'
AND COLUMN_NAME = 'idorden'
AND COLUMNPROPERTY(object_id(TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 1;
