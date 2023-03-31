-- Una empresa almacena los datos de sus empleados en una tabla llamada empleados --
-- 1.-  Eliminamos la tabla, si existe y la creamos --
drop table  empleados;
CREATE TABLE empleados (
    documento char(8) NOT NULl PRIMARY KEY,
    nombre varchar(20) DEFAULT NULL,
    apellido varchar(20) DEFAULT NULL,
    sueldo decimal(6,2) DEFAULT NULL,
    cantidadhijos int DEFAULT NULL,
    seccion varchar(20) DEFAULT NULL
);

-- 2.-Ingrese algunos registros --
insert into empleados values ("22222222","Juan","Perez","300.00",2,"Contaduria");
insert into empleados values ("22333333","Luis","Lopez","300.00",1,"Contaduria");
insert into empleados values ("22444444","Marta","Perez","500.00",1,"Sistemas");
insert into empleados values ("22555555","Susana","Garcia","400.00",2,"Secretaria");
insert into empleados values ("22666666","Jose Maria","Morales","400.00",3,"Secretaria")

-- 3.- Elimine el procedimiento llamado pa_empleados_sueldo si existe --
-- 4.- Cree un procedimiento almacenado llamado pa_empleados_sueldo que seleccione los nombres --
DELIMITER // 
Drop PROCEDURE IF EXISTS pa_empleados_sueldo//
CREATE PROCEDURE pa_empleados_sueldo
BEGIN 
    SELECT nombre FROM empleados;
END
//
-- 5.- Ejecute el procedimiento creado anteriormente--
DELIMITER // 
CALL pa_empleados_sueldo
//
-- 6.- Elimine el procedimiento llamado pa_empleados_hijos si existe --
-- 7.--Cree un procedimiento almacenado llamado pa_empleados_hijos que seleccione los nombres apellidos y cantidad de hijos de los empleados con hijos --
DELIMITER //
DROP PROCEDURE IF EXISTS pa_empleados_hijos//
CREATE PROCEDURE pa_empleados_hijos
BEGIN
    SELECT nombre, apellido, cantidadhijos FROM empleados where cantidadhijos > 0;
END 
//
-- 8.-- Ejecute el procedimiento creado anteriormente.
DELIMITER // 
CALL pa_empleados_hijos (0)
//
-- 9.-- Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el procedimiento para verificar que ahora si aparece en la lista --
DELIMITER //
DROP PROCEDURE IF EXISTS numero_hijos//
CREATE PROCEDURE numero_hijos(in nombre_empleado varchar(20), in nueva_cantidad_hijos int, in fitro_hijos int)
BEGIN
    UPDATE empleados SET cantidadhijos=nueva_cantidad_hijos where nombre=nombre_empleado and cantidadhijos > filtro_hijos;
END
//
