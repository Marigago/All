USE Frias
Go
select *
from TicketProducto


delete from TicketProducto
DELETE FROM Ticket


-- Insertar clientes
INSERT INTO Cliente (idCliente, nombre, direccion, telefono, email, tipoCliente)
VALUES
    (1, 'Público en general', NULL, NULL, NULL, 'General'),
    (2, 'Juan Pérez', 'Calle 123, Ciudad', '555-1234', 'juan@example.com', 'Particular'),
    (3, 'María González', 'Avenida 456, Ciudad', '555-5678', 'maria@example.com', 'Particular'),
    (4, 'Juan Pérez', 'Calle 123, Ciudad Guzmán', '33-1234-5646', 'juan@iteso.mx', 'Particular'),
    (5, 'María Rodríguez', 'Avenida 456, Pueblo Paleta', '33-5678-3797', 'maria@iteso.mx', 'Particular'),
    (6, 'Carlos López', 'Carrera 789, Villa Corona', '33-7890-1379', 'carlos@iteso.mx', 'Particular'),
    (7, 'Ana Martínez', 'Calle Principal, San Denis', '33-8901-4514', 'ana@iteso.mx', 'Particular'),
    (8, 'Pedro Sánchez', 'Avenida Central, Ciudad Guzmán', '33-2345-7913', 'pedro@iteso.mx', 'Particular'),
    (9, 'Laura Gómez', 'Calle Secundaria, Pueblo Paleta', '33-6789-7997', 'laura@iteso.mx', 'Particular'),
    (10, 'Javier Torres', 'Carrera Larga, Villa Corona', '33-9012-4679', 'javier@iteso.mx', 'Particular'),
    (11, 'Sofía Ramírez', 'Avenida Pequeña, San Denis', '33-3456-7397', 'sofia@iteso.mx', 'Particular'),
    (12, 'Diego Herrera', 'Calle Estrecha, Ciudad Guzmán', '33-7890-4679', 'diego@iteso.mx', 'Particular'),
    (13, 'Isabel Castro', 'Avenida Ancha, Pueblo Paleta', '33-1234-4376', 'isabel@iteso.mx', 'Particular'),
    (14, 'Andrés Vargas', 'Carrera Corta, Villa Corona', '33-5678-6465', 'andres@iteso.mx', 'Particular'),
    (15, 'Elena Peralta', 'Calle Lateral, San Denis', '33-8901-1331', 'elena@iteso.mx', 'Particular'),
    (16, 'Miguel Mendoza', 'Avenida Grande, Ciudad Guzmán', '33-2345-4664', 'miguel@iteso.mx', 'Particular'),
    (17, 'Carmen Ríos', 'Calle Pequeña, Pueblo Paleta', '33-6789-7531', 'carmen@iteso.mx', 'Particular'),
    (18, 'Ricardo Silva', 'Carrera Ancha, Villa Corona', '33-9012-7946', 'ricardo@iteso.mx', 'Particular'),
    (19, 'Paula Núñez', 'Avenida Larga, San Denis', '33-3456-1112', 'paula@iteso.mx', 'Particular'),
    (20, 'Hugo González', 'Calle Principal, Ciudad Guzmán', '33-7890-9991', 'hugo@iteso.mx', 'Particular');

delete from cuenta
-- Insertar cuenta bancaria general
INSERT INTO Cuenta (idCuenta, saldo, numeroCuenta, titular)
VALUES (1, 10000000.00, '0123456789', 'Paleteria Frias');


-- Insertar empleados
INSERT INTO Empleado (idEmpleado, nombre, apellido, telefono, email)
VALUES
    (1, 'Juan Javier', 'Gomez Hurtado', '3336564821', 'juango@gmail.com'),
    (2, 'Pablo', 'Diaz del Rio', '3346598756', 'pablodiaz2001@gmail.com'),
    (3, 'Paulina', 'Trevillo Bautista', '3356489752', 'pauTre123@gmail.com');

-- Insertar productos
-- Combinaciones de paletas de agua (Fresa, Mango, Piña) en tamaños chico y grande
INSERT INTO Producto (idProducto, descripcion, precioUnitario, idCategoria, idTamaño, idSabor, stock, descuento, porcentajeIVA)
VALUES
(1, 'Paleta de Agua de Fresa Chico', 12.0, 1, 1, 2, 100, 0.05, 16),
(2, 'Paleta de Agua de Fresa Grande', 16.0, 1, 2, 2, 150, 0, 16),
(3, 'Paleta de Agua de Mango Chico', 12.0, 1, 1, 8, 100, 0, 16),
(4, 'Paleta de Agua de Mango Grande', 16.0, 1, 2, 8, 150, 0, 16),
(5, 'Paleta de Agua de Piña Chico', 12.0, 1, 1, 9, 100, 0.1, 16),
(6, 'Paleta de Agua de Piña Grande', 16.0, 1, 2, 9, 150, 0, 16),
(7, 'Paleta de Leche de Fresa Chico', 14.0, 2, 1, 2, 100, 0, 16),
(8, 'Paleta de Leche de Fresa Grande', 18.0, 2, 2, 2, 150, 0.15, 16),
(9, 'Paleta de Leche de Vainilla Chico', 14.0, 2, 1, 3, 100, 0, 16),
(10, 'Paleta de Leche de Vainilla Grande', 18.0, 2, 2, 3, 150, 0, 16),
(11, 'Paleta de Leche de Menta Chico', 14.0, 2, 1, 4, 100, 0, 16),
(12, 'Paleta de Leche de Menta Grande', 18.0, 2, 2, 4, 150, 0.2, 16),
(13, 'Paleta de Leche de Caramelo Chico', 14.0, 2, 1, 5, 100, 0, 16),
(14, 'Paleta de Leche de Caramelo Grande', 18.0, 2, 2, 5, 150, 0, 16),
(15, 'Paleta de Leche de Café Chico', 14.0, 2, 1, 6, 100, 0, 16),
(16, 'Paleta de Leche de Café Grande', 18.0, 2, 2, 6, 150, 0.1, 16),
(17, 'Paleta de Leche de Nuez Chico', 14.0, 2, 1, 7, 100, 0, 16),
(18, 'Paleta de Leche de Nuez Grande', 18.0, 2, 2, 7, 150, 0, 16),
(19, 'Paleta de Leche de Coco Chico', 14.0, 2, 1, 10, 100, 0.05, 16),
(20, 'Paleta de Leche de Coco Grande', 18.0, 2, 2, 10, 150, 0, 16);



INSERT INTO Categoria (idCategoria, nombre)
VALUES (1, 'Agua'),
       (2, 'Leche');

INSERT INTO Tamaño (idTamaño, descripcion)
VALUES (1, 'Pequeño'),
       (2, 'Grande');

-- Poblar la tabla Sabor
INSERT INTO Sabor (idSabor, descripcion)
VALUES (1, 'Chocolate'),
       (2, 'Fresa'),
       (3, 'Vainilla'),
       (4, 'Menta'),
       (5, 'Caramelo'),
       (6, 'Café'),
       (7, 'Nuez'),
       (8, 'Mango'),
       (9, 'Piña'),
       (10, 'Coco');


INSERT INTO proveedor (idproveedor, nombre, direccion, telefono)
VALUES
    (1, 'Distribuidora Dulce Sabor', 'Calle Dulce, Ciudad Dulce', '555-123-4567'),
    (2, 'Comercializadora Sabores del Campo', 'Avenida Frutal, Pueblo Frutal', '333-987-6543');

-- Poblar la tabla Compra y actualizar el stock de los productos comprados

-- Mes 1
DECLARE @detalleCompra DetalleCompraType;
INSERT INTO @detalleCompra VALUES (1, 100, 1.50), (2, 50, 2.0), (3, 100, 1.50), (4, 50, 2.0), (5, 100, 1.50), (6, 50, 2.0);
EXEC RegistrarCompra 1, '2024-01-01', 750.00, 1, 1, @detalleCompra;

DECLARE @detalleCompra2 DetalleCompraType;
INSERT INTO @detalleCompra2 VALUES (7, 100, 1.50), (8, 50, 2.0), (9, 100, 1.50), (10, 50, 2.0), (11, 100, 1.50), (12, 50, 2.0), (13, 100, 1.50), (14, 50, 2.0), (15, 100, 1.50), (16, 50, 2.0), (17, 100, 1.50), (18, 50, 2.0), (19, 100, 1.50), (20, 50, 2.0);
EXEC RegistrarCompra 2, '2024-01-01', 1750.00, 1, 1, @detalleCompra2;

-- Mes 2
DECLARE @detalleCompra3 DetalleCompraType;
INSERT INTO @detalleCompra3 VALUES (1, 100, 1.50), (2, 50, 2.0), (3, 100, 1.50), (4, 50, 2.0);
EXEC RegistrarCompra 1, '2024-02-01', 500.00, 2, 1, @detalleCompra3;

DECLARE @detalleCompra4 DetalleCompraType;
INSERT INTO @detalleCompra4 VALUES (7, 100, 1.50), (8, 50, 2.0), (11, 100, 1.50), (12, 50, 2.0), (13, 100, 1.50), (14, 50, 2.0), (15, 100, 1.50), (16, 50, 2.0), (17, 100, 1.50), (18, 50, 2.0), (19, 100, 1.50), (20, 50, 2.0);
EXEC RegistrarCompra 2, '2024-02-01', 1500.00, 2, 1, @detalleCompra4;

-- Mes 3
DECLARE @detalleCompra5 DetalleCompraType;
INSERT INTO @detalleCompra5 VALUES (1, 100, 1.50), (2, 50, 2.0), (5, 100, 1.50), (6, 50, 2.0);
EXEC RegistrarCompra 1, '2024-03-01', 500.00, 2, 1, @detalleCompra5;

DECLARE @detalleCompra6 DetalleCompraType;
INSERT INTO @detalleCompra6 VALUES (7, 100, 1.50), (8, 50, 2.0), (9, 100, 1.50), (10, 50, 2.0), (15, 100, 1.50), (16, 50, 2.0), (17, 100, 1.50), (18, 50, 2.0), (19, 100, 1.50), (20, 50, 2.0);
EXEC RegistrarCompra 2, '2024-03-01', 750.00, 2, 1, @detalleCompra6;

-- Mes 4
DECLARE @detalleCompra7 DetalleCompraType;
INSERT INTO @detalleCompra7 VALUES (1, 100, 1.50), (2, 50, 2.0);
EXEC RegistrarCompra 1, '2024-04-01', 250.00, 2, 1, @detalleCompra7;

DECLARE @detalleCompra8 DetalleCompraType;
INSERT INTO @detalleCompra8 VALUES (7, 100, 1.50), (8, 50, 2.0), (15, 100, 1.50), (16, 50, 2.0), (17, 100, 1.50), (18, 50, 2.0), (19, 100, 1.50), (20, 50, 2.0);
EXEC RegistrarCompra 2, '2024-04-01', 1000.00, 2, 1, @detalleCompra8;

-- Mes 5
DECLARE @detalleCompra9 DetalleCompraType;
INSERT INTO @detalleCompra9 VALUES (1, 100, 1.50), (2, 50, 2.0), (3, 100, 1.50), (4, 50, 2.0);
EXEC RegistrarCompra 1, '2024-05-01', 500.00, 1, 1, @detalleCompra9;

DECLARE @detalleCompra10 DetalleCompraType;
INSERT INTO @detalleCompra10 VALUES (7, 100, 1.50), (8, 50, 2.0), (11, 100, 1.50), (12, 50, 2.0), (13, 100, 1.50), (14, 50, 2.0), (15, 100, 1.50), (16, 50, 2.0), (17, 100, 1.50), (18, 50, 2.0), (19, 100, 1.50), (20, 50, 2.0);
EXEC RegistrarCompra 2, '2024-05-01', 1500.00, 1, 1, @detalleCompra10;



--NO USAR
DBCC CHECKIDENT ('Compra', RESEED, 0);
delete from compra

select *
from ticket
-- Bloque 1
DECLARE @idTicket1 INT;
SET @idTicket1 = 1;

EXEC RegistrarVenta @idTicket1, '2024-01-01', 7, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (1, @idTicket1, 3, 2), 
       (2, @idTicket1, 6, 1), 
       (3, @idTicket1, 8, 3);

EXEC RegistrarVenta @idTicket1, '2024-01-01', 7, 2, 1;
use frias
go
-- Bloque 2
DECLARE @idTicket2 INT;
SET @idTicket2 = 2;

EXEC RegistrarVenta @idTicket2, '2024-02-02', 12, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (4, @idTicket2, 2, 1), 
       (5, @idTicket2, 5, 2), 
       (6, @idTicket2, 7, 1),
       (7, @idTicket2, 10, 4);

EXEC RegistrarVenta @idTicket2, '2024-02-02', 12, 3, 1;

-- Bloque 3
DECLARE @idTicket3 INT;
SET @idTicket3 = 3;

EXEC RegistrarVenta @idTicket3, '2024-02-03', 3, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (8, @idTicket3, 1, 3), 
       (9, @idTicket3, 4, 2), 
       (10, @idTicket3, 9, 1),
       (11, @idTicket3, 12, 3),
       (12, @idTicket3, 14, 2);

EXEC RegistrarVenta @idTicket3, '2024-02-03', 3, 1, 1;

-- Bloque 4
DECLARE @idTicket4 INT;
SET @idTicket4 = 4;

EXEC RegistrarVenta @idTicket4, '2024-02-04', 18, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (13, @idTicket4, 11, 1), 
       (14, @idTicket4, 13, 2), 
       (15, @idTicket4, 16, 3),
       (16, @idTicket4, 19, 1);

EXEC RegistrarVenta @idTicket4, '2024-02-04', 18, 2, 1;

-- Bloque 5
DECLARE @idTicket5 INT;
SET @idTicket5 = 5;

EXEC RegistrarVenta @idTicket5, '2024-02-05', 10, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (17, @idTicket5, 2, 2), 
       (18, @idTicket5, 5, 3), 
       (19, @idTicket5, 8, 1),
       (20, @idTicket5, 14, 2);

EXEC RegistrarVenta @idTicket5, '2024-02-05', 10, 1, 1;

-- Bloque 6
DECLARE @idTicket6 INT;
SET @idTicket6 = 6;

EXEC RegistrarVenta @idTicket6, '2024-02-06', 15, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (21, @idTicket6, 3, 1), 
       (22, @idTicket6, 7, 2), 
       (23, @idTicket6, 10, 1),
       (24, @idTicket6, 13, 3),
       (25, @idTicket6, 17, 2),
       (26, @idTicket6, 20, 2);

EXEC RegistrarVenta @idTicket6, '2024-02-06', 15, 3, 1;

-- Bloque 7
DECLARE @idTicket7 INT;
SET @idTicket7 = 7;

EXEC RegistrarVenta @idTicket7, '2024-02-07', 8, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (27, @idTicket7, 1, 2), 
       (28, @idTicket7, 6, 3), 
       (29, @idTicket7, 11, 1),
       (30, @idTicket7, 15, 2),
       (31, @idTicket7, 19, 1);

EXEC RegistrarVenta @idTicket7, '2024-02-07', 8, 1, 1;

-- Bloque 8
DECLARE @idTicket8 INT;
SET @idTicket8 = 8;

EXEC RegistrarVenta @idTicket8, '2024-02-08', 5, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (32, @idTicket8, 2, 3), 
       (33, @idTicket8, 5, 1), 
       (34, @idTicket8, 8, 2),
       (35, @idTicket8, 12, 1),
       (36, @idTicket8, 16, 3);

EXEC RegistrarVenta @idTicket8, '2024-02-08', 5, 2, 1;

-- Bloque 9
DECLARE @idTicket9 INT;
SET @idTicket9 = 9;

EXEC RegistrarVenta @idTicket9, '2024-02-09', 17, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (37, @idTicket9, 3, 2), 
       (38, @idTicket9, 7, 1), 
       (39, @idTicket9, 10, 3),
       (40, @idTicket9, 14, 2);

EXEC RegistrarVenta @idTicket9, '2024-02-09', 17, 1, 1;

-- Bloque 10
DECLARE @idTicket10 INT;
SET @idTicket10 = 10;

EXEC RegistrarVenta @idTicket10, '2024-02-10', 12, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (41, @idTicket10, 2, 1), 
       (42, @idTicket10, 4, 1)
EXEC RegistrarVenta @idTicket10, '2024-02-10', 12, 3, 1;

-- Bloque 11
DECLARE @idTicket11 INT;
SET @idTicket11 = 11;

EXEC RegistrarVenta @idTicket11, '2024-02-11', 9, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (43, @idTicket11, 2, 3), 
       (44, @idTicket11, 5, 2), 
       (45, @idTicket11, 7, 1),
       (46, @idTicket11, 10, 4);

EXEC RegistrarVenta @idTicket11, '2024-02-11', 9, 2, 1;

-- Bloque 12
DECLARE @idTicket12 INT;
SET @idTicket12 = 12;

EXEC RegistrarVenta @idTicket12, '2024-02-12', 14, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (47, @idTicket12, 3, 2), 
       (48, @idTicket12, 6, 1), 
       (49, @idTicket12, 8, 2),
       (50, @idTicket12, 12, 1),
       (51, @idTicket12, 16, 3);

EXEC RegistrarVenta @idTicket12, '2024-02-12', 14, 3, 1;

-- Bloque 13
DECLARE @idTicket13 INT;
SET @idTicket13 = 13;

EXEC RegistrarVenta @idTicket13, '2024-02-13', 11, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (52, @idTicket13, 1, 3), 
       (53, @idTicket13, 4, 2), 
       (54, @idTicket13, 9, 1),
       (55, @idTicket13, 13, 3),
       (56, @idTicket13, 14, 2);

EXEC RegistrarVenta @idTicket13, '2024-02-13', 11, 1, 1;

-- Bloque 14
DECLARE @idTicket14 INT;
SET @idTicket14 = 14;

EXEC RegistrarVenta @idTicket14, '2024-02-14', 18, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (57, @idTicket14, 11, 2), 
       (58, @idTicket14, 13, 1), 
       (59, @idTicket14, 16, 3),
       (60, @idTicket14, 19, 2);

EXEC RegistrarVenta @idTicket14, '2024-02-14', 18, 2, 1;

-- Bloque 15
DECLARE @idTicket15 INT;
SET @idTicket15 = 15;

EXEC RegistrarVenta @idTicket15, '2024-02-15', 20, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (61, @idTicket15, 2, 1), 
       (62, @idTicket15, 5, 2), 
       (63, @idTicket15, 8, 1),
       (64, @idTicket15, 14, 3),
       (65, @idTicket15, 17, 2);

EXEC RegistrarVenta @idTicket15, '2024-02-15', 20, 3, 1;

-- Bloque 16
DECLARE @idTicket16 INT;
SET @idTicket16 = 16;

EXEC RegistrarVenta @idTicket16, '2024-02-16', 15, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (66, @idTicket16, 3, 2), 
       (67, @idTicket16, 7, 1), 
       (68, @idTicket16, 10, 3),
       (69, @idTicket16, 13, 2);

EXEC RegistrarVenta @idTicket16, '2024-02-16', 15, 1, 1;

-- Bloque 17
DECLARE @idTicket17 INT;
SET @idTicket17 = 17;

EXEC RegistrarVenta @idTicket17, '2024-02-17', 8, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (70, @idTicket17, 1, 1), 
       (71, @idTicket17, 6, 2), 
       (72, @idTicket17, 11, 1),
       (73, @idTicket17, 15, 3),
       (74, @idTicket17, 19, 2);

EXEC RegistrarVenta @idTicket17, '2024-02-17', 8, 3, 1;

-- Bloque 18
DECLARE @idTicket18 INT;
SET @idTicket18 = 18;

EXEC RegistrarVenta @idTicket18, '2024-02-18', 5, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (75, @idTicket18, 2, 2), 
       (76, @idTicket18, 5, 1), 
       (77, @idTicket18, 20, 1)
EXEC RegistrarVenta @idTicket18, '2024-02-18', 5, 1, 1;

-- Bloque 19
DECLARE @idTicket19 INT;
SET @idTicket19 = 19;

EXEC RegistrarVenta @idTicket19, '2024-02-19', 16, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (78, @idTicket19, 3, 3), 
       (79, @idTicket19, 6, 2), 
       (80, @idTicket19, 8, 1),
       (81, @idTicket19, 12, 4);

EXEC RegistrarVenta @idTicket19, '2024-02-19', 16, 2, 1;

-- Bloque 20
DECLARE @idTicket20 INT;
SET @idTicket20 = 20;

EXEC RegistrarVenta @idTicket20, '2024-02-20', 13, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (82, @idTicket20, 2, 1), 
       (83, @idTicket20, 5, 2), 
       (84, @idTicket20, 7, 1),
       (85, @idTicket20, 10, 3),
       (86, @idTicket20, 14, 2);

EXEC RegistrarVenta @idTicket20, '2024-02-20', 13, 3, 1;

-- Bloque 21
DECLARE @idTicket21 INT;
SET @idTicket21 = 21;

EXEC RegistrarVenta @idTicket21, '2024-02-21', 4, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (87, @idTicket21, 1, 2), 
       (88, @idTicket21, 4, 3), 
       (89, @idTicket21, 9, 1),
       (90, @idTicket21, 13, 2);

EXEC RegistrarVenta @idTicket21, '2024-02-21', 4, 1, 1;

-- Bloque 22
DECLARE @idTicket22 INT;
SET @idTicket22 = 22;

EXEC RegistrarVenta @idTicket22, '2024-02-22', 19, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (91, @idTicket22, 11, 3), 
       (92, @idTicket22, 13, 1), 
       (93, @idTicket22, 16, 2),
       (94, @idTicket22, 19, 3);

EXEC RegistrarVenta @idTicket22, '2024-02-22', 19, 2, 1;

-- Bloque 23
DECLARE @idTicket23 INT;
SET @idTicket23 = 23;

EXEC RegistrarVenta @idTicket23, '2024-02-23', 2, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (95, @idTicket23, 2, 1), 
       (96, @idTicket23, 5, 2), 
       (97, @idTicket23, 8, 3),
       (98, @idTicket23, 14, 2),
       (99, @idTicket23, 17, 1);

EXEC RegistrarVenta @idTicket23, '2024-02-23', 2, 3, 1;

-- Bloque 24
DECLARE @idTicket24 INT;
SET @idTicket24 = 24;

EXEC RegistrarVenta @idTicket24, '2024-02-24', 17, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (100, @idTicket24, 3, 2), 
        (101, @idTicket24, 7, 1), 
        (102, @idTicket24, 10, 2),
        (103, @idTicket24, 13, 3);

EXEC RegistrarVenta @idTicket24, '2024-02-24', 17, 1, 1;

-- Bloque 25
DECLARE @idTicket25 INT;
SET @idTicket25 = 25;

EXEC RegistrarVenta @idTicket25, '2024-02-25', 10, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (104, @idTicket25, 1, 1), 
        (105, @idTicket25, 6, 2), 
        (106, @idTicket25, 11, 1),
        (107, @idTicket25, 15, 4),
        (108, @idTicket25, 19, 2);

EXEC RegistrarVenta @idTicket25, '2024-02-25', 10, 3, 1;

-- Bloque 26
DECLARE @idTicket26 INT;
SET @idTicket26 = 26;

EXEC RegistrarVenta @idTicket26, '2024-02-26', 8, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (109, @idTicket26, 2, 2), 
        (110, @idTicket26, 5, 1), 
        (111, @idTicket26, 8, 3),
        (112, @idTicket26, 12, 2);

EXEC RegistrarVenta @idTicket26, '2024-02-26', 8, 1, 1;

-- Bloque 27
DECLARE @idTicket27 INT;
SET @idTicket27 = 27;

EXEC RegistrarVenta @idTicket27, '2024-02-27', 3, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (113, @idTicket27, 3, 1), 
        (114, @idTicket27, 7, 2), 
        (115, @idTicket27, 10, 3),
        (116, @idTicket27, 13, 1),
        (117, @idTicket27, 17, 2);

EXEC RegistrarVenta @idTicket27, '2024-02-27', 3, 2, 1;

-- Bloque 28
DECLARE @idTicket28 INT;
SET @idTicket28 = 28;

EXEC RegistrarVenta @idTicket28, '2024-02-28', 12, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (118, @idTicket28, 2, 2);
EXEC RegistrarVenta @idTicket28, '2024-02-28', 12, 3, 1;

-- Bloque 29
DECLARE @idTicket29 INT;
SET @idTicket29 = 29;

EXEC RegistrarVenta @idTicket29, '2024-03-01', 9, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (119, @idTicket29, 2, 2), 
       (120, @idTicket29, 5, 1), 
       (121, @idTicket29, 8, 1);

EXEC RegistrarVenta @idTicket29, '2024-03-01', 9, 1, 1;

-- Bloque 30
DECLARE @idTicket30 INT;
SET @idTicket30 = 30;

EXEC RegistrarVenta @idTicket30, '2024-03-01', 14, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (122, @idTicket30, 3, 2), 
       (123, @idTicket30, 6, 1);

EXEC RegistrarVenta @idTicket30, '2024-03-01', 14, 2, 1;

-- Bloque 31
DECLARE @idTicket31 INT;
SET @idTicket31 = 31;

EXEC RegistrarVenta @idTicket31, '2024-03-01', 11, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (124, @idTicket31, 1, 3), 
       (125, @idTicket31, 4, 2);

EXEC RegistrarVenta @idTicket31, '2024-03-02', 11, 3, 1;

-- Bloque 32
DECLARE @idTicket32 INT;
SET @idTicket32 = 32;

EXEC RegistrarVenta @idTicket32, '2024-03-02', 18, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (126, @idTicket32, 11, 2), 
       (127, @idTicket32, 13, 1);

EXEC RegistrarVenta @idTicket32, '2024-03-02', 18, 1, 1;

-- Bloque 33
DECLARE @idTicket33 INT;
SET @idTicket33 = 33;

EXEC RegistrarVenta @idTicket33, '2024-03-02', 20, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (128, @idTicket33, 2, 1);

EXEC RegistrarVenta @idTicket33, '2024-03-02', 20, 2, 1;

-- Bloque 34
DECLARE @idTicket34 INT;
SET @idTicket34 = 34;

EXEC RegistrarVenta @idTicket34, '2024-03-03', 15, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (129, @idTicket34, 3, 2);

EXEC RegistrarVenta @idTicket34, '2024-03-03', 15, 3, 1;

-- Bloque 35
DECLARE @idTicket35 INT;
SET @idTicket35 = 35;

EXEC RegistrarVenta @idTicket35, '2024-03-04', 8, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (130, @idTicket35, 1, 1);

EXEC RegistrarVenta @idTicket35, '2024-03-04', 8, 1, 1;

-- Bloque 36
DECLARE @idTicket36 INT;
SET @idTicket36 = 36;

EXEC RegistrarVenta @idTicket36, '2024-03-05', 17, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (131, @idTicket36, 1, 3);

EXEC RegistrarVenta @idTicket36, '2024-03-05', 17, 2, 1;

-- Bloque 37
DECLARE @idTicket37 INT;
SET @idTicket37 = 37;

EXEC RegistrarVenta @idTicket37, '2024-03-06', 2, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (132, @idTicket37, 2, 2);

EXEC RegistrarVenta @idTicket37, '2024-03-06', 2, 3, 1;

-- Bloque 38
DECLARE @idTicket38 INT;
SET @idTicket38 = 38;

EXEC RegistrarVenta @idTicket38, '2024-03-07', 19, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (133, @idTicket38, 11, 2);

EXEC RegistrarVenta @idTicket38, '2024-03-07', 19, 1, 1;

-- Bloque 39
DECLARE @idTicket39 INT;
SET @idTicket39 = 39;

EXEC RegistrarVenta @idTicket39, '2024-03-08', 16, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (134, @idTicket39, 3, 3), 
       (135, @idTicket39, 6, 2), 
       (136, @idTicket39, 8, 1),
       (137, @idTicket39, 12, 4),
       (138, @idTicket39, 14, 1);

EXEC RegistrarVenta @idTicket39, '2024-03-08', 16, 2, 1;

-- Bloque 40
DECLARE @idTicket40 INT;
SET @idTicket40 = 40;

EXEC RegistrarVenta @idTicket40, '2024-03-09', 13, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (139, @idTicket40, 2, 2), 
       (140, @idTicket40, 5, 1), 
       (141, @idTicket40, 8, 1),
       (142, @idTicket40, 12, 1),
       (143, @idTicket40, 16, 1),
       (144, @idTicket40, 18, 1);

EXEC RegistrarVenta @idTicket40, '2024-03-09', 13, 1, 1;

-- Bloque 41
DECLARE @idTicket41 INT;
SET @idTicket41 = 41;

EXEC RegistrarVenta @idTicket41, '2024-03-10', 10, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (145, @idTicket41, 3, 2), 
       (146, @idTicket41, 7, 1), 
       (147, @idTicket41, 10, 3),
       (148, @idTicket41, 14, 2),
       (149, @idTicket41, 18, 1),
       (150, @idTicket41, 20, 1);

EXEC RegistrarVenta @idTicket41, '2024-03-10', 10, 3, 1;

-- Bloque 42
DECLARE @idTicket42 INT;
SET @idTicket42 = 42;

EXEC RegistrarVenta @idTicket42, '2024-03-11', 4, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (151, @idTicket42, 1, 2), 
       (152, @idTicket42, 4, 3), 
       (153, @idTicket42, 9, 1),
       (154, @idTicket42, 13, 2),
       (155, @idTicket42, 16, 1),
       (156, @idTicket42, 18, 1);

EXEC RegistrarVenta @idTicket42, '2024-03-11', 4, 1, 1;

-- Bloque 43
DECLARE @idTicket43 INT;
SET @idTicket43 = 43;

EXEC RegistrarVenta @idTicket43, '2024-03-12', 19, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (157, @idTicket43, 11, 3), 
       (158, @idTicket43, 13, 1), 
       (159, @idTicket43, 16, 2),
       (160, @idTicket43, 19, 3),
       (161, @idTicket43, 20, 1);

EXEC RegistrarVenta @idTicket43, '2024-03-12', 19, 2, 1;

-- Bloque 44
DECLARE @idTicket44 INT;
SET @idTicket44 = 44;

EXEC RegistrarVenta @idTicket44, '2024-03-13', 2, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (162, @idTicket44, 2, 1), 
       (163, @idTicket44, 5, 2), 
       (164, @idTicket44, 8, 3),
       (165, @idTicket44, 14, 2),
       (166, @idTicket44, 17, 1),
       (167, @idTicket44, 19, 1);

EXEC RegistrarVenta @idTicket44, '2024-03-13', 2, 3, 1;

-- Bloque 45
DECLARE @idTicket45 INT;
SET @idTicket45 = 45;

EXEC RegistrarVenta @idTicket45, '2024-03-14', 17, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (168, @idTicket45, 3, 2), 
       (169, @idTicket45, 7, 1), 
       (170, @idTicket45, 10, 2),
       (171, @idTicket45, 13, 3),
       (172, @idTicket45, 17, 2),
       (173, @idTicket45, 20, 1);

EXEC RegistrarVenta @idTicket45, '2024-03-14', 17, 1, 1;

-- Bloque 46
DECLARE @idTicket46 INT;
SET @idTicket46 = 46;

EXEC RegistrarVenta @idTicket46, '2024-03-15', 8, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (174, @idTicket46, 1, 1), 
       (175, @idTicket46, 6, 2), 
       (176, @idTicket46, 11, 1),
       (177, @idTicket46, 15, 3),
       (178, @idTicket46, 19, 2),
       (179, @idTicket46, 20, 1);

EXEC RegistrarVenta @idTicket46, '2024-03-15', 8, 3, 1;

-- Bloque 47
DECLARE @idTicket47 INT;
SET @idTicket47 = 47;

EXEC RegistrarVenta @idTicket47, '2024-03-16', 5, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (180, @idTicket47, 1, 3);
EXEC RegistrarVenta @idTicket47, '2024-03-16', 5, 1, 1;

DECLARE @idTicket47 INT;
SET @idTicket47 = 47;
EXEC CancelarVenta @idTicket47;

-- Bloque 48
DECLARE @idTicket48 INT;
SET @idTicket48 = 48;

EXEC RegistrarVenta @idTicket48, '2024-03-17', 10, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (180, @idTicket48, 2, 2), 
       (181, @idTicket48, 5, 1);

EXEC RegistrarVenta @idTicket48, '2024-03-17', 10, 2, 1;

DECLARE @idTicket48 INT;
SET @idTicket48 = 48;
EXEC CancelarVenta @idTicket48;

-- Bloque 49
DECLARE @idTicket49 INT;
SET @idTicket49 = 49;

EXEC RegistrarVenta @idTicket49, '2024-03-18', 12, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (182, @idTicket49, 3, 2), 
       (183, @idTicket49, 6, 1),
       (184, @idTicket49, 9, 2);

EXEC RegistrarVenta @idTicket49, '2024-03-18', 12, 3, 1;

-- Bloque 50
DECLARE @idTicket50 INT;
SET @idTicket50 = 50;

EXEC RegistrarVenta @idTicket50, '2024-03-19', 11, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (185, @idTicket50, 1, 2), 
       (186, @idTicket50, 4, 1);

EXEC RegistrarVenta @idTicket50, '2024-03-19', 11, 1, 1;

-- Bloque 51
DECLARE @idTicket51 INT;
SET @idTicket51 = 51;

EXEC RegistrarVenta @idTicket51, '2024-03-20', 15, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (187, @idTicket51, 3, 2), 
       (188, @idTicket51, 6, 1),
       (189, @idTicket51, 8, 1);

EXEC RegistrarVenta @idTicket51, '2024-03-20', 15, 2, 1;

-- Bloque 52
DECLARE @idTicket52 INT;
SET @idTicket52 = 52;

EXEC RegistrarVenta @idTicket52, '2024-03-21', 14, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (190, @idTicket52, 2, 1), 
       (191, @idTicket52, 5, 2),
       (192, @idTicket52, 8, 1);

EXEC RegistrarVenta @idTicket52, '2024-03-21', 14, 1, 1;

-- Bloque 53
DECLARE @idTicket53 INT;
SET @idTicket53 = 53;

EXEC RegistrarVenta @idTicket53, '2024-03-22', 19, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (193, @idTicket53, 11, 3), 
       (194, @idTicket53, 13, 1);

EXEC RegistrarVenta @idTicket53, '2024-03-22', 19, 3, 1;

-- Bloque 54
DECLARE @idTicket54 INT;
SET @idTicket54 = 54;

EXEC RegistrarVenta @idTicket54, '2024-03-23', 2, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (195, @idTicket54, 2, 1), 
       (196, @idTicket54, 5, 1),
       (197, @idTicket54, 8, 1);

EXEC RegistrarVenta @idTicket54, '2024-03-23', 2, 2, 1;

-- Bloque 55
DECLARE @idTicket55 INT;
SET @idTicket55 = 55;

EXEC RegistrarVenta @idTicket55, '2024-03-24', 17, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (198, @idTicket55, 3, 2), 
       (199, @idTicket55, 7, 1);

EXEC RegistrarVenta @idTicket55, '2024-03-24', 17, 1, 1;

-- Bloque 56
DECLARE @idTicket56 INT;
SET @idTicket56 = 56;

EXEC RegistrarVenta @idTicket56, '2024-03-25', 8, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (200, @idTicket56, 1, 2);

EXEC RegistrarVenta @idTicket56, '2024-03-25', 8, 2, 1;

-- Bloque 57
DECLARE @idTicket57 INT;
SET @idTicket57 = 57;

EXEC RegistrarVenta @idTicket57, '2024-03-26', 17, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (201, @idTicket57, 3, 2), 
       (202, @idTicket57, 7, 1),
       (203, @idTicket57, 10, 1);

EXEC RegistrarVenta @idTicket57, '2024-03-26', 17, 3, 1;

-- Bloque 58
DECLARE @idTicket58 INT;
SET @idTicket58 = 58;

EXEC RegistrarVenta @idTicket58, '2024-03-27', 10, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (204, @idTicket58, 2, 2);

EXEC RegistrarVenta @idTicket58, '2024-03-27', 10, 1, 1;

-- Bloque 59
DECLARE @idTicket59 INT;
SET @idTicket59 = 59;

EXEC RegistrarVenta @idTicket59, '2024-03-28', 12, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (205, @idTicket59, 3, 2), 
       (206, @idTicket59, 6, 1),
       (207, @idTicket59, 9, 1);

EXEC RegistrarVenta @idTicket59, '2024-03-28', 12, 2, 1;

-- Bloque 60
DECLARE @idTicket60 INT;
SET @idTicket60 = 60;

EXEC RegistrarVenta @idTicket60, '2024-03-29', 11, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (208, @idTicket60, 3, 1), 
       (209, @idTicket60, 6, 1),
       (210, @idTicket60, 8, 2),
       (211, @idTicket60, 12, 1);

EXEC RegistrarVenta @idTicket60, '2024-03-29', 11, 3, 1;

-- Bloque 61
DECLARE @idTicket61 INT;
SET @idTicket61 = 61;

EXEC RegistrarVenta @idTicket61, '2024-03-30', 15, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (212, @idTicket61, 2, 1), 
       (213, @idTicket61, 5, 1),
       (214, @idTicket61, 8, 1);

EXEC RegistrarVenta @idTicket61, '2024-03-30', 15, 1, 1;

-- Bloque 62
DECLARE @idTicket62 INT;
SET @idTicket62 = 62;

EXEC RegistrarVenta @idTicket62, '2024-04-01', 14, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (215, @idTicket62, 2, 1), 
       (216, @idTicket62, 5, 1),
       (217, @idTicket62, 8, 1);

EXEC RegistrarVenta @idTicket62, '2024-04-01', 14, 2, 1;

-- Bloque 63
DECLARE @idTicket63 INT;
SET @idTicket63 = 63;

EXEC RegistrarVenta @idTicket63, '2024-04-02', 19, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (218, @idTicket63, 11, 2), 
       (219, @idTicket63, 13, 1),
       (220, @idTicket63, 16, 2);

EXEC RegistrarVenta @idTicket63, '2024-04-02', 19, 3, 1;

-- Bloque 64
DECLARE @idTicket64 INT;
SET @idTicket64 = 64;

EXEC RegistrarVenta @idTicket64, '2024-04-03', 2, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (221, @idTicket64, 2, 2), 
       (222, @idTicket64, 5, 1),
       (223, @idTicket64, 8, 1);

EXEC RegistrarVenta @idTicket64, '2024-04-03', 2, 1, 1;

-- Bloque 65
DECLARE @idTicket65 INT;
SET @idTicket65 = 65;

EXEC RegistrarVenta @idTicket65, '2024-04-04', 17, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (224, @idTicket65, 3, 1), 
       (225, @idTicket65, 7, 1),
       (226, @idTicket65, 10, 1);

EXEC RegistrarVenta @idTicket65, '2024-04-04', 17, 1, 1;

-- Bloque 66
DECLARE @idTicket66 INT;
SET @idTicket66 = 66;

EXEC RegistrarVenta @idTicket66, '2024-04-05', 8, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (227, @idTicket66, 1, 2), 
       (228, @idTicket66, 6, 1),
       (229, @idTicket66, 11, 1),
       (230, @idTicket66, 15, 2);

EXEC RegistrarVenta @idTicket66, '2024-04-05', 8, 3, 1;

-- Bloque 67
DECLARE @idTicket67 INT;
SET @idTicket67 = 67;

EXEC RegistrarVenta @idTicket67, '2024-04-06', 5, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (231, @idTicket67, 2, 1), 
       (232, @idTicket67, 5, 1),
       (233, @idTicket67, 8, 1);

EXEC RegistrarVenta @idTicket67, '2024-04-06', 5, 1, 1;

-- Bloque 68
DECLARE @idTicket68 INT;
SET @idTicket68 = 68;

EXEC RegistrarVenta @idTicket68, '2024-04-07', 17, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (234, @idTicket68, 3, 1), 
       (235, @idTicket68, 7, 1),
       (236, @idTicket68, 10, 1),
       (237, @idTicket68, 13, 1);

EXEC RegistrarVenta @idTicket68, '2024-04-07', 17, 2, 1;

-- Bloque 69
DECLARE @idTicket69 INT;
SET @idTicket69 = 69;

EXEC RegistrarVenta @idTicket69, '2024-04-08', 10, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (238, @idTicket69, 2, 2), 
       (239, @idTicket69, 5, 1);

EXEC RegistrarVenta @idTicket69, '2024-04-08', 10, 1, 1;

-- Bloque 70
DECLARE @idTicket70 INT;
SET @idTicket70 = 70;

EXEC RegistrarVenta @idTicket70, '2024-04-08', 10, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (240, @idTicket70, 2, 1), 
       (241, @idTicket70, 5, 1),
       (242, @idTicket70, 8, 1);

EXEC RegistrarVenta @idTicket70, '2024-04-08', 10, 1, 1;

-- Bloque 71
DECLARE @idTicket71 INT;
SET @idTicket71 = 71;

EXEC RegistrarVenta @idTicket71, '2024-04-09', 12, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (243, @idTicket71, 3, 1), 
       (244, @idTicket71, 6, 1),
       (245, @idTicket71, 9, 1);

EXEC RegistrarVenta @idTicket71, '2024-04-09', 12, 2, 1;

-- Bloque 72
DECLARE @idTicket72 INT;
SET @idTicket72 = 72;

EXEC RegistrarVenta @idTicket72, '2024-04-09', 12, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (246, @idTicket72, 3, 2), 
       (247, @idTicket72, 6, 1);

EXEC RegistrarVenta @idTicket72, '2024-04-09', 12, 2, 1;

-- Bloque 73
DECLARE @idTicket73 INT;
SET @idTicket73 = 73;

EXEC RegistrarVenta @idTicket73, '2024-04-10', 11, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (248, @idTicket73, 3, 1), 
       (249, @idTicket73, 6, 1),
       (250, @idTicket73, 8, 1),
       (251, @idTicket73, 12, 1);

EXEC RegistrarVenta @idTicket73, '2024-04-10', 11, 3, 1;

-- Bloque 74
DECLARE @idTicket74 INT;
SET @idTicket74 = 74;

EXEC RegistrarVenta @idTicket74, '2024-04-11', 15, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (252, @idTicket74, 2, 1), 
       (253, @idTicket74, 5, 1),
       (254, @idTicket74, 8, 1);

EXEC RegistrarVenta @idTicket74, '2024-04-11', 15, 1, 1;

-- Bloque 75
DECLARE @idTicket75 INT;
SET @idTicket75 = 75;

EXEC RegistrarVenta @idTicket75, '2024-04-12', 14, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (255, @idTicket75, 2, 1), 
       (256, @idTicket75, 5, 1),
       (257, @idTicket75, 8, 1);

EXEC RegistrarVenta @idTicket75, '2024-04-12', 14, 2, 1;

-- Bloque 76
DECLARE @idTicket76 INT;
SET @idTicket76 = 76;

EXEC RegistrarVenta @idTicket76, '2024-04-13', 19, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (258, @idTicket76, 11, 2), 
       (259, @idTicket76, 13, 1),
       (260, @idTicket76, 16, 2);

EXEC RegistrarVenta @idTicket76, '2024-04-13', 19, 3, 1;

-- Bloque 77
DECLARE @idTicket77 INT;
SET @idTicket77 = 77;

EXEC RegistrarVenta @idTicket77, '2024-04-14', 2, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (261, @idTicket77, 2, 2), 
       (262, @idTicket77, 5, 1),
       (263, @idTicket77, 8, 1);

EXEC RegistrarVenta @idTicket77, '2024-04-14', 2, 1, 1;

-- Bloque 78
DECLARE @idTicket78 INT;
SET @idTicket78 = 78;

EXEC RegistrarVenta @idTicket78, '2024-04-15', 17, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (264, @idTicket78, 3, 1), 
       (265, @idTicket78, 7, 1),
       (266, @idTicket78, 10, 1);

EXEC RegistrarVenta @idTicket78, '2024-04-15', 17, 1, 1;

-- Bloque 79
DECLARE @idTicket79 INT;
SET @idTicket79 = 79;

EXEC RegistrarVenta @idTicket79, '2024-04-16', 5, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (310, @idTicket79, 2, 1), 
       (311, @idTicket79, 5, 2);

EXEC RegistrarVenta @idTicket79, '2024-04-16', 5, 1, 1;

-- Bloque 80
DECLARE @idTicket80 INT;
SET @idTicket80 = 80;

EXEC RegistrarVenta @idTicket80, '2024-04-16', 5, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (312, @idTicket80, 2, 3), 
       (313, @idTicket80, 5, 1),
       (314, @idTicket80, 8, 2);

EXEC RegistrarVenta @idTicket80, '2024-04-16', 5, 1, 1;

-- Bloque 81
DECLARE @idTicket81 INT;
SET @idTicket81 = 81;

EXEC RegistrarVenta @idTicket81, '2024-04-17', 8, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (315, @idTicket81, 3, 2), 
       (316, @idTicket81, 6, 1),
       (317, @idTicket81, 9, 1),
       (318, @idTicket81, 12, 3);

EXEC RegistrarVenta @idTicket81, '2024-04-17', 8, 2, 1;

-- Bloque 82
DECLARE @idTicket82 INT;
SET @idTicket82 = 82;

EXEC RegistrarVenta @idTicket82, '2024-04-17', 8, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (319, @idTicket82, 3, 1), 
       (320, @idTicket82, 6, 1),
       (321, @idTicket82, 9, 2);

EXEC RegistrarVenta @idTicket82, '2024-04-17', 8, 2, 1;

-- Bloque 83
DECLARE @idTicket83 INT;
SET @idTicket83 = 83;

EXEC RegistrarVenta @idTicket83, '2024-04-18', 12, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (322, @idTicket83, 3, 2), 
       (323, @idTicket83, 6, 1);

EXEC RegistrarVenta @idTicket83, '2024-04-18', 12, 1, 1;

-- Bloque 84
DECLARE @idTicket84 INT;
SET @idTicket84 = 84;

EXEC RegistrarVenta @idTicket84, '2024-04-19', 11, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (324, @idTicket84, 3, 1), 
       (325, @idTicket84, 6, 2),
       (326, @idTicket84, 8, 1);

EXEC RegistrarVenta @idTicket84, '2024-04-19', 11, 3, 1;

-- Bloque 85
DECLARE @idTicket85 INT;
SET @idTicket85 = 85;

EXEC RegistrarVenta @idTicket85, '2024-04-19', 11, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (327, @idTicket85, 3, 2), 
       (328, @idTicket85, 6, 1),
       (329, @idTicket85, 8, 1),
       (330, @idTicket85, 12, 1);

EXEC RegistrarVenta @idTicket85, '2024-04-19', 11, 3, 1;

-- Bloque 86
DECLARE @idTicket86 INT;
SET @idTicket86 = 86;

EXEC RegistrarVenta @idTicket86, '2024-04-20', 15, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (331, @idTicket86, 3, 1), 
       (332, @idTicket86, 6, 1),
       (333, @idTicket86, 8, 1);

EXEC RegistrarVenta @idTicket86, '2024-04-20', 15, 2, 1;

-- Bloque 87
DECLARE @idTicket87 INT;
SET @idTicket87 = 87;

EXEC RegistrarVenta @idTicket87, '2024-04-21', 14, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (334, @idTicket87, 3, 1), 
       (335, @idTicket87, 6, 1);

EXEC RegistrarVenta @idTicket87, '2024-04-21', 14, 1, 1;

-- Bloque 88
DECLARE @idTicket88 INT;
SET @idTicket88 = 88;

EXEC RegistrarVenta @idTicket88, '2024-04-21', 14, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (336, @idTicket88, 3, 2), 
       (337, @idTicket88, 6, 1),
       (338, @idTicket88, 8, 1);

EXEC RegistrarVenta @idTicket88, '2024-04-21', 14, 1, 1;

-- Bloque 89
DECLARE @idTicket89 INT;
SET @idTicket89 = 89;

EXEC RegistrarVenta @idTicket89, '2024-04-22', 3, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (339, @idTicket89, 4, 1), 
       (340, @idTicket89, 7, 2);

EXEC RegistrarVenta @idTicket89, '2024-04-22', 3, 2, 1;

-- Bloque 90
DECLARE @idTicket90 INT;
SET @idTicket90 = 90;

EXEC RegistrarVenta @idTicket90, '2024-04-22', 3, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (341, @idTicket90, 4, 2), 
       (342, @idTicket90, 7, 1),
       (343, @idTicket90, 9, 1);

EXEC RegistrarVenta @idTicket90, '2024-04-22', 3, 2, 1;

-- Bloque 91
DECLARE @idTicket91 INT;
SET @idTicket91 = 91;

EXEC RegistrarVenta @idTicket91, '2024-04-23', 1, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (344, @idTicket91, 2, 1), 
       (345, @idTicket91, 5, 1),
       (346, @idTicket91, 11, 1);

EXEC RegistrarVenta @idTicket91, '2024-04-23', 1, 1, 1;

-- Bloque 92
DECLARE @idTicket92 INT;
SET @idTicket92 = 92;

EXEC RegistrarVenta @idTicket92, '2024-04-23', 1, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (347, @idTicket92, 2, 2), 
       (348, @idTicket92, 5, 1);

EXEC RegistrarVenta @idTicket92, '2024-04-23', 1, 1, 1;

-- Bloque 93
DECLARE @idTicket93 INT;
SET @idTicket93 = 93;

EXEC RegistrarVenta @idTicket93, '2024-04-24', 7, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (349, @idTicket93, 8, 1), 
       (350, @idTicket93, 10, 1);

EXEC RegistrarVenta @idTicket93, '2024-04-24', 7, 2, 1;

-- Bloque 94
DECLARE @idTicket94 INT;
SET @idTicket94 = 94;

EXEC RegistrarVenta @idTicket94, '2024-04-24', 7, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (351, @idTicket94, 8, 2), 
       (352, @idTicket94, 10, 1),
       (353, @idTicket94, 13, 1);

EXEC RegistrarVenta @idTicket94, '2024-04-24', 7, 2, 1;

-- Bloque 95
DECLARE @idTicket95 INT;
SET @idTicket95 = 95;

EXEC RegistrarVenta @idTicket95, '2024-04-25', 16, 3, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (354, @idTicket95, 17, 2), 
       (355, @idTicket95, 19, 1),
       (356, @idTicket95, 20, 1);

EXEC RegistrarVenta @idTicket95, '2024-04-25', 16, 3, 1;

-- Bloque 96
DECLARE @idTicket96 INT;
SET @idTicket96 = 96;

EXEC RegistrarVenta @idTicket96, '2024-04-26', 18, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (357, @idTicket96, 19, 1), 
       (358, @idTicket96, 20, 2);

EXEC RegistrarVenta @idTicket96, '2024-04-26', 18, 1, 1;

-- Bloque 97
DECLARE @idTicket97 INT;
SET @idTicket97 = 97;

EXEC RegistrarVenta @idTicket97, '2024-04-26', 18, 1, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (359, @idTicket97, 19, 2), 
       (360, @idTicket97, 20, 1);

EXEC RegistrarVenta @idTicket97, '2024-04-26', 18, 1, 1;

-- Bloque 98
DECLARE @idTicket98 INT;
SET @idTicket98 = 98;

EXEC RegistrarVenta @idTicket98, '2024-04-27', 4, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (361, @idTicket98, 5, 1), 
       (362, @idTicket98, 7, 1),
       (363, @idTicket98, 9, 1);

EXEC RegistrarVenta @idTicket98, '2024-04-27', 4, 2, 1;

-- Bloque 99
DECLARE @idTicket99 INT;
SET @idTicket99 = 99;

EXEC RegistrarVenta @idTicket99, '2024-04-28', 4, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (364, @idTicket99, 5, 1), 
       (365, @idTicket99, 7, 2),
       (366, @idTicket99, 10, 1);

EXEC RegistrarVenta @idTicket99, '2024-04-28', 4, 2, 1;

-- Bloque 100
DECLARE @idTicket100 INT;
SET @idTicket100 = 100;

EXEC RegistrarVenta @idTicket100, '2024-04-29', 4, 2, 1;

INSERT INTO TicketProducto (idTicketProducto, idTicket, idProducto, cantidad)
VALUES (367, @idTicket100, 5, 1), 
       (368, @idTicket100, 7, 1),
       (369, @idTicket100, 10, 2);

EXEC RegistrarVenta @idTicket100, '2024-04-29', 4, 2, 1;


-- Poblar la tabla PagoEmpleado y actualizar el saldo de la cuenta
EXEC RegistrarPagoEmpleado 1,'2024-01-01', 300.00, 1, 1;
EXEC RegistrarPagoEmpleado 2,'2024-01-01' , 300.00, 1, 2 ;
EXEC RegistrarPagoEmpleado 3, '2024-01-01', 300.00, 1, 3;
EXEC RegistrarPagoEmpleado 1,'2024-02-01', 300.00, 1, 4;
EXEC RegistrarPagoEmpleado 2,'2024-02-01' , 300.00, 1, 5 ;
EXEC RegistrarPagoEmpleado 3, '2024-02-01', 300.00, 1, 6;
EXEC RegistrarPagoEmpleado 1,'2024-03-01', 300.00, 1, 7;
EXEC RegistrarPagoEmpleado 2,'2024-03-01' , 300.00, 1, 8 ;
EXEC RegistrarPagoEmpleado 3, '2024-03-01', 300.00, 1, 9;
EXEC RegistrarPagoEmpleado 1,'2024-04-01', 300.00, 1, 10;
EXEC RegistrarPagoEmpleado 2,'2024-04-01' , 300.00, 1, 11 ;
EXEC RegistrarPagoEmpleado 3, '2024-04-01', 300.00, 1, 12;
EXEC RegistrarPagoEmpleado 1,'2024-05-01', 300.00, 1, 13;
EXEC RegistrarPagoEmpleado 2,'2024-05-01' , 300.00, 1, 14 ;
EXEC RegistrarPagoEmpleado 3, '2024-05-01', 300.00, 1, 15;

--

--






