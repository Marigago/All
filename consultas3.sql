use produccion3
go

--1
SELECT p.descripcion AS Descripcion, SUM(pd.subtotal) AS Ingreso, SUM(pd.cantidad) AS Cantidad
FROM pedidodetalle pd
INNER JOIN pedido pe ON pd.idpedido = pe.idpedido
INNER JOIN producto p ON pd.idproducto = p.idproducto
GROUP BY p.descripcion
ORDER BY Ingreso DESC;


--2
select descripcion, tipo, sum(cantidad) as cantidad
from pedidodetalle
inner join producto on pedidodetalle.idproducto = producto.idproducto
inner join tipopan on producto.idtipo = tipopan.idtipo
where cantidad < 50
group by descripcion, tipo;

--3
select top 5 razonsocial, sum(subtotal) as monto, cliente.idcliente
from cliente 
inner join pedido on cliente.idcliente = pedido.idcliente
inner join pedidodetalle on pedido.idpedido = pedidodetalle.idpedido
group by cliente.idcliente, razonsocial
order by monto desc;

--4
SELECT tp.tipo AS TipoPan,
       SUM(pd.cantidad) AS Cantidad,
	   c.idcliente, c.razonsocial
FROM cliente c
INNER JOIN pedido pe ON c.idcliente = pe.idcliente
INNER JOIN pedidodetalle pd ON pe.idpedido = pd.idpedido
INNER JOIN producto p ON pd.idproducto = p.idproducto
INNER JOIN tipopan tp ON p.idtipo = tp.idtipo
GROUP BY c.idcliente, c.razonsocial, tp.tipo, c.idcliente, pd.cantidad
HAVING tp.tipo = 'Dulce' AND SUM(pd.cantidad) >= 100;

--5
SELECT p.descripcion AS Producto,
       pd.cantidad AS Cantidad,
       CASE
           WHEN pd.cantidad >= 100 THEN 'Muchos'
           WHEN pd.cantidad BETWEEN 50 AND 99 THEN 'Regular'
           ELSE 'Pocos'
       END AS Clasificacion
FROM pedido pe
INNER JOIN pedidodetalle pd ON pe.idpedido = pd.idpedido
INNER JOIN producto p ON pd.idproducto = p.idproducto;

--6
select sum(cantidad) as cantidad, tipo, fecha
from orden
inner join ordendetalle on orden.idorden = ordendetalle.idorden
inner join producto on Ordendetalle.idproducto = producto.idproducto
inner join tipopan on producto.idtipo = tipoPan.idtipo
where fecha >='2024-01-15' and fecha<= '2024-02-15'
group by tipo, fecha;

--7
select razonsocial, sum(cantidad) as cantidad, pedido.idcliente
from pedido
inner join cliente on pedido.idcliente = cliente.idcliente
inner join pedidodetalle on pedido.idpedido = pedidodetalle.idpedido
group by razonsocial, pedido.idcliente;

--8
SELECT o.idorden AS NumeroOrden,
       pe.fecha as fechaorden,
       COUNT(DISTINCT pe.idpedido) AS CantidadPedidos,
       SUM(pd.cantidad) AS TotalPanes
FROM OrdenPedido o
left join pedido pe on o.idpedido = pe.idpedido
INNER JOIN pedidodetalle pd ON pe.idpedido = pd.idpedido
GROUP BY o.idorden, pe.fecha;

--9
SELECT p.nombre AS NombrePanadero,
       COALESCE(fp.pan, '-') AS PanFabricado,
       COALESCE(fp.cantidad, 0) AS CantidadFabricada
FROM panadero p
INNER JOIN (
    SELECT panadero.idpanadero,
           producto.descripcion as pan,
           SUM(cantidad) AS cantidad
    FROM panadero
    INNER JOIN orden ON panadero.idpanadero = orden.idpanadero
	inner join ordendetalle on orden.idorden = ordendetalle.idorden
	inner join producto on ordendetalle.idproducto = producto.idproducto
    GROUP BY panadero.idpanadero, producto.descripcion
) AS fp ON p.idpanadero = fp.idpanadero;

--10
SELECT p.idpedido AS CodigoPedido,
       p.fecha AS FechaPedido,
       p.total AS TotalVenta
FROM pedido p
WHERE p.total < (
    SELECT AVG(total) 
    FROM pedido
);

