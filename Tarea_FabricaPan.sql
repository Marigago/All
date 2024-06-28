-- Crear la base de datos FabricaPan si no existe
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'FabricaPan')
BEGIN
    CREATE DATABASE FabricaPan;
END
GO

-- Usar la base de datos FabricaPan
USE FabricaPan;
GO

-- Resto del script para crear tablas y datos...

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    tipoCliente VARCHAR(50),
    tipoEntrega VARCHAR(50)
);

-- Tabla de pedidos
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY IDENTITY,
    idCliente INT,
    nombreCliente VARCHAR(100),
    fechaPedido DATETIME,
    productor VARCHAR(100),
    direccion VARCHAR(255),
    total DECIMAL(10, 2),
    horaEntrega DATETIME,
    tipoEntrega VARCHAR(50),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla de detalles del pedido
CREATE TABLE Detalles (
    idDetalle INT PRIMARY KEY IDENTITY,
    cantidad INT,
    valorProducto DECIMAL(10, 2),
    idPedido INT,
    idProducto INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabla de productos
CREATE TABLE Producto (
    idProducto INT PRIMARY KEY IDENTITY,
    tipoProducto VARCHAR(100),
    tipoPedido VARCHAR(100)
);

-- Tabla de producción
CREATE TABLE Produccion (
    idProduccion INT PRIMARY KEY IDENTITY,
    idPedido INT,
    fechaElaboracion DATETIME,
    fechaSalida DATETIME,
    fechaVencimiento DATETIME,
    ordenSalida INT,
    grupoOrdenes INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabla de repartidores
CREATE TABLE Repartidor (
    idRepartidor INT PRIMARY KEY IDENTITY,
    idPedido INT,
    salidaGrupo DATETIME,
    cobro DECIMAL(10, 2),
    ticket INT,
    direccion VARCHAR(255),
    nombreCliente VARCHAR(100),
    idCliente INT,
    fechaHoraEntrega DATETIME,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabla de deudas
CREATE TABLE Deuda (
    tipoPago VARCHAR(100),
    idPedido INT,
    nombreCliente VARCHAR(100),
    tipoCliente VARCHAR(50),
    fechaVencimiento DATETIME,
    PRIMARY KEY (idPedido),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabla de facturas
CREATE TABLE Factura (
    idPedido INT,
    direccion VARCHAR(255),
    productor VARCHAR(100),
    idFactura INT PRIMARY KEY IDENTITY,
    tipoPago VARCHAR(100),
    tipoPedido VARCHAR(100),
    nombrePedido VARCHAR(100),
    idCliente INT,
    horaEntrega DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
)


-- Insertar datos de clientes
INSERT INTO Cliente (nombre, direccion, tipoCliente, tipoEntrega) VALUES 
('Juan Perez', 'Calle 123, Ciudad ABC', 'Directo', 'Entrega programada'),
('María López', 'Avenida XYZ, Ciudad DEF', 'Recurrente', 'Entrega de 24 horas'),
('Pedro Ramírez', 'Carrera 456, Ciudad GHI', 'Directo', 'Entrega programada');

-- Insertar datos de productos
INSERT INTO Producto (tipoProducto, tipoPedido) VALUES 
('Pan blanco', 'Panaderia'),
('Pan integral', 'Panaderia'),
('Pan de centeno', 'Panaderia'),
('Croissants', 'Cafe'),
('Rosquillas', 'Cafe');

-- Insertar datos de pedidos
INSERT INTO Pedido (idCliente, nombreCliente, fechaPedido, productor, direccion, total, horaEntrega, tipoEntrega) VALUES 
(1, 'Juan Perez', '2024-02-17 08:00:00', 'Panadería ABC', 'Calle Principal 456', 50.00, '2024-02-17 12:00:00', 'Entrega programada'),
(2, 'María López', '2024-02-18 10:30:00', 'Panadería DEF', 'Avenida Central 789', 75.00, '2024-02-18 15:30:00', 'Entrega de 24 horas'),
(3, 'Pedro Ramírez', '2024-02-19 09:15:00', 'Panadería GHI', 'Carrera Principal 123', 100.00, '2024-02-19 13:30:00', 'Entrega programada'),
(1, 'Juan Perez', '2024-02-20 11:00:00', 'Panadería ABC', 'Calle Principal 456', 120.00, '2024-02-20 16:00:00', 'Entrega programada');

-- Demostrar que fueron afectadas las tablas
SELECT *
FROM Pedido
WHERE idCliente NOT IN (SELECT idCliente FROM Cliente);
SELECT *
FROM Detalles
WHERE idPedido NOT IN (SELECT idPedido FROM Pedido)
   OR idProducto NOT IN (SELECT idProducto FROM Producto);
