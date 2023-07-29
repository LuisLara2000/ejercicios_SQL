use escuela;

Create table Alumno(
	matricula_a int,
	nombre varchar(80) not null,
	edad tinyInt not null,
	semestre tinyInt not null,
	genero varchar(1) not null,
	clave_c int not null,
	PRIMARY KEY (matricula_a),
	FOREIGN KEY (clave_c) references Carrera(clave_c)
);

Create table Carrera(
	clave_c int not null,
	nombre varchar(80) not null,
    duraccion tinyInt not null
);

Create table Alumno(
	matricula_a int,
	nombre varchar(80) not null,
	edad tinyInt not null,
	semestre tinyInt not null,
	genero varchar(1) not null,
	clave_c int not null,
	PRIMARY KEY (matricula_a),
	FOREIGN KEY (clave_c) references Carrera(clave_c)
);

Create table Materia(
	clave_m int not null,
    nombre varchar(80) not null,
    creditos tinyInt not null,
    PRIMARY KEY (clave_m)
);

Create table Alumno_Materia(
	clave_m int not null,
    matricula_a int not null,
    FOREIGN KEY (clave_m) references Materia(clave_m),
    FOREIGN KEY (matricula_a) references Alumno(matricula_a)
);


Create table Profesor_Materia(
	clave_m int not null,
    clave_p int not null,
	FOREIGN KEY (clave_m) references Materia(clave_m),
    FOREIGN KEY (clave_p) references Profesor(clave_p)
);

Create table Alumno_Profesor(
	matricula_a int not null,
    clave_p int not null,
    FOREIGN KEY (matricula_a) references Alumno(matricula_a),
    FOREIGN KEY (clave_p) references Profesor(clave_p)
);

SELECT * FROM escuela.carrera;
INSERT INTO `escuela`.`carrera` (`clave_c`, `nombre`, `duraccion`) VALUES ('2001', 'lcc', '9');
INSERT INTO `escuela`.`carrera` (`clave_c`, `nombre`, `duraccion`) VALUES ('2002', 'lsti', '12');
INSERT INTO `escuela`.`carrera` (`clave_c`, `nombre`, `duraccion`) VALUES ('2003', 'lmad', '10');

SELECT * FROM escuela.alumno;
INSERT INTO `escuela`.`alumno` (`matricula_a`, `nombre`, `edad`, `semestre`, `genero`, `clave_c`) VALUES ('1803042', 'luis', '21', '4', 'M', '2000');
INSERT INTO `escuela`.`alumno` (`matricula_a`, `nombre`, `edad`, `semestre`, `genero`, `clave_c`) VALUES ('1803045', 'javier', '19', '3', 'M', '2000');
INSERT INTO `escuela`.`alumno` (`matricula_a`, `nombre`, `edad`, `semestre`, `genero`, `clave_c`) VALUES ('1803046', 'samuel', '22', '9', 'M', '2003');
INSERT INTO `escuela`.`alumno` (`matricula_a`, `nombre`, `edad`, `semestre`, `genero`, `clave_c`) VALUES ('1803047', 'pedro', '17', '1', 'M', '2001');

SELECT * FROM escuela.materia;
INSERT INTO `escuela`.`materia` (`clave_m`, `nombre`, `creditos`) VALUES ('1000', 'español', '2');
INSERT INTO `escuela`.`materia` (`clave_m`, `nombre`, `creditos`) VALUES ('1001', 'matematicas', '6');

SELECT * FROM escuela.profesor;
INSERT INTO `escuela`.`profesor` (`clave_p`, `nombre`, `direccion`, `telefono`, `horario`) VALUES ('1', 'jose', 'calle san martin', '89562314', 'lunes a viernes');
INSERT INTO `escuela`.`profesor` (`clave_p`, `nombre`, `direccion`, `telefono`, `horario`) VALUES ('2', 'pepe', 'calle san rey', '87542136', 'lunes, martes y viernes');

SELECT * FROM escuela.alumno_profesor;
INSERT INTO `escuela`.`alumno_profesor` (`matricula_a`,`clave_p`) VALUES ('1803042', '1');
INSERT INTO `escuela`.`alumno_profesor` (`matricula_a`,`clave_p`) VALUES ('1803042', '2');
INSERT INTO `escuela`.`alumno_profesor` (`matricula_a`,`clave_p`) VALUES ('1803045', '1');

SELECT * FROM escuela.alumno_materia;
INSERT INTO `escuela`.`alumno_materia` (`clave_m`,`matricula_a`) VALUES ('1000', '1803042');
INSERT INTO `escuela`.`alumno_materia` (`clave_m`,`matricula_a`) VALUES ('1001', '1803042');
INSERT INTO `escuela`.`alumno_materia` (`clave_m`,`matricula_a`) VALUES ('1000', '1803045');
INSERT INTO `escuela`.`alumno_materia` (`clave_m`,`matricula_a`) VALUES ('1001', '1803045');

SELECT * FROM escuela.profesor_materia;
INSERT INTO `escuela`.`alumno_profesor` (`clave_m`,`clave_p`) VALUES ('1000', '1');
INSERT INTO `escuela`.`alumno_profesor` (`clave_m`,`clave_p`) VALUES ('1000', '2');
INSERT INTO `escuela`.`alumno_profesor` (`clave_m`,`clave_p`) VALUES ('1001', '2');

SELECT * FROM escuela.alumno;
UPDATE `escuela`.`alumno` SET `nombre` = 'Luis' WHERE (`matricula_a` = '1803042');
UPDATE `escuela`.`alumno` SET `nombre` = 'Javier' WHERE (`matricula_a` = '1803046');
UPDATE `escuela`.`alumno` SET `nombre` = 'Samuel' WHERE (`matricula_a` = '1803046');
UPDATE `escuela`.`alumno` SET `nombre` = 'Pedro' WHERE (`matricula_a` = '1803047');

SELECT * FROM escuela.alumno;
ALTER TABLE escuela.alumno ALTER COLUMN [nombre] VARCHAR(80);

SELECT * FROM escuela.alumno;
INSERT INTO `escuela`.`alumno` (`matricula_a`, `nombre`, `edad`, `semestre`, `genero`, `clave_c`) VALUES ('1803049', 'Raul', '20', '6', 'M', '2000');
DELETE FROM `escuela`.`alumno` WHERE (`matricula_a` = '1803049');