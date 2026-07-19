--TRABAJO DE CLASE 04 MODULO 2 CIENCIA DE DATOS
--JUSTIN JAFFETH COREA MASIS

--creacion de tabla alumno
CREATE TABLE alumno(
    dni INT PRIMARY KEY NOT NULL, --llave primaria
    --verifica que dni no tenga mas de 9 digitos
    CONSTRAINT nine_digit_limit CHECK (dni BETWEEN 100000000 AND 800000000),
    nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(15) NOT NULL,
    carrera VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);
GO
--creacion de tabla asignatura
CREATE TABLE asignatura(
    codigo INT PRIMARY KEY NOT NULL, --llave primaria
    nombre VARCHAR(50) NOT NULL,
    profesor VARCHAR(30) NOT NULL,
    semestre INT NOT NULL,
    --verifica que semestre sea entre 0 y 10
    CONSTRAINT until_10_limit CHECK (semestre BETWEEN 0 AND 10),
    carrera VARCHAR(100) NOT NULL
);
GO
--creacion de tabla matricula
CREATE TABLE matricula (
    dni_alumno INT NOT NULL,
    codigo_asignatura INT NOT NULL,
    calificacion INT NOT NULL,
    --verifica que calificacion este entre 0 y 100
    CONSTRAINT until_100_limit CHECK (calificacion BETWEEN 0 AND 100),
    periodo DATE NOT NULL,
    PRIMARY KEY (dni_alumno, codigo_asignatura) --llave primaria compuesta
);
GO
