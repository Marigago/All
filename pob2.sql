use frias
go
select *
from Ticket

delete from TicketProducto
delete from ticket

CREATE PROCEDURE dbo.Random
    @Low INT,
    @High INT,
    @RandomNumber INT OUTPUT
AS
BEGIN
    DECLARE @Range AS INT = @High - @Low + 1;
    SET @RandomNumber = @Low + (ABS(CHECKSUM(NEWID())) % @Range);
END;





DECLARE @fechaInicio DATE = '2023-01-01';
DECLARE @fechaFin DATE = '2023-07-05';
DECLARE @fecha DATE = @fechaInicio;
DECLARE @idVenta INT = 1;

WHILE @fecha <= @fechaFin
BEGIN
    -- Obtener un número aleatorio de tickets por día (máximo 5)
    DECLARE @numTickets INT;
    EXEC dbo.Random 1, 5, @numTickets OUTPUT;
    DECLARE @contadorTickets INT = 0;

    WHILE @contadorTickets < @numTickets
    BEGIN
        -- Obtener un número aleatorio de productos entre 1 y 3
        DECLARE @numProductos INT;
        EXEC dbo.Random 1, 3, @numProductos OUTPUT;

		WAITFOR DELAY '00:00:00.050';

        -- Obtener productos aleatorios para cada venta
        DECLARE @productos TABLE (idProducto INT);
        INSERT INTO @productos (idProducto)
        SELECT TOP (@numProductos) idProducto FROM Producto ORDER BY NEWID();

        -- Obtener un empleado aleatorio para cada venta
        DECLARE @idEmpleado INT = (SELECT TOP 1 idEmpleado FROM Empleado ORDER BY NEWID());

        -- Obtener un cliente aleatorio diferente para cada venta
        DECLARE @idCliente INT = (SELECT TOP 1 idCliente FROM Cliente ORDER BY NEWID());

        -- Insertar venta con IVA fijo
        INSERT INTO Ticket (idTicket, fecha, idCliente, idEmpleado, iva)
        VALUES (@idVenta, @fecha, @idCliente, @idEmpleado, 0.16); -- IVA fijo en 0.16

        -- Insertar detalles de venta con los productos seleccionados aleatoriamente
        DECLARE @cantidad INT;
        EXEC dbo.Random 1, 3, @cantidad OUTPUT;
        INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
        SELECT @idVenta * 10 + idProducto, @idVenta, idProducto, @cantidad
        FROM @productos;

        -- Llamado al procedimiento almacenado calculaticket
        EXEC [dbo].[calculaticket] @idVenta;

        -- Incrementar el ID de venta y el contador de tickets generados
        SET @idVenta = @idVenta + 1;
        SET @contadorTickets = @contadorTickets + 1;
    END;

    -- Incrementar la fecha para el siguiente día
    SET @fecha = DATEADD(DAY, 1, @fecha);
END;



DECLARE @fechaInicio DATE = '2023-01-01';
DECLARE @fechaFin DATE = '2023-07-05';

DECLARE @idVenta INT = 1;


WHILE @fecha <= @fechaFin
BEGIN
    -- Obtener un número aleatorio de productos entre 1 y 3
    DECLARE @numProductos INT;
    SET @numProductos = CEILING(RAND() * 3);

    -- Obtener productos aleatorios para cada venta
    DECLARE @productos TABLE (idProducto INT);
    INSERT INTO @productos (idProducto)
    SELECT TOP (@numProductos) idProducto FROM Producto ORDER BY NEWID();

    -- Obtener un empleado aleatorio para cada venta
    DECLARE @idEmpleado INT;
    SET @idEmpleado = (SELECT TOP 1 idEmpleado FROM Empleado ORDER BY NEWID());

    -- Obtener un cliente aleatorio diferente para cada venta
    DECLARE @idCliente INT;
    SELECT TOP 1 @idCliente = idCliente FROM Cliente ORDER BY NEWID();

    -- Insertar venta con IVA fijo
    INSERT INTO Ticket (idTicket, fecha, idCliente, idEmpleado, iva)
    VALUES (@idVenta, @fecha, @idCliente, @idEmpleado,0.16); -- IVA fijo en 0.16

    -- Insertar detalles de venta con los productos seleccionados aleatoriamente
    DECLARE @idProducto INT, @cantidad INT;
    DECLARE product_cursor CURSOR FOR 
    SELECT idProducto FROM @productos;

    OPEN product_cursor;

    FETCH NEXT FROM product_cursor INTO @idProducto;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generar cantidad aleatoria diferente para cada producto
        SET @cantidad = CEILING(RAND(CHECKSUM(NEWID())) * 3); -- Cantidad aleatoria entre 1 y 3

        INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
        VALUES (@idVenta * 10 + @idProducto, @idVenta, @idProducto, @cantidad);

        FETCH NEXT FROM product_cursor INTO @idProducto;
    END;

    CLOSE product_cursor;
    DEALLOCATE product_cursor;

    -- Llamado al procedimiento almacenado calculaticket
    EXEC [dbo].[calculaticket] @idVenta;

    -- Incrementar el ID de venta
    SET @idVenta = @idVenta + 1;
    -- Incrementar la fecha para el siguiente día
    SET @fecha = DATEADD(DAY, 1, @fecha);
END;




