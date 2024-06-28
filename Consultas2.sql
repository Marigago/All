USE produccion3;
GO

--pregunta 1
SELECT Producto.Descripcion, Producto.Precio
FROM Producto
WHERE NOT EXISTS (
    SELECT *
    FROM PedidoDetalle
    INNER JOIN Pedido ON PedidoDetalle.IdPedido = Pedido.IdPedido
    WHERE PedidoDetalle.IdProducto = Producto.IdProducto
);

--pregunta 2
SELECT 
    descripcion,
    tipo,
    codigo,
    entrega
FROM 
    producto
    INNER JOIN TipoPan ON producto.idtipo = TipoPan.idtipo
    INNER JOIN Pedidodetalle ON producto.idproducto = Pedidodetalle.idproducto
    INNER JOIN Pedido ON Pedidodetalle.idpedido = Pedido.idpedido
WHERE 
    YEAR(Pedido.entrega) = 2024 AND MONTH(Pedido.entrega) = 3;
	
--pregunta 3--
SELECT razonsocial, telefono, codigo, entrega, orden.fecha
FROM cliente
INNER JOIN pedido ON  pedido.idcliente = cliente.idcliente
INNER JOIN OrdenPedido ON  pedido.idpedido = OrdenPedido.idpedido
INNER JOIN orden ON orden.idorden = OrdenPedido.idorden
WHERE entrega < orden.fecha;

--pregunta 4
SELECT nombre, orden, codigo
FROM  panadero
INNER JOIN orden on orden.idpanadero =panadero.idpanadero
inner join ordenpedido on ordenpedido.idorden = orden.idorden
inner join pedido on pedido.idcliente = OrdenPedido.idorden
WHERE pedido.fecha >= orden.fecha;

--pregunta 5--
select p.nombre +' '+ p.paterno, o.fecha, pr.descripcion
from  panadero p
inner join orden o on o.idpanadero =p.idpanadero
inner join ordendetalle od on od.idorden = o.idorden
inner join producto pr on pr.idproducto = od.idproducto;


--pregunta 6
SELECT pedido.codigo
FROM pedido
LEFT JOIN ordenpedido on OrdenPedido.idpedido= pedido.idpedido
left join orden on orden.idorden = ordenpedido.idorden
WHERE orden.idorden is null;

--pregunta 7
SELECT DISTINCT cliente.idcliente
FROM cliente
INNER JOIN pedido ON cliente.idcliente = pedido.idcliente;




