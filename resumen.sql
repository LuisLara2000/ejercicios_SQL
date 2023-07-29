-- ┌───────────────────────────────────────────────────────────────────────────┐ 
-- │ Crear las tablas que permiten obtener el resultado de la tabla de muestra │ 
-- └───────────────────────────────────────────────────────────────────────────┘ 

create database Escuela;

use Escuela;

create table carreras(
	matricula_id int not null,
	carrera_id int not null,
    carrera varchar(42) not null
); 

create table alumnos(
	matricula_id int primary key not null,
    nombre_alumno varchar(40),
    direccion varchar(30),
    telefono int,
    fecha_nacimineto date
); 

insert into carreras (matricula_id,carrera_id,carrera) values (123,100,'Lic en Ciencia Computacionales');
insert into carreras (matricula_id,carrera_id,carrera) values (119,101,'Lic en Seguridad Informatica');
insert into carreras (matricula_id,carrera_id,carrera) values (124,102,'Lic en Actuaria');
insert into carreras (matricula_id,carrera_id,carrera) values (120,103,'Lic en Multimedia y Animacion Digital');
insert into carreras (matricula_id,carrera_id,carrera) values (121,104,'Lic en Fisica');
insert into carreras (matricula_id,carrera_id,carrera) values (122,105,'Lic en Matematicas');
insert into carreras (matricula_id,carrera_id,carrera) values (127,100,'Lic en Ciencia Computacionales');
insert into carreras (matricula_id,carrera_id,carrera) values (128,101,'Lic en Seguridad Informatica');
insert into carreras (matricula_id,carrera_id,carrera) values (129,103,'Lic en Multimedia y Animacion Digital');
insert into carreras (matricula_id,carrera_id,carrera) values (130,100,'Lic en Ciencia Computacionales');

insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (123,'Juan Pérez','Calle 1 Col 1 Cd 1'    ,81128181,'1998-10-10');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (124,'Luis López ','Calle 2 Col 2 Cd 2'   ,81865182,'1999-09-10');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (120,'Luis Javier ','Calle 2 Col 5 Cd 2'  ,81987182,'1998-09-09');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (121,'Samuel Roberto','Calle 8 Col 1 Cd 5',81988712,'2001-08-01');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (122,'Karel Antonia','Calle 9 Col 9 Cd 2' ,86545682,'1999-07-03');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (119,'Evelin Sofia','Calle 2 Col 4 Cd 2'  ,86345682,'2001-06-11');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (127,'Edna Morón','Calle 3 Col 3 Cd 9'    ,81818183,'2001-09-12');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (128,'Edna Ivana','Calle 7 Col 7 Cd 9'    ,81878783,'2000-01-12');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (129,'Juan Francisco','Calle 9 Col 7 Cd 2',81786883,'2001-08-12');
insert into alumnos (matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto) values (130,'Fernanda Sara','Calle 9 Col 3 Cd 2' ,81414183,'1999-12-12');

-- Hacemos una consulta para que quede como en el ejemplo --
select alumnos.matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto,carrera_id,carrera 
from alumnos 
inner join carreras 
on carreras.matricula_id=alumnos.matricula_id;

-- ┌─────────────────────────────────────────────────────────────────────────────────────┐ 
-- │  Dejar una tabla virtual, para que el usuario solo pueda trabajar con las columnas  │
-- │  de: Matrícula_id, Nombre Alumno, Edad, Carrera 									 │ 
-- └─────────────────────────────────────────────────────────────────────────────────────┘ 

create view vista_alumnos 
as
select alumnos.matricula_id,nombre_alumno,year(curdate())-year(fecha_nacimineto) as edad ,carrera 
from  alumnos 
inner join carreras 
on carreras.matricula_id=alumnos.matricula_id;

-- Hacemos una consulta para comprobar que esta correcto --
select * from vista_alumnos;

-- ┌────────────────────────────────────────────────────────────────────────────┐ 
-- │  Crear un procedimiento que arroje los datos del alumno que cumpla con la  │
-- │  matrícula proporcionada.									                │ 
-- └────────────────────────────────────────────────────────────────────────────┘ 

delimiter //
	create PROCEDURE info_alumno (mat int) 
	begin 
        select alumnos.matricula_id,nombre_alumno,direccion,telefono,fecha_nacimineto,carrera_id,carrera 
        from alumnos 
        inner join carreras 
        on carreras.matricula_id=alumnos.matricula_id
        where alumnos.matricula_id = mat;
	end;	
//

-- Lamamos al procedimiento --
call escuela.info_alumno(127);

-- ┌──────────────────────────────────────────────────────────────────────┐ 
-- │  Sobre la tabla virtual, obtener la cantidad de alumnos por carrera  │ 
-- └──────────────────────────────────────────────────────────────────────┘
    
select vista_alumnos.carrera ,count(carrera) as cantidad_alumnos 
from vista_alumnos 
group by carrera
order by cantidad_alumnos desc;
