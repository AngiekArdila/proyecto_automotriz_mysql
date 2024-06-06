USE automotriz;

-- 1. Obtener el historial de reparaciones de un vehículo específico

Select v.placa, r.*
from vehiculos as v inner join reparaciones as r on v.VehiculoID = r.VehiculoID
where v.placa="JHK123";

-- 2. Calcular el costo total de todas las reparaciones realizadas por un empleado
-- específico en un período de tiempo

select e. nombre, sum(r.CostoTotal) As CostoTotal
from reparaciones as r inner join empleados as e on r.EmpleadoID= e.EmpleadoID
where r.fecha between '2023-02-10' and '2023-10-20' and e.nombre='John'
Group by e.nombre;
 
 -- 3. subconsultas  Obtener los proveedores que suministran las piezas más caras
 
 select * from piezas;
 select * from proveedores;
 
 select CONCAT(pro.nombre,' ',pro.apellido) as nombre_proveedor,p.nombre, p.precio 
 from proveedores as pro 
 inner join piezas as p on pro.ProveedorID=p.ProveedorID
 Where Precio = (select MAX(Precio) From Piezas);
 
 -- 3 Listar todos los clientes y los vehículos que poseen
 
 select* from clientes;
 select * from vehiculos;
 
 select c.Nombre,c.Apellido,c.Identificacion,v.placa,v.ClienteID,v.Modelo
 from clientes as c left join vehiculos as v on c.ClienteID=v.ClienteID;
 
 -- 4 Obtener la cantidad de piezas en inventario para cada pieza
 
 select* from piezas;
 select * from inventario;
 
 select i.PiezaID,p.Nombre,i.Cantidad,p.Descripcion
  from  inventario as i inner join piezas as p on i.PiezaID=p.PiezaID;
  
-- 5. Obtener las citas programadas para un día específico
 select * from citas;
 
 select citas.citaID,citas.VehiculoID from citas
 where DATE(FechaHora)='2023-06-15';
 
 -- 6. Generar una factura para un cliente específico en una fecha determinada
 select * from facturacion;
 select * from clientes;
 
 select CONCAT(c.Nombre,' ',c.Apellido) AS cliente_nombre, f. Fecha,f.Total
 from clientes as c inner join facturacion as f on c.ClienteID=f.ClienteID
 where date(f.Fecha)='2023-08-25' and (f.ClienteID=6);
 
 
 

