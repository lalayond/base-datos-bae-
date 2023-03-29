
CREATE TABLE cientifico (
    id varchar(10) PRIMARY KEY,
    nombre varchar(20), 
    apellido1 varchar(20), 
    apellido2 varchar(20)   
);

CREATE TABLE proyecto(
    id varchar(10) PRIMARY KEY,
    nombre varchar(30), 
    horas int
);

CREATE TABLE cientifico_proyecto (
    ref_cientifico varchar(10) references  cientifico(id),
    ref_proyecto varchar(10) references proyecto(id),
    horas int
);


INSERT INTO cientifico VALUES ("1","Laura","Alayón","Domínguez");
INSERT INTO cientifico VALUES ("2","Pepe","Hernández","Domínguez");
INSERT INTO cientifico VALUES ("3","Pepa","Domínguez","Alayón");
INSERT INTO cientifico VALUES ("4","Samuel","Alonso","Alayón");
INSERT INTO cientifico VALUES ("5","Antonio","Diaz","Perez");

INSERT INTO proyecto VALUES ("1","SALA1",200);
INSERT INTO proyecto VALUES ("2","SALA2",300);

INSERT INTO cientifico_proyecto VALUES ("1","1",100);
INSERT INTO cientifico_proyecto VALUES ("2","2",200);
INSERT INTO cientifico_proyecto VALUES ("3","1",100);
INSERT INTO cientifico_proyecto VALUES ("4","2",200);
INSERT INTO cientifico_proyecto VALUES ("5","1",100);

DELIMITER //
CREATE PROCEDURE obtener_datos
BEGIN
    SELECT c.*, p.* FROM cientifico as c join cientifico_proyecto as cp on cp.ref_cientifico=c.id join proyecto as p on p.id=cp.ref_proyecto;
END
//

DELIMITER //
CREATE PROCEDURE obtener_numero_proyectos
BEGIN 
    SELECT count(ref_proyecto) FROM cientifico_proyecto GROUP BY ref_cientifico;
END 
//

DELIMITER //
CREATE PROCEDURE obtener_numero_cientificos
BEGIN
    SELECT cp.ref_proyecto, p.nombre, count(cp.ref_cientifico),cp.ref_proyecto, p.nombre FROM proyecto as p join cientifico_proyecto as cp on cp.ref_proyecto=p.id GROUP BY cp.ref_proyecto;
END
//
DELIMITER //
CREATE PROCEDURE obtener_horas_cientificos
BEGIN
    SELECT c.id, c.nombre, p.horas from proyecto as p join cientifico_proyecto as cp on p.id=cp.ref_proyecto join cientifico as c on c.id=cp.ref_cientifico group by ref_cientifico;
END
//

DELIMITER //
CREATE PROCEDURE obtener_dni_nombre_cientificos(in horas_min int)
BEGIN
    SELECT c.* FROM cientifico as c join cientifico_proyecto as cp on c.id=cp.ref_cientifico join proyecto as p on cp.ref_proyecto=p.id group by cp.ref_cientifico having count(ref_proyecto) > 1 and sum(cp.horas) > horas_min;
END 
//
