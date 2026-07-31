
use db_jardineria;
go

--selecciona empleados que no tiene jefe
select nombre, apellido1, codigo_jefe
from empleado
where codigo_jefe is null;
go

--selecciona pedidos que aun no han sido entregados
select codigo_pedido fecha_pedido, fecha_entrega
from pedido
where fecha_entrega is null;
go

--selecciona clientes sin limite de credito
select nombre_cliente, limite_credito
from cliente
where limite_credito is not null;
go

--selecciona oficinas que tienen segunda dirección
select ciudad, linea_direccion2
from oficina
where linea_direccion2 is not null;
go

--reemplazar valores null con COALESCE
--COALESCE sirve para mostrar otro valor
--mostrar 'Sin región' cuado la region es null
select nombre_cliente,
    coalesce(region, 'Sin región') as region
from cliente;
go

--mostrar "No tiene jefe" cuando el empleado no tenga jefe
select 
    nombre,
    apellido1,
    coalesce(cast(codigo_jefe as varchar), 'No tiene jefe') as jefe
from empleado;
go

