use db_jardineria
go


CREATE VIEW total_pagos_cliente
AS
SELECT codigo_cliente,
       SUM(total) AS total_pagado
FROM pago
GROUP BY codigo_cliente;

DROP VIEW total_pagos_cliente;

CREATE VIEW productos_caros 
AS
SELECT nombre, precio_venta
FROM producto
WHERE precio_venta > 100;
go

SELECT * FROM productos_caros;


CREATE VIEW vista_cliente 
AS
SELECT nombre_cliente, ciudad, pais
FROM cliente;


SELECT * FROM vista_cliente;