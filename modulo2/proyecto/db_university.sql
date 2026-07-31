--create base de datos para project. Se llama db_university
--create database for project. It is called db_univertity
create database db_university;
go

--use db_university para ejecturar las siquientes sentencias
--uses db_university to execute next queries
use db_university;
go

--crea la tabla estudiante
--create table student
create table student(
	--llave primaria int en el rango (-/+ 2,147,483,647)
	--Decidí usar int para almacenar datos de estudiantes 
	--de muchos años atras

    --primary key int in range (-/+ 2,147,483,647)
    -- I decided to use int to store data of all students
	--from many years before
    id int primary key,
    fname varchar(30) not null,
    lname varchar(30) not null,
    career_id tinyint not null,
    campus_id tinyint not null,
    phone varchar(15),
    addr varchar(100),
    mail varchar(50) not null
);
go

--crea tabla courso
--create table course
create table course(
	--llave primaria smallint en rango (-32,768 to 32,767)
	--Habrá muchos cursos porque ellos se identifican no solo 
	--por el nombre, sino también por el profesor que lo imparte

    --primary key smallint in range (-32,768 to 32,767)
    --There is going to be many courses because they are identified 
	--not only by its name, but by professor who teaches too
    id smallint primary key,
    course_name varchar(50) not null,
    semester tinyint not null,
    career_id tinyint not null,
    professor_id tinyint not null
);
go

--crea tabla de profesor
--create table for professors
create table professor(
	--llave primaria en rango (0, 255)
	--selecciné tinyint porque no habrá muchos profesores

    --primary key int in range (0, 255)
    --I select tinyint because there are not many professors.
    --255 it's a lot 
    id tinyint primary key,
    fname varchar(30) not null,
    lname varchar(30) not null,
    career_id tinyint not null,
    campus_id tinyint,
    phone varchar(15),
    mail varchar(50) not null,
    addr varchar(100),
);
go

--crea tabla de notas
--create table for grades
create table grade(
    student_id int not null,
    course_id smallint not null,
    calification decimal(5, 2) not null,
    course_period date not null,
	--la llave primaria compuesta hace posible
	--para un estudiante registrar notas para muchos
	--cursos que este/esta lleva,
	--ademas incluye el periodo así es posible
	--incluir notas de cursos repetidos
    
    --this composed primary key made possible
    --for a student to have a calification
    --for many courses as him/her course
    --also it is important to include the course period 
    --so that it is possible to include retaken courses
    constraint pk_grade 
        primary key (student_id, course_id, course_period)
);
go

--crea tabla para carreras
--create table for oferred careers
create table career(
    id tinyint primary key,
	--bit 1 indica que la carrera está acreditada
	--bit 0 indica que la carrera no está acreditada

    --bit 1 indicates that this career has been accredited
    --bit 0 indicates that this career has not been accredited
    accredited bit not null,
    career_name varchar(50) not null,
    degree nchar(10) not null,

	--esto restringe la carrera a algún grado académico
	--a alguno de la siguiente lista de opciones

    --this constraint the career to a some degree
    --in the next list of possible options
    constraint chk_grade_name
        check (degree in ('Bachelor', 'Licenciate', 'Master', 'Doctor'))
);
go


--cra tabla de campus
--create table for currently operating campus
create table campus(
    id tinyint primary key,
    --forces campus to be only one of the next posibilities
    campus_name nchar(10) not null,
    constraint chk_campus_name
        check (campus_name in ('Cartago', 'San Carlos', 'Alajuela', 'Limon', 'San Jose'))
);
go

-- I asked Gemini AI to generate this data
-- ============================================================================
-- 1. CAMPUS (Lookup table)
-- ============================================================================
insert into campus (id, campus_name)
values
    (1, 'Cartago'),
    (2, 'San Carlos'),
    (3, 'Alajuela'),
    (4, 'Limon'),
    (5, 'San Jose');
go

-- ============================================================================
-- 2. CAREER (Lookup table)
-- ============================================================================
insert into career (id, accredited, career_name, degree)
values
    (1, 1, 'Ingeniería Electrónica', 'Licenciate'),
    (2, 1, 'Ingeniería en Computación', 'Licenciate'),
    (3, 1, 'Ingeniería Mecatrónica', 'Licenciate'),
    (4, 1, 'Ingeniería Industrial', 'Licenciate'),
    (5, 0, 'Administración de Empresas', 'Bachelor'),
    (6, 1, 'Maestría en Dispositivo Médico', 'Master'),
    (7,  1, 'Ingeniería en Materiales', 'Licenciate'),
    (8,  1, 'Ingeniería Ambiental', 'Licenciate'),
    (9,  1, 'Ingeniería en Biotecnología', 'Licenciate'),
    (10, 1, 'Ingeniería en Construcción', 'Licenciate'),
    (11, 1, 'Ingeniería en Seguridad Laboral', 'Licenciate'),
    (12, 1, 'Ingeniería Agrícola', 'Licenciate'),
    (13, 0, 'Ingeniería en Computadores', 'Licenciate'),
    (14, 0, 'Ingeniería Física', 'Licenciate'),
    (15, 1, 'Maestría en Electrónica', 'Master'),
    (16, 1, 'Doctorado en Ciencias Naturales', 'Doctor');
go

-- ============================================================================
-- 3. PROFESSOR
-- ============================================================================
insert into professor (id, fname, lname, career_id, campus_id, phone, mail, addr)
values 
    (1, 'Carlos', 'Solano', 1, 1, '+506 2550-2101', 'csolano@itcr.ac.cr', 'Cartago, Central, 300m Norte de la Catedral'),
    (2, 'María', 'Fernández', 2, 1, '+506 2550-2204', 'mfernandez@itcr.ac.cr', 'San José, Montes de Oca, San Pedro'),
    (3, 'Roberto', 'Mora', 1, 1, '+506 2550-2108', 'rmora@itcr.ac.cr', 'Cartago, Paraíso, Llanos de Santa Lucía'),
    (4, 'Ana', 'Rojas', 3, 2, '+506 2401-3015', 'arojas@itcr.ac.cr', 'Alajuela, San Carlos, Ciudad Quesada'),
    (5, 'Esteban', 'Chaves', 4, 1, '+506 2550-2310', 'echaves@itcr.ac.cr', 'Cartago, La Unión, Tres Ríos'),
    (6, 'Lucía', 'Vargas', 2, 3, '+506 2430-1122', 'lvargas@itcr.ac.cr', 'Alajuela, Centro, Barrio San José'),
    (7,  'Alfonso', 'González', 1, 1, '+506 2550-2109', 'agonzalez@itcr.ac.cr', 'Cartago, Paraíso, Orosi'),
    (8,  'Laura', 'Sanabria', 2, 1, '+506 2550-2210', 'lsanabria@itcr.ac.cr', 'Heredia, Barva, San Pablo'),
    (9,  'Jorge', 'Monestel', 3, 1, '+506 2550-2115', 'jmonestel@itcr.ac.cr', 'San José, Moravia, San Vincente'),
    (10, 'Silvia', 'Villalobos', 7, 1, '+506 2550-2401', 'svillalobos@itcr.ac.cr', 'Cartago, Central, Dulce Nombre'),
    (11, 'Kattia', 'Barahona', 8, 1, '+506 2550-2412', 'kbarahona@itcr.ac.cr', 'Cartago, La Unión, Concepción'),
    (12, 'Federico', 'Soto', 9, 1, '+506 2550-2500', 'fsoto@itcr.ac.cr', 'San José, Montes de Oca, Sabanilla'),
    (13, 'Randall', 'Solís', 10, 1, '+506 2550-2604', 'rsolis@itcr.ac.cr', 'Cartago, El Guarco, San Isidro'),
    (14, 'Adriana', 'Cascante', 13, 1, '+506 2550-2250', 'acascante@itcr.ac.cr', 'San José, Tibás, San Juan'),
    (15, 'Hernán', 'Madrigal', 4, 3, '+506 2430-1150', 'hmadrigal@itcr.ac.cr', 'Alajuela, Central, La Guácima'),
    (16, 'Gloriana', 'Pérez', 2, 5, '+506 2257-0102', 'gperez@itcr.ac.cr', 'San José, Escazú, San Rafael'),
    (17, 'Minor', 'Gutiérrez', 1, 4, '+506 2758-0044', 'mgutierrez@itcr.ac.cr', 'Limón, Central, Barrio Bella Vista'),
    (18, 'Beatriz', 'Cerdas', 11, 1, '+506 2550-2710', 'bcerdas@itcr.ac.cr', 'Cartago, Oreamuno, Cot');
go -- ============================================================================
-- 4. COURSE
-- ============================================================================
insert into course (id, course_name, semester, career_id, professor_id)
values
    (101, 'Circuitos Eléctricos I', 3, 1, 1),
    (102, 'Sistemas Digitales', 4, 1, 3),
    (103, 'Microcontroladores', 5, 1, 1),
    (201, 'Programación Orientada a Objetos', 2, 2, 2),
    (202, 'Estructuras de Datos', 3, 2, 6),
    (301, 'Robótica Industrial', 7, 3, 4),
    (401, 'Control de Calidad', 6, 4, 5),
    -- Electronic Engineering Courses
    (104, 'Circuitos Eléctricos II', 4, 1, 7),
    (105, 'Sistemas de Control', 6, 1, 3),
    (106, 'Electrónica de Potencia', 7, 1, 1),
    (107, 'Procesamiento Digital de Señales', 8, 1, 17),
    -- Computer Engineering Courses
    (203, 'Bases de Datos', 4, 2, 8),
    (204, 'Sistemas Operativos', 5, 2, 2),
    (205, 'Redes de Computadores', 6, 2, 16),
    (206, 'Ingeniería de Software', 7, 2, 6),
    -- Computer Hardware Engineering Courses
    (251, 'Arquitectura de Computadores', 5, 13, 14),
    (252, 'Sistemas Empotrados', 7, 13, 14),
    -- Mechatronics & Materials
    (302, 'Diseño Mecatrónico', 8, 3, 9),
    (303, 'Sensores y Actuadores', 6, 3, 9),
    (351, 'Ciencia de los Materiales', 3, 7, 10),
    (352, 'Transformación de polímeros', 6, 7, 10),
    -- Environmental & Biotechnology
    (451, 'Química Ambiental', 3, 8, 11),
    (501, 'Biología Celular y Molecular', 2, 9, 12),
    (502, 'Genética Molecular', 5, 9, 12),
    -- Construction & Safety
    (551, 'Mecánica de Suelos', 5, 10, 13),
    (601, 'Higiene Industrial I', 4, 11, 18);
go

-- ============================================================================
-- 5. STUDENT
-- ============================================================================
insert into student(id, fname, lname, career_id, campus_id, phone, addr, mail)
values 
    (202100101, 'Diego', 'Araya', 1, 1, '+506 8812-3456', 'Cartago, Oriental, Barrio Asís', 'daraya@estudiantec.cr'),
    (202100102, 'Valeria', 'Jiménez', 1, 1, '+506 8765-4321', 'Cartago, Oreamuno, San Rafael', 'vjimenez@estudiantec.cr'),
    (202200201, 'Gabriel', 'Castro', 2, 1, '+506 8341-9988', 'San José, Curridabat, Granadilla', 'gcastro@estudiantec.cr'),
    (202200202, 'Sofiía', 'Monge', 2, 3, '+506 8520-1144', 'Alajuela, Central, El Cano', 'smonge@estudiantec.cr'),
    (202300301, 'Alejandro', 'Quirós', 3, 2, '+506 8933-7722', 'Alajuela, San Carlos, Florencia', 'aquiros@estudiantec.cr'),
    (202300401, 'Mariana', 'Brenes', 4, 1, '+506 8410-6655', 'Cartago, El Guarco, Tejar', 'mbrenes@estudiantec.cr'),
    -- Cartago Campus Students
    (202100103, 'José Pablo', 'Gómez', 1, 1, '+506 8833-2211', 'Cartago, Paraíso, Birrisito', 'jpgomez@estudiantec.cr'),
    (202100104, 'Fiorella', 'Ureña', 1, 1, '+506 8711-9900', 'Cartago, Central, Carmen', 'furena@estudiantec.cr'),
    (202200105, 'Esteban', 'Chinchilla', 1, 1, '+506 8654-3210', 'San José, Desamparados, San Miguel', 'echinchilla@estudiantec.cr'),
    (202200203, 'Kevin', 'Montero', 2, 1, '+506 8922-1133', 'Cartago, La Unión, Tres Ríos', 'kmontero@estudiantec.cr'),
    (202300204, 'Mónica', 'Calvo', 2, 1, '+506 8388-7744', 'San José, Coronado, San Isidro', 'mcalvo@estudiantec.cr'),
    (202300205, 'Daniela', 'Obando', 2, 1, '+506 8455-6611', 'Heredia, Central, San Francisco', 'dobando@estudiantec.cr'),
    (202200302, 'Javier', 'Sánchez', 3, 1, '+506 8899-0011', 'San José, Goicoechea, Guadalupe', 'jsanchez@estudiantec.cr'),
    (202300303, 'Sebastián', 'Vargas', 3, 1, '+506 8733-4455', 'Cartago, El Guarco, Tobosi', 'svargas@estudiantec.cr'),
    (202100701, 'Camila', 'Navarro', 7, 1, '+506 8311-2244', 'Cartago, Oreamuno, Pacayas', 'cnavarro@estudiantec.cr'),
    (202200801, 'Andrés', 'Mora', 8, 1, '+506 8566-7788', 'San José, Tibás, Cinco Esquinas', 'amora@estudiantec.cr'),
    (202300901, 'Jimena', 'Cordero', 9, 1, '+506 8944-5566', 'Heredia, Santo Domingo, Santa Rosa', 'jcordero@estudiantec.cr'),
    (202201001, 'Felipe', 'Aguilar', 10, 1, '+506 8822-6633', 'Cartago, Central, Guadalupe', 'faguilar@estudiantec.cr'),
    (202301301, 'Ignacio', 'Zúñiga', 13, 1, '+506 8788-9922', 'San José, Escazú, San Antonio', 'izuniga@estudiantec.cr'),
    
    -- San Carlos Campus Students
    (202200206, 'Paula', 'Centeno', 2, 2, '+506 8611-3355', 'Alajuela, San Carlos, Fortuna', 'pcenteno@estudiantec.cr'),
    (202300304, 'Tomás', 'Zamora', 3, 2, '+506 8544-1122', 'Alajuela, San Carlos, Aguas Zarcas', 'tzamora@estudiantec.cr'),
    
    -- Alajuela Campus Students
    (202200207, 'Adrián', 'Alvarado', 2, 3, '+506 8377-4411', 'Alajuela, Central, Desamparados', 'aalvarado@estudiantec.cr'),
    (202300402, 'Natalia', 'Pacheco', 4, 3, '+506 8855-2200', 'Alajuela, Grecia, San Roque', 'npacheco@estudiantec.cr'),
    
    -- Limón Campus Students
    (202200106, 'Kendall', 'Campbell', 1, 4, '+506 8911-8844', 'Limón, Central, Cieneguita', 'kcampbell@estudiantec.cr'),
    (202300208, 'Shakira', 'Brown', 2, 4, '+506 8422-3399', 'Limón, Siquirres, Pacuarito', 'sbrown@estudiantec.cr'),
    
    -- San José Campus Students
    (202200209, 'Gabriel', 'Villalobos', 2, 5, '+506 8700-1122', 'San José, Central, Barrio Escalante', 'gvillalobos@estudiantec.cr'),
    (202300501, 'Luciana', 'Madrigal', 5, 5, '+506 8366-9911', 'San José, Santa Ana, Pozos', 'lmadrigal@estudiantec.cr');
go

-- ============================================================================
-- 6. GRADE
-- ============================================================================
insert into grade(student_id, course_id, calification, course_period)
values
    (202100101, 101, 80.50, '2024-02-15'),
    (202100101, 102, 90.20, '2024-07-20'),
    (202100102, 101, 70.80, '2024-02-15'),
    (202100102, 103, 90.50, '2025-02-15'),
    (202200201, 201, 80.90, '2024-02-15'),
    (202200201, 202, 90.10, '2024-07-20'),
    (202200202, 201, 70.50, '2024-02-15'),
    (202300301, 301, 80.85, '2025-02-15'),
    (202300401, 401, 90.00, '2024-07-20'),
    -- Electronics Grades
    (202100103, 101, 70.00, '2023-02-15'),
    (202100103, 104, 60.25, '2023-07-20'),
    (202100103, 105, 40.80, '2024-02-15'),
    (202100104, 101, 90.10, '2023-02-15'),
    (202100104, 104, 90.40, '2023-07-20'),
    (202100104, 106, 64.60, '2024-07-20'),
    (202200105, 101, 61.75, '2023-07-20'),
    (202200105, 101, 73.00, '2024-02-15'), -- retaken course
    (202201006, 107, 66.90, '2025-02-15'),

    -- Computer Engineering & Hardware Grades
    (202200203, 201, 80.70, '2023-02-15'),
    (202200203, 202, 90.00, '2023-07-20'),
    (202200203, 203, 21.30, '2024-02-15'),
    (202200203, 204, 10.50, '2024-07-20'),
    (202300204, 201, 0.00, '2023-07-20'),
    (202300204, 202, 57.00, '2024-02-15'),
    (202300205, 201, 70.20, '2023-07-20'),
    (202300205, 203, 80.10, '2024-07-20'),
    (202301301, 251, 80.40, '2024-02-15'),
    (202301301, 252, 90.10, '2025-02-15'),

    -- Mechatronics & Materials Grades
    (202200302, 301, 80.60, '2024-02-15'),
    (202200302, 303, 80.90, '2024-07-20'),
    (202300303, 303, 70.80, '2024-07-20'),
    (202100701, 351, 90.00, '2022-07-20'),
    (202100701, 352, 60.75, '2023-07-20'),

    -- Environmental, Biotech, Construction & Safety Grades
    (202200801, 451, 60.30, '2023-07-20'),
    (202300901, 501, 90.20, '2023-07-20'),
    (202300901, 502, 90.50, '2024-07-20'),
    (202201001, 551, 70.90, '2024-02-15'),

    -- Regional Campuses Grades
    (202200206, 201, 60.80, '2023-02-15'),
    (202300304, 301, 50.15, '2024-02-15'),
    (202200207, 201, 50.60, '2023-02-15'),
    (202300402, 401, 79.10, '2024-07-20'),
    (202200106, 101, 74.00, '2023-07-20'),
    (202300208, 201, 63.45, '2024-02-15'),
    (202200209, 205, 65.20, '2024-07-20');
go

--select everything from tables
--campus, career, course, grade, professor and student
select * from campus;
go
select * from career;
go
select * from course;
go
select * from grade;
go
select * from professor;
go
select * from student;
go

--select only id, fname, lname and mail
--for students that started to study in 2022 (id starts in 2022)
select id, fname, lname, mail
from student
where cast(id as varchar) like '2022%';
go

--select id, fname and lname of students
--that studies in Cartago (campus id = 1)
select id, fname, lname
from student
where campus_id = 1;
go

--select all information from careers
--that are accredited and their degree is Licenciate 
select * from career
where accredited = 1 and degree = 'Licenciate';
go

--select id, last name, first name and career id
--from students by ordering the student id
select id, lname, fname, career_id from student
order by id;
go

--select the student id, course period and calification
--for registered grades 
--but ordered by course period and calification
--both in descendent order
select student_id, course_period, calification
from grade
order by course_period desc, calification desc;
go

--select distinct (unique) values
-- for course name and career id from courses table
select distinct course_name, career_id
from course
go

--select only the top 5 student from registered grades
--from year 2024 with the higher calification
--in any courses
select top 5 student_id, course_id calification, course_period
from grade
where year(course_period) = 2024
order by calification desc;
go

--select students, calificaton and period
--for registered grades from year 2023 to 2024
--that got scores between 70 and 100 in any course
select student_id, calification, course_period
from grade
where (year(course_period) = 2024 or year(course_period) = 2023)
and calification between 70 and 100;
go


--select students, calificaton and period
--for registered grades from year 2023 to 2024
--that got scores below 70 
select student_id, calification, course_period
from grade
where (year(course_period) = 2024 or year(course_period) = 2023)
and calification not between 70 and 100;
go


--select unique course that takes
--place in semester 5, 6 or 7 in the career plan
select distinct id, course_name, career_id, semester
from course
where semester in (5, 6, 7);
go

--select student that studies either
--Ingeniería Electrónica
--Ingeniería en Computadoras
--Ingeniería Mecatronica
--Ingeniería en Computación
select id, lname, fname, career_id
from student
where career_id in (1, 2, 3, 13);
go

--select all campus
select * from campus
where campus_name is not null;

--select all professor fist name, last name and mail
--for those that have registered an address
select fname, lname, mail
from professor
where addr is null;
go

--select career, fist name, last name and campus
--of all professors, but grouped by career id,
--campus, first name and last name
select career_id, fname, lname, campus_id
from professor
group by career_id, campus_id, fname, lname;
go

--select campus that have 10 or more 
--professor that teaches there
select count(*) as prof_count
from professor
group by campus_id
having count(*) >= 10;
go

--select course id, average calification
--max calification and minimum calification 
--for registered grades and those which
--min calificatin is higher than 65 
--(all students approved the course)
select
course_id, 
avg(calification) as avg_calification,
max(calification) as max_calification,
min (calification) as min_calification
from grade
group by course_id
having min(calification) >= 65;
go

--select course id, num of students, avg calification
--max calification and minimun calification
--for registered grades when the average
--calification is less than 65
--(how many students struggle to pass the  and their grades range)
select
course_id,
count(calification) as num_students,
avg(calification) as avg_calification,
max(calification) as max_calification,
min (calification) as min_calification
from grade
group by course_id
having avg(calification) < 65;
go

--select the number of accredited careers by degree,
--that the univerisity offered,
--if there is more than one accredited career by degree
select 
degree, count(accredited) as num_of_accredited_careers
from career
where accredited = 1
group by degree
having count(accredited) > 1
go

--select count of careers, number of accredited careers
--number of non accredited careers and avg of accredited careers
--by degree that the university offers.
select 
degree,
count_careers,
num_accredited,
num_non_accredited,
num_accredited / count_careers as avg_accredited
from (
    select degree,
    count (*) as count_careers,
    sum(cast(accredited as float)) as num_accredited,
    count (*) - sum(cast(accredited as float)) as num_non_accredited
    from career
    group by degree
)
as sub_query;
go

--select the career id and professor count of professor in each career
--the ordered by professors per career in descendent order
select 
    career_id,
    professors_per_career
from (
    select
        career_id,
        count(*) as professors_per_career
    from professor
    group by career_id
) as sub_query
order by professors_per_career desc;
go

--select data from a table
--that joins info from tables of
--students, careers and campus
select 
    s.id,
    s.fname,
    s.lname,
    c.career_name,
    cmp.campus_name,
    s.mail
from student as s
left join career as c
on s.career_id = c.id
inner join campus as cmp
on s.campus_id = cmp.id
go

--select studen name,
--career name and calification
--for all students and all courses each student
--took in 2024 and that are from Ingeniería Electrónica
--then sort the data by last name and first name
select 
s.lname,
s.fname,
ca.career_name,
co.course_name,
g.calification,
g.course_period
from grade as g
right join student as s
on g.student_id = s.id
left join course as co
on g.course_id = co.id
inner join career as ca
on s.career_id = ca.id
where year(g.course_period) = 2024
and career_name = 'Ingeniería Electrónica'
order by lname, fname;
go

--create a view of offered courses
create view OfferedCourses as
select 
co.id,
co.course_name,
p.lname,
p.fname,
ca.campus_name
from course as co
left join professor as p
on co.professor_id = p.id
inner join campus as ca
on p.campus_id = ca.id;
go

--select course name and campus of offered courses
select
course_name,
campus_name
from OfferedCourses;
go

--create a view with data from active professors
--that contains name, career, campus, phone, mail and address
create view CurrentProfessors as
select 
p.lname,
p.fname,
ca.career_name,
cmp.campus_name,
p.phone,
p.mail,
p.addr
from professor as p
left join campus as cmp
on p.campus_id = cmp.id
inner join career as ca
on p.career_id = ca.id;
go

--from the view of active professors
--select name, mail, phone and address
--for those professors that teach in Cartago's campus
select 
lname,
fname,
mail,
phone,
addr
from CurrentProfessors
where campus_name = 'Cartago'
order by lname, fname;
go

--create a view for registered grades in 2024
--that contains student id, studen name,
--course id, course name and calification
create view Grades2024 as
select
s.id as student_id,
s.lname,
s.fname,
co.id as course_id,
co.course_name,
ca.calification,
ca.course_period
from grade as ca
right join student as s
on ca.student_id = s.id
inner join course as co
on co.id = ca.course_id
where year(ca.course_period) = 2024;
go


--from registered notes in 2024
--calculate max calification,
--min calificatio and average calification
--per course 
--and the remove those which standar deviation is null
--and sort by average calification in ascendant order
--(less average calification at topp)
--finally select only the top 5 courses
--(courses in which students get the worst grades)
select top 5 
course_name,
max(calification) as max_calification,
min(calification) as min_calification,
avg(calification) as avg_calification,
STDEV(calification) as std_calification
from Grades2024
group by course_name
having STDEV(calification) is not null
order by avg_calification;
go
