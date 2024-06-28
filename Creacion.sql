-- Creación de la base de datos
CREATE DATABASE Frias;

-- Uso de la base de datos
USE Frias;

-- Creación de las tablas
CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(20)
);

CREATE TABLE Empleado (
    idEmpleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    descripcion VARCHAR(200),
    precioUnitario DECIMAL(10, 2),
    idCategoria INT,
    idTamaño INT,
    idSabor INT,
    stock INT,
    descuento DECIMAL(5, 2),
    porcentajeIVA DECIMAL(5, 2)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(100),
    tipoCliente VARCHAR(20)
);

CREATE TABLE Compra (
    idCompra INT PRIMARY KEY,
    idProveedor INT,
    fecha DATE,
    totalPagado DECIMAL(10, 2),
    idEmpleado INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);
--(1)
ALTER TABLE Compra
ADD idCompraNew INT IDENTITY(1,1);
--(2)
ALTER TABLE DetalleCompra
DROP CONSTRAINT FK__DetalleCo__idCom__4316F928; -- Asegúrate de usar el nombre correcto de la restricción
--(3)
ALTER TABLE Compra
DROP CONSTRAINT PK__Compra__48B99DB7D7F8FDC7;
--(4)
ALTER TABLE Compra
DROP COLUMN idCompra;
--(5)
EXEC sp_rename 'Compra.idCompraNew', 'idCompra', 'COLUMN';
--(6)
ALTER TABLE Compra
ADD CONSTRAINT PK__Compra__48B99DB7D7F8FDC7 PRIMARY KEY (idCompra);
--(7)
ALTER TABLE DetalleCompra
ADD CONSTRAINT FK_DetalleCompra_Compra FOREIGN KEY (idCompra) REFERENCES Compra(idCompra);
;

CREATE TABLE DetalleCompra (
    idDetalleCompra INT PRIMARY KEY,
    idCompra INT,
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2),
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Eliminar la restricción de clave primaria (1)
ALTER TABLE DetalleCompra
DROP CONSTRAINT PK__DetalleC__62C252C139B515C8;

-- Modificar la columna(2)
ALTER TABLE DetalleCompra
DROP COLUMN idDetalleCompra;
--(3)
ALTER TABLE DetalleCompra
ADD idDetalleCompra INT IDENTITY(1,1);

-- Volver a crear la restricción de clave primaria (5)
ALTER TABLE DetalleCompra
ADD CONSTRAINT PK__DetalleC__62C252C139B515C8 PRIMARY KEY (idDetalleCompra);

CREATE TABLE Ticket (
    idTicket INT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    iva DECIMAL(10, 2),
    descuentoAplicado DECIMAL(10, 2),
    folio VARCHAR(20),
    idCliente INT,
    idEmpleado INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);


CREATE TABLE TicketProducto (
    idTicketProducto INT PRIMARY KEY,
    idTicket INT,
    idProducto INT,
    cantidad INT,
    FOREIGN KEY (idTicket) REFERENCES Ticket(idTicket),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Cuenta (
    idCuenta INT PRIMARY KEY,
    saldo DECIMAL(10, 2),
    numeroCuenta VARCHAR(20),
    titular VARCHAR(100)
);

CREATE TABLE PagoEmpleado (
    idPagoEmpleado INT PRIMARY KEY,
    idEmpleado INT,
    fecha DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

-- Creación de la tabla Categoria
CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Creación de la tabla Tamaño
CREATE TABLE Tamaño (
    idTamaño INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

-- Creación de la tabla Sabor
CREATE TABLE Sabor (
    idSabor INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

-- Agregar las claves foráneas a la tabla Producto
ALTER TABLE Producto
ADD FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria);


ALTER TABLE Producto
ADD FOREIGN KEY (idTamaño) REFERENCES Tamaño(idTamaño);

ALTER TABLE Producto
ADD FOREIGN KEY (idSabor) REFERENCES Sabor(idSabor);

--ActualizarStockVenta
CREATE PROCEDURE ActualizarStockVenta
    @idProducto INT,
    @cantidad INT
AS
BEGIN
    UPDATE Producto
    SET stock = stock - @cantidad
    WHERE idProducto = @idProducto;
END;

--ActualizarStockCompra
CREATE PROCEDURE ActualizarStockCompra
    @idProducto INT,
    @cantidad INT
AS
BEGIN
    UPDATE Producto
    SET stock = stock + @cantidad
    WHERE idProducto = @idProducto;
END;


--CREATE TYPE DetalleCompraType
CREATE TYPE DetalleCompraType AS TABLE 
(
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10, 2)
);
GO

--RegistrarCompra
CREATE PROCEDURE RegistrarCompra
    @idProveedor INT,
    @fecha DATE,
    @totalPagado DECIMAL(10, 2),
    @idEmpleado INT,
    @idCuenta INT,
    @detalleCompra DetalleCompraType READONLY
AS
BEGIN
    -- Insertar la compra
    INSERT INTO Compra (idProveedor, fecha, totalPagado, idEmpleado)
    VALUES (@idProveedor, @fecha, @totalPagado, @idEmpleado);

    -- Obtener el ID de la compra recién insertada
    DECLARE @idCompra INT;
    SET @idCompra = SCOPE_IDENTITY();

    -- Insertar el detalle de la compra
    INSERT INTO DetalleCompra (idCompra, idProducto, cantidad, precioUnitario)
    SELECT @idCompra, idProducto, cantidad, precioUnitario FROM @detalleCompra;

    -- Actualizar el stock de los productos comprados y el saldo de la cuenta
    DECLARE @idProducto INT, @cantidad INT;
    DECLARE cur CURSOR FOR SELECT idProducto, cantidad FROM @detalleCompra;
    OPEN cur;
    FETCH NEXT FROM cur INTO @idProducto, @cantidad;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC ActualizarStockCompra @idProducto, @cantidad;
        FETCH NEXT FROM cur INTO @idProducto, @cantidad;
    END;
    CLOSE cur;
    DEALLOCATE cur;

    -- Actualizar el saldo de la cuenta (restar el totalPagado)
    UPDATE Cuenta
    SET saldo = saldo - @totalPagado
    WHERE idCuenta = @idCuenta;
END;

--calculaticket
CREATE PROCEDURE [dbo].[calculaticket] (@idticket AS INT)
AS
BEGIN
    -- Declaramos variables locales
    DECLARE @iva AS DECIMAL(18,2),
            @descuento AS DECIMAL(18,2),
            @total AS DECIMAL(18,2),
            @subtotal AS DECIMAL(18,2)

    -- Calcular el subtotal del detalle
    SELECT @subtotal = SUM(tp.cantidad * p.preciounitario)
    FROM TicketProducto tp
    INNER JOIN Producto p ON p.idProducto = tp.idProducto
    WHERE tp.idTicket = @idticket

    -- Calcular el IVA desglosado para los artículos en el ticket que lo tengan
    SELECT @iva = SUM(tp.cantidad * p.preciounitario * p.porcentajeiva / 100)
    FROM TicketProducto tp
    INNER JOIN Producto p ON p.idProducto = tp.idProducto
    WHERE tp.idTicket = @idticket

    -- Calcular el descuento global de los artículos que lo tengan
    SELECT @descuento = SUM(tp.cantidad * p.preciounitario * p.descuento / 100)
    FROM TicketProducto tp
    INNER JOIN Producto p ON p.idProducto = tp.idProducto
    WHERE tp.idTicket = @idticket

    -- Calcular el total del ticket
    SET @total = @subtotal + @iva - @descuento

    -- Actualizamos el registro del ticket
    UPDATE Ticket
    SET total = @total,
        subtotal = @subtotal,
        iva = @iva,
        descuentoAplicado = @descuento,
        folio = 'T000' + CONVERT(CHAR(10), @idticket)
    WHERE idTicket = @idticket
END;


-- RegistrarVenta

CREATE PROCEDURE RegistrarVenta
    @idTicket INT,
    @fecha DATE,
    @idCliente INT,
    @idEmpleado INT,
    @idCuenta INT
AS
BEGIN
    -- Insertar el ticket
    INSERT INTO Ticket (idTicket, fecha, idCliente, idEmpleado)
    VALUES (@idTicket, @fecha, @idCliente, @idEmpleado);

    -- Obtener el ID del ticket recién insertad

    -- Calcular el ticket (llamada al procedimiento almacenado calculaticket)
    EXEC calculaticket @idTicket;

    -- Actualizar el saldo de la cuenta (sumar el total del ticket)
    UPDATE Cuenta
    SET saldo = saldo + (SELECT total FROM Ticket WHERE idTicket = @idTicket)
    WHERE idCuenta = @idCuenta;

    -- Actualizar el stock de los productos vendidos
    UPDATE Producto
    SET stock = stock - tp.cantidad
    FROM TicketProducto tp
    WHERE tp.idTicket = @idTicket AND Producto.idProducto = tp.idProducto;
END;


--Cancelarventa

CREATE PROCEDURE CancelarVenta
    @idTicket INT
AS
BEGIN
    -- Obtener los detalles de los productos vendidos en el ticket a cancelar
    DECLARE @idProducto INT;
    DECLARE @cantidad INT;
    DECLARE curProducto CURSOR FOR
    SELECT idProducto, cantidad
    FROM TicketProducto
    WHERE idTicket = @idTicket;

    OPEN curProducto;
    FETCH NEXT FROM curProducto INTO @idProducto, @cantidad;

    -- Iterar por cada producto vendido y actualizar el stock
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE Producto
        SET stock = stock + @cantidad
        WHERE idProducto = @idProducto;

        FETCH NEXT FROM curProducto INTO @idProducto, @cantidad;
    END;

    CLOSE curProducto;
    DEALLOCATE curProducto;

    -- Obtener el total de la venta para restar al saldo de la cuenta
    DECLARE @totalVenta DECIMAL(10, 2);
    SELECT @totalVenta = total FROM Ticket WHERE idTicket = @idTicket;

    -- Restar el total de la venta al saldo de la cuenta
    DECLARE @idCuenta INT;
    SELECT @idCuenta = 1 FROM Ticket WHERE idTicket = @idTicket;
    UPDATE Cuenta
    SET saldo = saldo - @totalVenta
    WHERE idCuenta = @idCuenta;

    -- Eliminar los registros de TicketProducto asociados al idTicket
    DELETE FROM TicketProducto WHERE idTicket = @idTicket;

    -- Eliminar el registro de Ticket
    DELETE FROM Ticket WHERE idTicket = @idTicket;
END;


--RegistrarPagoEmpleado
CREATE PROCEDURE RegistrarPagoEmpleado
    @idEmpleado INT,
    @fecha DATE,
    @monto DECIMAL(10, 2),
    @idCuenta INT,
    @idPagoEmpleado INT
AS
BEGIN
    -- Insertar el pago del empleado
    INSERT INTO PagoEmpleado (idPagoEmpleado, idEmpleado, fecha, monto)
    VALUES (@idPagoEmpleado, @idEmpleado, @fecha, @monto);

    -- Actualizar el saldo de la cuenta (restar el monto del pago)
    UPDATE Cuenta
    SET saldo = saldo - @monto
    WHERE idCuenta = @idCuenta;
END;



