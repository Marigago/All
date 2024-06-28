USE produccion3;
GO
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

--pregunta 1
SELECT *
FROM Pedido
WHERE CONVERT(date, Fecha) >= '2024-02-01'
AND CONVERT(date, Fecha) < '2024-03-01';

--pregunta 2
SELECT COUNT(IdOrden) AS CantidadOrdenes
FROM Orden;

--pregunta3
SELECT TOP 1 descripcion, Precio
FROM Producto
ORDER BY Precio DESC;

--pregunta 4
SELECT codigo, DATEDIFF(day, fecha, entrega) AS DiasDiferencia
FROM Pedido
WHERE DATEDIFF(day, fecha, entrega) > 2;

--pregunta 5
SELECT idproducto, descripcion
FROM Producto
WHERE idtipo IN (SELECT idtipo FROM TipoPan WHERE tipo = 'salado');

--pregunta 6
SELECT COUNT(idpedido) AS TotalPedidos
FROM Pedido;

--pregunta 7
SELECT COUNT(idordenpedido) AS TotalPedidosFabricados
FROM OrdenPedido;

--pregunta 8
SELECT descripcion, precio
FROM Producto
WHERE precio >= 20 AND precio < 70;

--pregunta 9
SELECT MIN(precio) AS PrecioProductoMasBarato
FROM Producto;

--pregunta 10
SELECT DISTINCT idpanadero
FROM Orden;

--pregunta 11
SELECT COUNT(*) AS TotalPedidosFebrero2024
FROM Pedido
WHERE YEAR(fecha) = 2024 AND MONTH(fecha) = 2;

--pregunta 12
SELECT idproducto, SUM(cantidad) AS CantidadPedida
FROM Pedidodetalle
GROUP BY idproducto;

--pregunta 13
SELECT DISTINCT idproducto
FROM Ordendetalle;

--pregunta 14
SELECT 
    nombre + ' ' + paterno + ' ' + materno AS NombreCompleto,
    DATEDIFF(DAY, fechaingreso, GETDATE()) / 7 AS SemanasLaboradas,
    YEAR(GETDATE()) - YEAR(fechanacimiento) AS Edad
FROM 
    Panadero
WHERE 
    idstatus = 1;

--pregunta 15
SELECT razonsocial, rfc
FROM Cliente
where (razonsocial LIKE '%SA' OR razonsocial LIKE '%SC');

--pregunta 16
SELECT TOP 10 descripcion, precio
FROM Producto
ORDER BY precio DESC;








