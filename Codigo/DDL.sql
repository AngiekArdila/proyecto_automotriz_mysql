CREATE DATABASE automotriz;
USE automotriz;

CREATE TABLE Marcas (
    MarcaID INT PRIMARY KEY,
    Nombre VARCHAR(40)
);

CREATE TABLE Inventario (
    InventarioID INT PRIMARY KEY auto_increment,
    PiezaID INT,
    Cantidad INT,
    ZonaID INT
);



CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(40),
    Apellido VARCHAR(60),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(40),
    tipo_Identificacion ENUM('CC', 'TI', 'PP'),
    Identificacion INT
);

CREATE TABLE Servicios (
    ServicioID INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Descripcion VARCHAR(50),
    Costo FLOAT
);



CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(20),
    Direccion VARCHAR(60),
    Email VARCHAR(50)
);

CREATE TABLE Piezas (
    PiezaID INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Descripcion VARCHAR(50),
    Precio FLOAT,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);
CREATE TABLE Vehiculos (
    VehiculoID INT PRIMARY KEY,
    Placa VARCHAR(30),
    MarcaID INT,
    Modelo VARCHAR(50),
    Año YEAR,
    ClienteID INT,
    FOREIGN KEY (MarcaID) REFERENCES Marcas(MarcaID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Cargo VARCHAR(50),
    Telefono VARCHAR(50)
);
CREATE TABLE orden_detalles (
    OrdenID INT,
    PiezaID INT,
    Cantidad INT,
    Precio VARCHAR(50),
    ClienteID INT,
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Ordenes_Compra (
    OrdenID INT PRIMARY KEY,
    Fecha DATETIME,
    ProveedorID INT,
    EmpleadoID INT,
    total VARCHAR(50),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE Sedes (
    SedeID INT PRIMARY KEY,
    Nombre VARCHAR(40),
    EmpleadoID INT,
    ClienteID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);



CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATETIME,
    VehiculoID INT,
    EmpleadoID INT,
    CostoTotal DOUBLE,
    Descripcion VARCHAR(50),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE Reparacion_Piezas (
    ReparacionID INT,
    PiezaID INT,
    Cantidad INT,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (PiezaID) REFERENCES Piezas(PiezaID)
);

CREATE TABLE Pais (
    paisID INT PRIMARY KEY,
    Nombre VARCHAR(40)
);

CREATE TABLE Region (
    regionID INT PRIMARY KEY,
    Nombre VARCHAR(40),
    paisID INT,
    FOREIGN KEY (paisID) REFERENCES Pais(paisID)
);

CREATE TABLE Ciudad (
    ciudadID INT PRIMARY KEY,
    Nombre VARCHAR(40),
    regionID INT,
    paisID INT,
    FOREIGN KEY (regionID) REFERENCES Region(regionID),
    FOREIGN KEY (paisID) REFERENCES Pais(paisID)
);

CREATE TABLE Citas (
    CitaID INT PRIMARY KEY,
    FechaHora DATETIME,
    VehiculoID INT,
    ServicioID INT,
    EmpleadoID INT,
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE Facturacion (
    FacturaID INT PRIMARY KEY auto_increment,
    Fecha DATETIME,
    ClienteID INT,
    Total VARCHAR(50),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Factura_Detalles (
    FacturaID INT,
    ReparacionID INT,
    ClienteID INT,
    Total VARCHAR(50),
    FOREIGN KEY (FacturaID) REFERENCES Facturacion(FacturaID),
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE telefono_empleado (
    telefono_empleadoID INT PRIMARY KEY,
    EmpleadoID INT,
    Tipo ENUM('Fijo', 'Movil'),
    Numero VARCHAR(20),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE telefono_cliente (
    telefono_clienteID INT PRIMARY KEY,
    ClienteID INT,
    Tipo ENUM('Fijo', 'Movil'),
    Numero VARCHAR(20),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE telefono_proveedor (
    telefono_proveedorID INT PRIMARY KEY,
    ProveedorID INT,
    Tipo ENUM('Fijo', 'Movil'),
    Numero VARCHAR(20),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

