use db_jardineria;
go

select * from cliente;
go

select * from cliente where nombre_contacto <> 'Jose';
go

select * from cliente where nombre_contacto = 'Jose';
go

--% parecido
--selecciona nombr de cliente donde nombres empieza en algo parecido a 'lui'
select nombre_contacto from cliente where nombre_contacto like 'lui%';
go

select nombre_contacto, apellido_contacto, telefono from cliente where nombre_contacto like 'lui%';
go

--lo mismo pero que termina en algo parecido a 'io'
select nombre_contacto from cliente where nombre_contacto like '%io';
go

--lo msmo, pero ahora que empieza con j
select nombre_contacto from cliente where nombre_contacto like 'j%';
go

--ahora se piedo que el nombre tenga 'co' entre medio del nombre
select nombre_contacto from cliente where nombre_contacto like '%co%';
go

-- selecciona cliente con credito mayor a 3000
select * from cliente where limite_credito >= 3000;
go

--lo mismo, pero con credito menor o igual a 3000
select * from cliente where limite_credito <= 30000;
go

-- operador logico and
select * from cliente where nombre_contacto = 'Anne' and limite_credito > 18;
go

--selecciona todo de cliente donde ciudad Miami y limite credito > 3000
select * from cliente where ciudad = 'Miami' and limite_credito > 3000;
go

-- cualquier ciudad
select * from cliente where ciudad = 'Miami' or limite_credito > 3000;
go

--algun spacio en null
select * from cliente where linea_direccion2 is null;
go

--selecciona nombre y telefono de cliente donde la linea de direccion 2 es nula
select nombre_contacto, telefono from cliente where linea_direccion2 is null;
go

--selecciona todo de cliente donde la ciudad no es san francisco
select * from cliente where not ciudad = 'San Francisco';
go
