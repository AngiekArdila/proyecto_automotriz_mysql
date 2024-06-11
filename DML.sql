USE automotriz;

INSERT INTO Pais (paisID, Nombre) VALUES 
(3, 'Mexico'),
(4, 'Brazil'),
(5, 'Argentina'),
(6, 'Chile'),
(7, 'Peru'),
(8, 'Colombia'),
(9, 'Venezuela'),
(10, 'Ecuador');


INSERT INTO Region (regionID, Nombre, paisID) VALUES 
(3, 'Jalisco', 3),
(4, 'Sao Paulo', 4),
(5, 'Buenos Aires', 5),
(6, 'Santiago', 6),
(7, 'Lima', 7),
(8, 'Bogota', 8),
(9, 'Caracas', 9),
(10, 'Quito', 10);


INSERT INTO Ciudad (ciudadID, Nombre, regionID, paisID) VALUES 
(3, 'Guadalajara', 3, 3),
(4, 'Sao Paulo', 4, 4),
(5, 'Buenos Aires', 5, 5),
(6, 'Santiago', 6, 6),
(7, 'Lima', 7, 7),
(8, 'Bogota', 8, 8),
(9, 'Caracas', 9, 9),
(10, 'Quito', 10, 10);


INSERT INTO Marcas (MarcaID, Nombre) VALUES 
(3, 'Chevrolet'),
(4, 'Nissan'),
(5, 'Honda'),
(6, 'BMW'),
(7, 'Mercedes'),
(8, 'Hyundai'),
(9, 'Kia'),
(10, 'Mazda');


INSERT INTO Clientes (ClienteID, Nombre, Apellido, Direccion, Telefono, Email, tipo_Identificacion, Identificacion) VALUES 
(3, 'Carlos', 'Garcia', '789 Birch St', '555-8765', 'carlos.garcia@example.com', 'TI', 789456),
(4, 'Ana', 'Martinez', '321 Pine St', '555-4321', 'ana.martinez@example.com', 'CC', 321654),
(5, 'Luis', 'Lopez', '987 Cedar St', '555-9876', 'luis.lopez@example.com', 'PP', 123987),
(6, 'Maria', 'Gonzalez', '654 Spruce St', '555-6543', 'maria.gonzalez@example.com', 'CC', 654123),
(7, 'Pedro', 'Hernandez', '321 Maple St', '555-3210', 'pedro.hernandez@example.com', 'TI', 321098),
(8, 'Sofia', 'Ramirez', '123 Oak St', '555-1235', 'sofia.ramirez@example.com', 'CC', 543210),
(9, 'Miguel', 'Torres', '456 Elm St', '555-4567', 'miguel.torres@example.com', 'TI', 654321),
(10, 'Lucia', 'Vargas', '789 Pine St', '555-7890', 'lucia.vargas@example.com', 'CC', 987654);


INSERT INTO Proveedores (ProveedorID, Nombre, Apellido, Telefono, Direccion, Email) VALUES 
(3, 'David', 'Johnson', '555-0001', '111 Oak St', 'david.johnson@example.com'),
(4, 'Laura', 'Williams', '555-0002', '222 Maple St', 'laura.williams@example.com'),
(5, 'Daniel', 'Brown', '555-0003', '333 Birch St', 'daniel.brown@example.com'),
(6, 'Emily', 'Jones', '555-0004', '444 Cedar St', 'emily.jones@example.com'),
(7, 'Matthew', 'Davis', '555-0005', '555 Spruce St', 'matthew.davis@example.com'),
(8, 'Olivia', 'Miller', '555-0006', '666 Pine St', 'olivia.miller@example.com'),
(9, 'James', 'Wilson', '555-0007', '777 Elm St', 'james.wilson@example.com'),
(10, 'Sophia', 'Moore', '555-0008', '888 Cedar St', 'sophia.moore@example.com');


INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, Cargo, Telefono) VALUES 
(3, 'Laura', 'Martinez', 'Mechanic', '555-3333'),
(4, 'Peter', 'Robinson', 'Supervisor', '555-4444'),
(5, 'Linda', 'Garcia', 'Receptionist', '555-5555'),
(6, 'John', 'Hernandez', 'Cleaner', '555-6666'),
(7, 'Sandra', 'Lopez', 'Mechanic', '555-7777'),
(8, 'Henry', 'Gonzalez', 'Manager', '555-8888'),
(9, 'Chris', 'Martinez', 'Mechanic', '555-9999'),
(10, 'Anna', 'Smith', 'Supervisor', '555-0000');


INSERT INTO Vehiculos (VehiculoID, Placa, MarcaID, Modelo, Año, ClienteID) VALUES 
(3, 'JHK123', 3, 'Cruze', 2019, 3),
(4, 'LMN456', 4, 'Altima', 2017, 4),
(5, 'QRS789', 5, 'Civic', 2016, 5),
(6, 'TUV012', 6, '320i', 2021, 6),
(7, 'WXY345', 7, 'C-Class', 2020, 7),
(8, 'ABC678', 8, 'Elantra', 2018, 8),
(9, 'DEF901', 9, 'Sorento', 2019, 9),
(10, 'GHI234', 10, 'Mazda3', 2021, 10);


INSERT INTO Servicios (ServicioID, Tipo, Descripcion, Costo) VALUES 
(3, 'Brake Replacement', 'Replacement of brake pads', 149.99),
(4, 'Battery Replacement', 'Replacement of car battery', 119.99),
(5, 'Transmission Repair', 'Repair of transmission system', 499.99),
(6, 'Wheel Alignment', 'Alignment of car wheels', 89.99),
(7, 'Engine Repair', 'Repair of engine', 999.99),
(8, 'Air Conditioning Repair', 'Repair of air conditioning system', 199.99),
(9, 'Suspension Repair', 'Repair of suspension system', 299.99),
(10, 'Exhaust System Repair', 'Repair of exhaust system', 249.99);


INSERT INTO Inventario (InventarioID, PiezaID, Cantidad, ZonaID) VALUES 
(3, 3, 10, 3),
(4, 4, 100, 4),
(5, 5, 150, 5),
(6, 6, 50, 6),
(7, 7, 75, 7),
(8, 8, 125, 8),
(9, 9, 175, 9),
(10, 10, 200, 10);
 


INSERT INTO Piezas (PiezaID, Nombre, Descripcion, Precio, ProveedorID) VALUES 
(3, 'Battery', 'Car battery', 119.99, 3),
(4, 'Transmission Fluid', 'Fluid for transmission system', 19.99, 4),
(5, 'Wheel', 'Car wheel', 79.99, 5),
(6, 'Engine Oil', 'Oil for engine', 9.99, 6),
(7, 'Air Filter', 'Filter for air conditioning', 14.99, 7),
(8, 'Suspension Spring', 'Spring for suspension system', 39.99, 8),
(9, 'Exhaust Pipe', 'Pipe for exhaust system', 49.99, 9),
(10, 'Fuel Pump', 'Pump for fuel system', 89.99, 10);


INSERT INTO Sedes (SedeID, Nombre, EmpleadoID, ClienteID) VALUES 
(3, 'North Office', 3, 3),
(4, 'South Office', 4, 4),
(5, 'East Office', 5, 5),
(6, 'West Office', 6, 6),
(7, 'Central Office', 7, 7),
(8, 'Downtown Office', 8, 8),
(9, 'Uptown Office', 9, 9),
(10, 'Midtown Office', 10, 10);


INSERT INTO telefono_empleado (telefono_empleadoID, Tipo, Numero) VALUES 
(3, 'Fijo', '555-3333'),
(4, 'Movil', '555-4444'),
(5, 'Fijo', '555-5555'),
(6, 'Movil', '555-6666'),
(7, 'Fijo', '555-7777'),
(8, 'Movil', '555-8888'),
(9, 'Fijo', '555-9999'),
(10, 'Movil', '555-0000');


INSERT INTO telefono_cliente (telefono_clienteID, Tipo, Numero) VALUES 
(3, 'Fijo', '555-1235'),
(4, 'Movil', '555-4567'),
(5, 'Fijo', '555-7890'),
(6, 'Movil', '555-4321'),
(7, 'Fijo', '555-6543'),
(8, 'Movil', '555-3210'),
(9, 'Fijo', '555-9876'),
(10, 'Movil', '555-6543');


INSERT INTO telefono_proveedor (telefono_proveedorID, Tipo, Numero) VALUES 
(3, 'Fijo', '555-0001'),
(4, 'Movil', '555-0002'),
(5, 'Fijo', '555-0003'),
(6, 'Movil', '555-0004'),
(7, 'Fijo', '555-0005'),
(8, 'Movil', '555-0006'),
(9, 'Fijo', '555-0007'),
(10, 'Movil', '555-0008');



INSERT INTO Reparaciones (ReparacionID, Fecha, VehiculoID, EmpleadoID, CostoTotal, Descripcion) VALUES 
(3, '2023-02-10', 3, 3, 100.00, 'Battery replacement'),
(4, '2023-04-15', 4, 4, 150.00, 'Transmission repair'),
(5, '2023-06-20', 5, 5, 200.00, 'Wheel alignment'),
(6, '2023-08-25', 6, 6, 250.00, 'Engine repair'),
(7, '2023-10-30', 7, 7, 300.00, 'Air conditioning repair'),
(8, '2023-12-05', 8, 8, 350.00, 'Suspension repair'),
(9, '2024-02-10', 9, 9, 400.00, 'Exhaust system repair'),
(10, '2024-04-15', 10, 10, 450.00, 'Fuel pump replacement');




INSERT INTO Reparacion_Piezas (ReparacionID, PiezaID, Cantidad) VALUES 
(3, 3, 2),
(4, 4, 4),
(5, 3, 5),
(6, 6, 2),
(7, 3, 1),
(8, 8, 3),
(9, 9, 8),
(10, 10, 1);


INSERT INTO Facturacion (FacturaID, Fecha, ClienteID, Total) VALUES 
(3, '2023-02-10', 3, '100.00'),
(4, '2023-04-15', 4, '150.00'),
(5, '2023-06-20', 5, '200.00'),
(6, '2023-08-25', 6, '250.00'),
(7, '2023-10-30', 7, '300.00'),
(8, '2023-12-05', 8, '350.00'),
(9, '2024-02-10', 9, '400.00'),
(10, '2024-04-15', 10, '450.00');


INSERT INTO Factura_Detalles (FacturaID, ReparacionID, ClienteID, Total) VALUES 
(3, 3, 3, '100.00'),
(4, 4, 4, '150.00'),
(5, 5, 5, '200.00'),
(6, 6, 6, '250.00'),
(7, 7, 7, '300.00'),
(8, 8, 8, '350.00'),
(9, 9, 9, '400.00'),
(10, 10, 10, '450.00');


INSERT INTO orden_detalles (OrdenID, PiezaID, Cantidad, Precio, ClienteID) VALUES 
(3, 3, 100, '599.95', 3),
(4, 4, 2, '39.98', 4),
(5, 5, 4, '319.96', 5),
(6, 6, 3, '119.97', 6),
(7, 7, 6, '89.94', 7),
(8, 8, 7, '279.93', 8),
(9, 9, 8, '399.92', 9),
(10, 10, 9, '809.91', 10);


INSERT INTO Ordenes_Compra (OrdenID, Fecha, ProveedorID, EmpleadoID, total) VALUES 
(3, '2023-02-05', 3, 3, '599.95'),
(4, '2023-03-10', 4, 4, '39.98'),
(5, '2023-05-15', 5, 5, '319.96'),
(6, '2023-07-20', 6, 6, '119.97'),
(7, '2023-09-25', 7, 7, '89.94'),
(8, '2023-11-30', 8, 8, '279.93'),
(9, '2024-01-05', 9, 9, '399.92'),
(10, '2024-03-10', 10, 10, '809.91');


INSERT INTO Citas (CitaID, FechaHora, VehiculoID, ServicioID, EmpleadoID) VALUES 
(3, '2023-06-15 11:00:00', 3, 3, 3),
(4, '2023-07-01 13:00:00', 4, 4, 4),
(5, '2023-08-20 10:30:00', 5, 5, 5),
(6, '2023-09-10 14:00:00', 6, 6, 6),
(7, '2023-10-05 09:00:00', 7, 7, 7),
(8, '2023-11-15 12:30:00', 8, 8, 8),
(9, '2024-01-20 11:30:00', 9, 9, 9),
(10, '2024-03-05 08:00:00', 10, 10, 10);

