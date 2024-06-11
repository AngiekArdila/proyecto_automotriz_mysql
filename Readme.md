
# Consultas SQL para Gestión de Taller Mecánico

1. Obtener el historial de reparaciones de un vehículo específico
~~~mysql
SELECT v.placa, r.*
FROM vehiculos AS v 
INNER JOIN reparaciones AS r ON v.VehiculoID = r.VehiculoID
WHERE v.placa = "JHK123";

| placa  | ReparacionID | Fecha               | VehiculoID | EmpleadoID | CostoTotal | Descripcion         |
|--------|--------------|---------------------|------------|------------|------------|---------------------|
| JHK123 | 3            | 2023-02-10 00:00:00 | 3          | 3          | 100        | Battery replacement |
| JHK123 | 4            | 2023-04-15 00:00:00 | 3          | 4          | 150        | Transmission repair |

~~~

## 2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo

~~~mysql
SELECT e.nombre, SUM(r.CostoTotal) AS CostoTotal
FROM reparaciones AS r 
INNER JOIN empleados AS e ON r.EmpleadoID = e.EmpleadoID
WHERE r.fecha BETWEEN '2023-02-10' AND '2023-10-20' 
AND e.nombre = 'John'
GROUP BY e.nombre;


| nombre | CostoTotal |
|--------|------------|
| John   | 250        |
~~~
## 3. subconsultas  Obtener los proveedores que suministran las piezas más caras

~~~mysql
 select CONCAT(pro.nombre,' ',pro.apellido) as nombre_proveedor,p.nombre, p.precio 
 from proveedores as pro 
 inner join piezas as p on pro.ProveedorID=p.ProveedorID
 Where Precio = (select MAX(Precio) From Piezas);

 +------------------+---------+--------+
| nombre_proveedor | nombre  | precio |
+------------------+---------+--------+
| David Johnson    | Battery | 119.99 |
+------------------+---------+--------+
1 row in set (0.0039 sec)
~~~
## 4.Listar todos los clientes y los vehículos que poseen
 
~~~mysql 
 select c.Nombre,c.Apellido,c.Identificacion,v.placa,v.ClienteID,v.Modelo
 from clientes as c left join vehiculos as v on c.ClienteID=v.ClienteID;

 +--------+-----------+----------------+--------+-----------+---------+
| Nombre | Apellido  | Identificacion | placa  | ClienteID | Modelo  |
+--------+-----------+----------------+--------+-----------+---------+
| Carlos | Garcia    |         789456 | JHK123 |         3 | Cruze   |
| Ana    | Martinez  |         321654 | LMN456 |         4 | Altima  |
| Luis   | Lopez     |         123987 | QRS789 |         5 | Civic   |
| Maria  | Gonzalez  |         654123 | TUV012 |         6 | 320i    |
| Pedro  | Hernandez |         321098 | WXY345 |         7 | C-Class |
| Sofia  | Ramirez   |         543210 | ABC678 |         8 | Elantra |
| Miguel | Torres    |         654321 | DEF901 |         9 | Sorento |
| Lucia  | Vargas    |         987654 | GHI234 |        10 | Mazda3  |
+--------+-----------+----------------+--------+-----------+---------+
8 rows in set (0.0035 sec)
~~~
## 5 Obtener la cantidad de piezas en inventario para cada pieza
  
~~~mysql 

 select i.PiezaID,p.Nombre,i.Cantidad,p.Descripcion
  from  inventario as i inner join piezas as p on i.PiezaID=p.PiezaID;

+---------+--------------------+----------+----------------------+
| PiezaID | Nombre             | Cantidad | Descripcion          |
+---------+--------------------+----------+----------------------+
|       3 | Battery            |       10 | Car battery          |
|       4 | Transmission Fluid |      100 | Fluid for transmissi |
|       5 | Wheel              |      150 | Car wheel            |
|       6 | Engine Oil         |       50 | Oil for engine       |
|       7 | Air Filter         |       75 | Filter for air condi |
|       8 | Suspension Spring  |      125 | Spring for suspensio |
|       9 | Exhaust Pipe       |      175 | Pipe for exhaust sys |
|      10 | Fuel Pump          |      200 | Pump for fuel system |
|      10 | Fuel Pump          |      180 | Pump for fuel system |
+---------+--------------------+----------+----------------------+
9 rows in set (0.0011 sec)
  
~~~ 
## 6. Obtener las citas programadas para un día específico

 ~~~mysql 
 select citas.citaID,citas.VehiculoID from citas
 where DATE(FechaHora)='2023-06-15';
 +--------+------------+
| citaID | VehiculoID |
+--------+------------+
|      3 |          3 |
+--------+------------+
1 row in set (0.0005 sec)
 ~~~
 ## 7. Listar todas las órdenes de compra y sus detalles
  ~~~mysql 
  select oc. OrdenID as ordenescompra ,od.*
  from ordenes_compra as oc inner join orden_detalles as od 
  on oc.OrdenID=od.OrdenID;

  +---------------+---------+---------+----------+--------+-----------+
| ordenescompra | OrdenID | PiezaID | Cantidad | Precio | ClienteID |
+---------------+---------+---------+----------+--------+-----------+
|             3 |       3 |       3 |      100 | 599.95 |         3 |
|             4 |       4 |       4 |        2 | 39.98  |         4 |
|             5 |       5 |       5 |        4 | 319.96 |         5 |
|             6 |       6 |       6 |        3 | 119.97 |         6 |
|             7 |       7 |       7 |        6 | 89.94  |         7 |
|             8 |       8 |       8 |        7 | 279.93 |         8 |
|             9 |       9 |       9 |        8 | 399.92 |         9 |
|            10 |      10 |      10 |        9 | 809.91 |        10 |
+---------------+---------+---------+----------+--------+-----------+
8 rows in set (0.0019 sec)
~~~
## 8 Obtener el costo total de piezas utilizadas en una reparación específica
   ~~~mysql  
  select p.Nombre,sum(p.Precio*R.Cantidad) as costototal,r.Cantidad,r.ReparacionID
  from piezas as p inner join reparacion_piezas as r 
  on p.PiezaID=r.PiezaID 
  where p.nombre='Exhaust Pipe';

  +--------------+-------------------+----------+--------------+
| Nombre       | costototal        | Cantidad | ReparacionID |
+--------------+-------------------+----------+--------------+
| Exhaust Pipe | 399.9200134277344 |        8 |            9 |
+--------------+-------------------+----------+--------------+
1 row in set (0.0007 sec)
  ~~~
## 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
## menor que un umbral)
 ~~~mysql 
select p.Nombre,p.Descripcion,i.Cantidad as cantidad_existente,(250-i.cantidad) as faltantes_necesito_reabastecer
from piezas as p inner join inventario as i 
on p.PiezaID=i.PiezaID
where i.cantidad<250;

+--------------------+----------------------+--------------------+--------------------------------+
| Nombre             | Descripcion          | cantidad_existente | faltantes_necesito_reabastecer |
+--------------------+----------------------+--------------------+--------------------------------+
| Battery            | Car battery          |                 10 |                            240 |
| Transmission Fluid | Fluid for transmissi |                100 |                            150 |
| Wheel              | Car wheel            |                150 |                            100 |
| Engine Oil         | Oil for engine       |                 50 |                            200 |
| Air Filter         | Filter for air condi |                 75 |                            175 |
| Suspension Spring  | Spring for suspensio |                125 |                            125 |
| Exhaust Pipe       | Pipe for exhaust sys |                175 |                             75 |
| Fuel Pump          | Pump for fuel system |                200 |                             50 |
| Fuel Pump          | Pump for fuel system |                180 |                             70 |
+--------------------+----------------------+--------------------+--------------------------------+
9 rows in set (0.0016 sec)
~~~
## 10. Obtener la lista de servicios más solicitados en un período específico
~~~mysql 
Select
s.Tipo as servicio,COUNT(c.ServicioID) as cantidad_solicitada
From citas AS c
Inner join servicios as s
on c.ServicioID = s.ServicioID
where c.FechaHora between '2023-06-15' and '2023-09-10'
group by s.Tipo;

+---------------------+---------------------+
| servicio            | cantidad_solicitada |
+---------------------+---------------------+
| Battery Replacement |                   1 |
| Brake Replacement   |                   1 |
+---------------------+---------------------+
2 rows in set (0.0022 sec)
~~~
## 11. Obtener el costo total de reparaciones para cada cliente en un período
## específico

~~~mysql 

select CONCAT(c.nombre,' ',c.apellido) as nombre_cliente,sum(r.CostoTotal) as sumatoria ,v.placa
from reparaciones as r 
inner join vehiculos as v on r.VehiculoID=v.VehiculoID
inner join clientes as c on v.ClienteID=c.ClienteID
where r.Fecha between '2023-02-10' and '2023-10-30'
GROUP BY c.ClienteID, nombre_cliente, v.placa
ORDER BY nombre_cliente ASC;

+-----------------+-----------+--------+
| nombre_cliente  | sumatoria | placa  |
+-----------------+-----------+--------+
| Ana Martinez    |       150 | LMN456 |
| Carlos Garcia   |       100 | JHK123 |
| Luis Lopez      |       200 | QRS789 |
| Maria Gonzalez  |       250 | TUV012 |
| Pedro Hernandez |       300 | WXY345 |
+-----------------+-----------+--------+
5 rows in set (0.0010 sec)
~~~

## 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
## período específico

~~~mysql 
 
 select e.Nombre,e.apellido,r.fecha,r.descripcion, COUNT(e.EmpleadoID) as cantidad_dereparaciones 
 from empleados as e inner join reparaciones as r 
 on e.EmpleadoID=r.EmpleadoID 
 where r.fecha between '2023-02-10' and "2024-04-15"
 group by e.EmpleadoID, e.Nombre
 order by cantidad_dereparaciones DESC;

                                       ->  order by cantidad_dereparaciones DESC;
+--------+-----------+---------------------+-------------------------+-------------------------+
| Nombre | apellido  | fecha               | descripcion             | cantidad_dereparaciones |
+--------+-----------+---------------------+-------------------------+-------------------------+
| John   | Hernandez | 2023-08-25 00:00:00 | Engine repair           |                       1 |
| Peter  | Robinson  | 2023-04-15 00:00:00 | Transmission repair     |                       1 |
| Chris  | Martinez  | 2024-02-10 00:00:00 | Exhaust system repair   |                       1 |
| Sandra | Lopez     | 2023-10-30 00:00:00 | Air conditioning repair |                       1 |
| Linda  | Garcia    | 2023-06-20 00:00:00 | Wheel alignment         |                       1 |
| Laura  | Martinez  | 2023-02-10 00:00:00 | Battery replacement     |                       1 |
| Anna   | Smith     | 2024-04-15 00:00:00 | Fuel pump replacement   |                       1 |
| Henry  | Gonzalez  | 2023-12-05 00:00:00 | Suspension repair       |                       1 |
+--------+-----------+---------------------+-------------------------+-------------------------+
8 rows in set (0.0055 sec)
 ~~~
 ## 13. Obtener las piezas más utilizadas en reparaciones durante un período
##  específico
~~~mysql 

SELECT p.Nombre, COUNT(rp.PiezaID) AS conteo
FROM reparaciones AS r
INNER JOIN reparacion_piezas AS rp ON r.ReparacionID = rp.ReparacionID
INNER JOIN piezas AS p ON rp.PiezaID = p.PiezaID
WHERE r.fecha BETWEEN '2023-02-10' AND '2023-08-25'
GROUP BY p.Nombre, rp.PiezaID
ORDER BY conteo DESC;

+--------------------+--------+
| Nombre             | conteo |
+--------------------+--------+
| Battery            |      2 |
| Transmission Fluid |      1 |
| Engine Oil         |      1 |
+--------------------+--------+
3 rows in set (0.0004 sec)
~~~
## 14. Calcular el promedio de costo de reparaciones por vehículo

 ~~~mysql 
 select v.vehiculoID,avg(r.CostoTotal)as costopromedioreparaciones
 from vehiculos as v inner join reparaciones as r 
 on v.VehiculoID=r.VehiculoID
 group by v.vehiculoID
 order by v.vehiculoID;

+------------+---------------------------+
| vehiculoID | costopromedioreparaciones |
+------------+---------------------------+
|          3 |                       100 |
|          4 |                       150 |
|          5 |                       200 |
|          6 |                       250 |
|          7 |                       300 |
|          8 |                       350 |
|          9 |                       400 |
|         10 |                       450 |
+------------+---------------------------+
8 rows in set (0.0022 sec)
~~~
## 15. Obtener el inventario de piezas por proveedor


~~~mysql 
select pi.Nombre as pieza ,sum(i.cantidad) as inventario_piezas,p.Nombre as nombre_proveedor
from inventario as i 
inner join piezas as pi on i.PiezaID=pi.PiezaID
inner join proveedores as p on pi.ProveedorID=p.ProveedorID
group by p.Nombre
order by p.proveedorID;

+--------------------+-------------------+------------------+
| pieza              | inventario_piezas | nombre_proveedor |
+--------------------+-------------------+------------------+
| Battery            |                10 | David            |
| Transmission Fluid |               100 | Laura            |
| Wheel              |               150 | Daniel           |
| Engine Oil         |                50 | Emily            |
| Air Filter         |                75 | Matthew          |
| Suspension Spring  |               125 | Olivia           |
| Exhaust Pipe       |               175 | James            |
| Fuel Pump          |               380 | Sophia           |
+--------------------+-------------------+------------------+
8 rows in set (0.0009 sec)
~~~

## 16. Listar los clientes que no han realizado reparaciones en el último año
~~~mysql 
select v.placa,r.Fecha,CONCAT(c.Nombre,' ',c.apellido) as nombrecliente
from reparaciones as r 
inner join vehiculos as v on r.VehiculoID=v.VehiculoID
inner join clientes as c on v.ClienteID=c.ClienteID
where r.fecha not between '2023-02-10' and '2023-06-20' or r.fecha is null;

+--------+---------------------+-----------------+
| placa  | Fecha               | nombrecliente   |
+--------+---------------------+-----------------+
| TUV012 | 2023-08-25 00:00:00 | Maria Gonzalez  |
| WXY345 | 2023-10-30 00:00:00 | Pedro Hernandez |
| ABC678 | 2023-12-05 00:00:00 | Sofia Ramirez   |
| DEF901 | 2024-02-10 00:00:00 | Miguel Torres   |
| GHI234 | 2024-04-15 00:00:00 | Lucia Vargas    |
+--------+---------------------+-----------------+
5 rows in set (0.0005 sec)
~~~
## 17. Obtener las ganancias totales del taller en un período específico

~~~mysql 
SELECT SUM(f.Total) AS ganancias_totales
FROM reparaciones AS r
INNER JOIN factura_detalles AS f ON r.ReparacionID = f.ReparacionID
WHERE r.fecha BETWEEN '2023-02-10' AND '2023-08-25';

+-------------------+
| ganancias_totales |
+-------------------+
|               700 |
+-------------------+
1 row in set (0.0006 sec)

~~~
## 19. Obtener el listado de servicios prestados por cada empleado en un período
## específico
~~~mysql
select e.Nombre, e.Apellido, c.FechaHora,s.Tipo
from empleados as e 
inner join citas as c on e.EmpleadoId=c.EmpleadoId
inner join servicios as s on c.ServicioID=s.ServicioID
where month(c.FechaHora)=06;

+--------+----------+---------------------+-------------------+
| Nombre | Apellido | FechaHora           | Tipo              |
+--------+----------+---------------------+-------------------+
| Laura  | Martinez | 2023-06-15 11:00:00 | Brake Replacement |
+--------+----------+---------------------+-------------------+
1 row in set (0.0006 sec)

~~~
## Subconsultas
## 1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
~~~mysql 
 
SELECT c.Nombre,c.Apellido,
SUM(r.CostoTotal) AS Total_Gastado
FROM clientes c JOIN vehiculos v ON c.ClienteID = v.ClienteID
JOIN reparaciones r ON v.VehiculoID = r.VehiculoID
WHERE YEAR(r.Fecha) = YEAR(CURRENT_DATE() - INTERVAL 1 YEAR)
GROUP BY c.ClienteID
ORDER BY Total_Gastado DESC
LIMIT 1;

+--------+----------+---------------+
| Nombre | Apellido | Total_Gastado |
+--------+----------+---------------+
| Sofia  | Ramirez  |           350 |
+--------+----------+---------------+
1 row in set (0.0014 sec)
~~~
## 2. Obtener la pieza más utilizada en reparaciones durante el último mes

~~~mysql 
select r.Fecha,r.ReparacionID,rp.Cantidad as cantidad ,p.Nombre,p.PiezaID
from reparaciones as r 
inner join reparacion_piezas as rp on r.ReparacionID=rp.ReparacionID
inner join piezas as p on rp.PiezaID=p.PiezaID
where month(r.Fecha)=month(current_date()-interval 1 month)
group by p.piezaID,P.Nombre
order by max(rp.cantidad) desc
limit 1;

~~~

 ## 3. Obtener los proveedores que suministran las piezas más caras

~~~mysql 
select p.Nombre as nombre_pieza,p.Precio,pr.ProveedorID,CONCAT(pr.nombre,' ',pr.Apellido) as nombre_proveedor,pr.Email
from piezas as p inner join proveedores as pr on p.ProveedorID=pr.ProveedorID
where p.precio= ( select max(p.precio) from piezas);

+--------------------+--------+-------------+------------------+----------------------------+
| nombre_pieza       | Precio | ProveedorID | nombre_proveedor | Email                      |
+--------------------+--------+-------------+------------------+----------------------------+
| Battery            | 119.99 |           3 | David Johnson    | david.johnson@example.com  |
| Transmission Fluid |  19.99 |           4 | Laura Williams   | laura.williams@example.com |
| Wheel              |  79.99 |           5 | Daniel Brown     | daniel.brown@example.com   |
| Engine Oil         |   9.99 |           6 | Emily Jones      | emily.jones@example.com    |
| Air Filter         |  14.99 |           7 | Matthew Davis    | matthew.davis@example.com  |
| Suspension Spring  |  39.99 |           8 | Olivia Miller    | olivia.miller@example.com  |
| Exhaust Pipe       |  49.99 |           9 | James Wilson     | james.wilson@example.com   |
| Fuel Pump          |  89.99 |          10 | Sophia Moore     | sophia.moore@example.com   |
+--------------------+--------+-------------+------------------+----------------------------+
~~~
## 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año 
~~~mysql 

SELECT r.ReparacionID,r.Fecha 
FROM reparaciones AS r 
LEFT JOIN reparacion_piezas AS rp ON r.ReparacionID = rp.ReparacionID
WHERE rp.ReparacionID IS not null and rp.PiezaID !=10
AND YEAR(r.Fecha) = YEAR(CURRENT_DATE() - INTERVAL 1 YEAR);

+--------------+---------------------+
| ReparacionID | Fecha               |
+--------------+---------------------+
|            3 | 2023-02-10 00:00:00 |
|            4 | 2023-04-15 00:00:00 |
|            5 | 2023-06-20 00:00:00 |
|            6 | 2023-08-25 00:00:00 |
|            7 | 2023-10-30 00:00:00 |
|            8 | 2023-12-05 00:00:00 |
+--------------+---------------------+
6 rows in set (0.0005 sec)
~~~

## 5 Obtener las piezas que están en inventario por debajo del 10% del stock inicial 

~~~mysql 

SELECT p.PiezaID, p.Nombre, i.Cantidad AS cantidad_actual, od.Cantidad AS cantidad_inicial
FROM inventario i
JOIN piezas p ON i.PiezaID = p.PiezaID
JOIN orden_detalles od ON p.PiezaID = od.PiezaID
WHERE i.Cantidad < od.Cantidad * 0.10
ORDER BY p.PiezaID;
~~~


----------------------
-- PROCEDIMIENTOS-----
----------------------
## 1. Crear un procedimiento almacenado para insertar una nueva reparación. 
## 
DELIMITER $$
CREATE PROCEDURE insertar_reparacion(
    IN i_Fecha DATETIME,
    IN i_VehiculoID INT,
    IN i_EmpleadoID INT,
    IN i_CostoTotal DOUBLE,
    IN i_Descripcion VARCHAR(50))
BEGIN 
    INSERT INTO Reparaciones (Fecha, VehiculoID, EmpleadoID, CostoTotal, Descripcion) 
    VALUES (i_Fecha, i_VehiculoID, i_EmpleadoID, i_CostoTotal, i_Descripcion);
END $$
DELIMITER ;

CALL insertar_reparacion('2024-11-23 00:00:00', 4, 4, 400, 'Exhaust system repair');
Query OK, 1 row affected (0.0033 sec)

## 2.Crear un procedimiento almacenado para actualizar el inventario de una pieza.

DELIMITER $$

CREATE PROCEDURE actualizar_inventario_pieza (
    IN P_PiezaID INT,
    IN P_Cantidad INT,
    IN P_ZonaID INT
)
BEGIN
    DECLARE existing_count INT;
	DECLARE msg VARCHAR(255);

    SELECT COUNT(*) INTO existing_count 
    FROM Inventario 
    WHERE PiezaID = P_PiezaID AND ZonaID = P_ZonaID;
    
    IF existing_count > 0 THEN
        UPDATE Inventario 
        SET Cantidad = Cantidad + P_Cantidad 
        WHERE PiezaID = P_PiezaID AND ZonaID = P_ZonaID;
    ELSE
        INSERT INTO Inventario (PiezaID, Cantidad, ZonaID)  
        VALUES (P_PiezaID, P_Cantidad, P_ZonaID);
    END IF;
END$$
DELIMITER ;

CALL actualizar_inventario_pieza(10, 90, 1);

SELECT * FROM  inventario;

## 3.Crear un procedimiento almacenado para eliminar una cita 

DELIMITER $$

CREATE PROCEDURE eliminarcita(
    IN p_fechahora DATETIME,
    IN p_VehiculoID INT
)
BEGIN 
    DECLARE conteoCount INT;
    SELECT COUNT(*) INTO conteoCount 
    FROM citas 
    WHERE FechaHora = p_fechahora AND VehiculoID = p_VehiculoID;

    IF conteoCount > 0 THEN
        SELECT * FROM citas 
        WHERE FechaHora = p_fechahora AND VehiculoID = p_VehiculoID;

        DELETE FROM citas
        WHERE FechaHora = p_fechahora AND VehiculoID = p_VehiculoID;
    ELSE
        SELECT 'La cita con el ID especificado no fue encontrada.';
    END IF;
END $$

DELIMITER ;
call eliminarcita('2023-08-20 10:30:00',5);
select * from citas;


 ## 4 consulta una factura 

DELIMITER $$

CREATE PROCEDURE ConsultarFacturamejorada(
    IN p_facturaID INT,
    IN p_ClienteID INT
)
BEGIN
    DECLARE facturaCount INT;

    SELECT COUNT(*) INTO facturaCount
    FROM Facturacion
    WHERE FacturaID = p_facturaID AND ClienteID = p_ClienteID;

    IF facturaCount > 0 THEN
        SELECT * FROM Facturacion
        WHERE FacturaID = p_facturaID AND ClienteID = p_ClienteID;
    ELSE
        SELECT 'La factura no fue encontrada.' AS Mensaje;
    END IF;
END $$

DELIMITER ;
select * from facturacion;

call ConsultarFacturamejorada(5,5);
 
## 5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo 

Delimiter $$ 

create procedure historial_reparaciones(
      in p_VehiculoID int
      )
      
	BEGIN
    DECLARE reparaCount INT;

    SELECT COUNT(*) INTO reparaCount
    FROM reparaciones
    WHERE vehiculoID = p_vehiculoID; 
    
    
    IF reparaCount > 0 THEN
        SELECT * FROM reparaciones
        WHERE VehiculoID = p_VehiculoID;
    ELSE
        SELECT 'El vehiculo no fue encontrada.' AS Mensaje;
    END IF;
END $$

Delimiter ;

select * from reparaciones;

call historial_reparaciones(4);

## 6. Crear un procedimiento almacenado para calcular el costo total de reparaciones de un cliente en un período 
select * from clientes;
select * from reparaciones;
DELIMITER $$

CREATE PROCEDURE CalcularCostoTotalReparaciones(
    IN p_ClienteID INT,
    IN p_FechaInicio DATE,
    IN p_FechaFin DATE
)
BEGIN
    DECLARE costoTotal DOUBLE;

    SELECT SUM(r.CostoTotal) INTO costoTotal
    FROM Reparaciones r
    JOIN Vehiculos v ON r.VehiculoID = v.VehiculoID
    WHERE v.ClienteID = p_ClienteID
    AND r.Fecha BETWEEN p_FechaInicio AND p_FechaFin;

    IF costoTotal IS NULL THEN
        SElECT  'costoTotal fue 0';
    END IF;
  SELECT costoTotal AS CostoTotalReparaciones;
END $$

DELIMITER ;

call CalcularCostoTotalReparaciones();

 
