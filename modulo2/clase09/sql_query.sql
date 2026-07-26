--JUSTIN JAFFETH COREA MASIS
--MODULO 2 CIENCIA DE DATOS

--usa base de datos jardinera
use db_jardineria;
go

--cuanta todos los valores para todos atributos de la tabla cliente
--y lo nombre como total_clientes 
select count(*) as total_clientes from cliente;
go

-- cuanta la elementos en columna de limite credito de la tabla cliente
-- y le da nimbre cliente_con_credito al resultado 
select count(limite_credito) as cliente_con_credito from cliente;
go

--realiza una suma de todos los limite_credito de la tabla cliente
select sum(limite_credito) as gato_mayor from cliente;
go

--calcula el promedio de limite_credio de la tabla cliente
select avg(limite_credito) as promedio_credito from cliente;
go

select avg(cantidad_en_stock) as promedio_stock from producto;
go

select min(limite_credito) as credito_minio from cliente;
go

--calcula el minimo precio de proveedor de la tabla producto
--y llama como proveedor_precio_minimo al resultado
select min(precio_proveedor) as proveedor_precio_minimo from producto;
go


select min(precio_venta) as venta_precio_minimo from producto;
go

--selecciona el maximo limite de credito de la tabla cliente
--y le da el nombre max_limite_credito al resultado
select max(limite_credito) as max_limite_credito from cliente;
go

--selecciona max, min, avg y suma de limite credito de tabla cliente
select 
max(limite_credito) as max_limite_credito,
min(limite_credito) as min_limite_credito,
avg(limite_credito) as avg_limite_credito,
sum(limite_credito) as sum_limite_credito
from cliente;
go

--selecciona codigo cliente y total de pedidos de tabla pedido
--pero agrupado por codigo cliente que tenga mas de 5 pedidos
select codigo_cliente,
count(*)
as total_pedido
from pedido
group by codigo_cliente having count(*) >= 5;
go


--selecciona gama y avg precio de tabla producto
--para cada gama que tenga un avg precio mayor a 10
select gama,
avg(precio_venta)
as promedio_precio
from producto
group by gama having avg(precio_venta) > 10;
go

--selecciona codigo_pedido y suma de total de productos
--por codigo de pedido tal que el total de productos sea mayor a 100
select codigo_pedido,
sum(cantidad) as total_productos
from detalle_pedido
group by codigo_pedido having sum(cantidad) > 100;
go

--une la tabla cliente y pedido de forma que
--codigo cliente de tabla cliente sea igual a codigo cliente
--de tabla pedido, y de la tabla selecciona nombre cliente, codigo
--de pedido y fecha de pedido
select 
c.nombre_cliente,
p.codigo_pedido,
p.fecha_pedido
from cliente c
inner join pedido p
on c.codigo_cliente = p.codigo_cliente;
go

--une la tabla cliente y tabla pedido con codigo de pedido =  codigo cliente,
--une el resultado con tabla detalle pedido donde codigo_pedido coincida en ambas tablas
--une el resultado con tabla producto donde codigo de producto coincida.
--de la tabla resultante selecciona nombre cliente, codigo pedido, nombre de producto
--y cantidad de producto
select 
c.nombre_cliente,
p.codigo_pedido,
pr.nombre as producto,
dp.cantidad
from cliente c
inner join pedido p on c.codigo_pedido = p.codigo_cliente
inner join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
inner join producto pr on dp.codigo_producto = pr.codigo_producto;
go

select c.nombre_cliente, p.codigo_pedido
from cliente c left join pedido p
on c.codigo_cliente = p.codigo_cliente;
go

--une tabla producot a la derecha con tabla pedido tal que coincida el codigo de producto
--une el resultado a la derecha con tabla pedido donde coincida el codigo de pedido
--del resultado selecciona el codigo de codigo de pedido, el nombre de producto y la cantidad de pedido
select
	p.codigo_pedido,
	pr.nombre,
	dp.cantidad
from producto dp
right join detalle pedido dp
on pr.codigo_producto = dp.codigo_producto
right join pedido p
on dp.codigo_pedido = p.codigo_pedido;
go

