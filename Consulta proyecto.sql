use frias
go 
select *
from TicketProducto

DECLARE @FechaInicio DATE = '2024-01-01';
DECLARE @FechaFin DATE = '2024-04-01';

--10 mejores ventas
WITH VentasProductos AS (
    SELECT TP.idproducto, SUM(TP.cantidad) AS cantidad_vendida
    FROM TicketProducto TP
    INNER JOIN Ticket T ON TP.idticket = T.idticket
    WHERE T.fecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY TP.idproducto
)
SELECT TOP 10 VP.idproducto, P.descripcion AS producto, VP.cantidad_vendida
FROM VentasProductos VP
INNER JOIN Producto P ON VP.idproducto = P.idProducto
ORDER BY VP.cantidad_vendida DESC;

-- Subconsulta para obtener el monto total de cada producto vendido en el rango de fechas
WITH VentasProductos AS (
    SELECT TP.idproducto, SUM(TP.cantidad) AS cantidad_vendida
    FROM TicketProducto TP
    INNER JOIN Ticket T ON TP.idticket = T.idticket
    WHERE T.fecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY TP.idproducto
),
-- Subconsulta para obtener el monto total de cada producto según el procedimiento de cálculo
MontoTotalProductos AS (
    SELECT VP.idproducto, PrecioPorProducto = P.precioUnitario * VP.cantidad
    FROM TicketProducto VP
    INNER JOIN Producto P ON VP.idproducto = P.idProducto
)
-- Unión de las subconsultas para obtener el monto total de cada producto
SELECT MTP.idproducto, VP.cantidad_vendida, SUM(MTP.PrecioPorProducto) AS monto_total
FROM MontoTotalProductos MTP
LEFT JOIN VentasProductos VP ON MTP.idproducto = VP.idproducto
GROUP BY MTP.idproducto, VP.cantidad_vendida
ORDER BY MTP.idproducto;


--Clientes y nuestro ingreso
SELECT
    C.idCliente,
    C.nombre AS Cliente,
    SUM(T.total) AS Ingresos
FROM
    Ticket T
INNER JOIN
    Cliente C ON T.idcliente = C.idCliente
GROUP BY
    C.idCliente, C.nombre
ORDER BY
    Ingresos DESC;

--Ventas por mes
SELECT
    MONTH(T.fecha) AS Mes,
    DATENAME(MONTH, T.fecha) AS NombreMes,
    SUM(T.total) AS TotalVentas
FROM
    Ticket T
WHERE
    YEAR(T.fecha) = 2024
GROUP BY
    MONTH(T.fecha), DATENAME(MONTH, T.fecha)
ORDER BY
    Mes;

-- Corte cajar por dia por vendedor
DECLARE @FechaConsulta DATE = '2024-03-01'; 

SELECT
    E.idEmpleado,
    E.nombre AS Empleado,
    COUNT(T.idticket) AS Transacciones,
    SUM(T.total) AS TotalIngresos
FROM
    Empleado E
INNER JOIN
    Ticket T ON E.idEmpleado = T.idempleado
WHERE
    CONVERT(DATE, T.fecha) = @FechaConsulta
GROUP BY
    E.idEmpleado, E.nombre;


-- Obtener el reporte de ingresos por empleado (reusa la fecha)
WITH ReporteIngresos AS (
    SELECT
        E.idEmpleado,
        E.nombre AS Empleado,
        COUNT(T.idticket) AS NumeroIngresos,
        SUM(T.total) AS TotalIngresos
    FROM
        Empleado E
    INNER JOIN
        Ticket T ON E.idEmpleado = T.idempleado
    WHERE
        CONVERT(DATE, T.fecha) = @FechaConsulta
    GROUP BY
        E.idEmpleado, E.nombre
)

-- Obtener los detalles de los tickets para el corte de caja detallado
SELECT
    RI.idEmpleado,
    RI.Empleado,
    T.idticket,
    T.fecha,
    T.total
FROM
    ReporteIngresos RI
INNER JOIN
    Ticket T ON RI.idEmpleado = T.idempleado
WHERE
    CONVERT(DATE, T.fecha) = @FechaConsulta  -- Filtrar por la fecha de consulta
ORDER BY
    RI.idEmpleado, T.idticket;

--Ve existencias
SELECT
    idProducto,
    descripcion AS Producto,
    stock AS Existencias
FROM
    Producto
ORDER BY
    idProducto;


--9
DECLARE @FechaInicio DATE = '2024-01-01';
DECLARE @FechaFin DATE = '2024-12-31';

-- Calcular ingresos por el rango de fechas
DECLARE @Ingresos DECIMAL(18, 2);
SELECT @Ingresos = ISNULL(SUM(total), 0)
FROM (
    SELECT total
    FROM Ticket
    WHERE fecha BETWEEN @FechaInicio AND @FechaFin
    UNION ALL
    SELECT totalPagado
    FROM Compra
    WHERE fecha BETWEEN @FechaInicio AND @FechaFin
) AS Ingresos;

-- Calcular egresos por el rango de fechas
DECLARE @Egresos DECIMAL(18, 2);
SELECT @Egresos = ISNULL(SUM(monto), 0)
FROM PagoEmpleado
WHERE fecha BETWEEN @FechaInicio AND @FechaFin;

-- Mostrar estado de cuenta
SELECT
    @FechaInicio AS FechaInicio,
    @FechaFin AS FechaFin,
    @Ingresos AS Ingresos,
    @Egresos AS Egresos;







