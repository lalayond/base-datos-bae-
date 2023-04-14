
--- Creación de la table personas --
create table persona(
    id  VARCHAR(50) primary key,
    nombre VARCHAR(50) ,
    apellido1 VARCHAR(50) ,
    apellido2 VARCHAR(50),
    peso int,
    sexo ENUM('H', 'M')
);

--Realizar insert en la tabla--
insert into persona values('11111111A', 'Pepe', 'Perez', 'Hernández', 81, 'H');
insert into persona values('22222222A', 'Juan', 'Hernández', 'Perez', 50, 'H');
insert into persona values('33333333A', 'Maria', 'Domínguez', 'Perez', 95, 'M');
insert into persona values('44444444B', 'Pepa', 'Rodriguez', 'Alayón', 63, 'M');
insert into persona values('55555555B', 'Jan', 'Lopez', 'Alayón', 99, 'H');
insert into persona values('66666666B', 'Norberto', 'Domínguez', 'Rodriguez', 72, 'H');
insert into persona values('77777777B', 'Laura', 'Alayón', 'Ramos', 32, 'M');
insert into persona values('88888888B', 'Pedro', 'Rodriguez', 'Ramos', 73, 'H');
insert into persona values('99999999C', 'Lauranio', 'Perez', 'Hernández', 65, 'H');
insert into persona values('10101010C', 'Paula', 'Alonso', 'Fuentes', 86, 'M');

--- 1. Insertar información en la tabla "personas" --
DELIMITER //
DROP PROCEDURE IF EXISTS info_personas //
CREATE PROCEDURE info_personas(in nuevo_id VARCHAR(50), in nuevo_nombre VARCHAR(50), in nuevo_apellido1 VARCHAR(50), 
                               in nuevo_apellido2 VARCHAR(50), in nuevo_peso int, in nuevo_sexo VARCHAR(50))
BEGIN   
    insert into persona values(nuevo_id, nuevo_nombre, nuevo_apellido1, nuevo_apellido2, nuevo_peso, nuevo_sexo);
END 
//

--- 2. Actualizar el nombre e id de un cliente --
DELIMITER //
DROP TABLE IF EXISTS cambiar_nombre //
CREATE PROCEDURE cambiar_nombre(in nuevo_id VARCHAR(50), in nuevo_nombre VARCHAR(50))
BEGIN 
    update persona set id = nuevo_id;
    update persona set nombre = nuevo_nombre;
END
//

--- 3. Eliminar un cliente --
DELIMITER //
DROP PROCEDURE IF EXISTS suprimir_cliente //
CREATE PROCEDURE suprimir_cliente(in id_suprimir VARCHAR(10))
BEGIN
    delete from persona where id = id_suprimir;
END
//

--- 4 Intenta realizar uno o varios procedimientos con paramentaros de salida. --
DELIMITER //
DROP PROCEDURE IF EXISTS  peso_obtenido //
CREATE PROCEDURE peso_obtenido(in nombre_persona varchar(10), out altura_obtenido)
BEGIN
    set peso_obtenido = (
        select peso from persona 
        where nombre = nombre_persona
    );
END
//


--- 5 Intenta realizar uno o varios procedimientos con un ciclo (while) --
DELIMITER // 
DROP PROCEDURE IF EXISTS insertar_personas //
CREATE PROCEDURE insertar_personas( in numero_de_personas)
BEGIN
    DECLARE clave varchar(9); 
    DECLARE numero INT;
    SET numero = 1;
    while numero < numero_de_personas do
        SET clave = CONCAT('000000', numero);
        insert into persona values(clave, 'Pepe', 'Perez', 'Hernández', 81, 'H');
        SET numero = numero +1;
    end while;
END
//
