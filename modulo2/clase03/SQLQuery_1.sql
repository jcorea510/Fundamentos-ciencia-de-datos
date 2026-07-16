--JUSTIN JAFFETH COREA MASIS
--creation of database
CREATE DATABASE clase1
GO

--switch from master database to clase1 database
USE clase1
GO

--define a new table called usuario and its fields
CREATE TABLE usuario(
    id INT,             --int data type  
    direc VARCHAR(10),  --string
    tel INT
)
GO

--define a second table called product
CREATE TABLE produc(
    id INT  NOT NULL,               --not null indicates that field cannot be missing
    nombre VARCHAR(20) NOT NULL,
    precio INT NOT NULL
)
GO

--insert values to the product table
INSERT INTO produc(id, nombre, precio)
VALUES 
    (1, 'Monitor 24"', 150000),
    (2, 'Teclado Mecánico', 45000),
    (3, 'Mouse Gamer', 25000),
    (4, 'Auriculares', 60000),
    (5, 'Pad Mouse XL', 12000);
GO

INSERT INTO produc
VALUES(6, 'Laptop', 1000000);
GO

--selectr data(*) from product table
SELECT *FROM produc
GO

--USE master;
--GO

--ALTER DATABASE [clase1] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--GO
--DROP DATABASE [clase1];
--GO
