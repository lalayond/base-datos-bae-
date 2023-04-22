--- Se crea una base de datos ---
CREATE TABLE persona(
      ID_VARCHAR(10) NOT NULL PRIMARY KEY,
      NOMBRE VARCHAR(50) NOT NULL,
      SALARIO_BASE INT,
      SUBSIDIO FLOAT,
      SALUD FLOAT,
      PENSION FLOAT,
      BONO FLOAT,
      INTEGRAL FLOAT);


--- Se crea 10 registros ---

insert into persona values(1, 'Laura', 1000, NULL, NULL, NULL, NULL, NULL),
insert into persona values(2, 'Antonio', 1500, NULL, NULL, NULL, NULL, NULL),
insert into persona values(3, 'Lucas', 1000, NULL, NULL, NULL, NULL, NULL),
insert into persona values(4, 'Pablo', 1500, NULL, NULL, NULL, NULL, NULL),
insert into persona values(5, 'Richard', 1000, NULL, NULL, NULL, NULL, NULL),
insert into persona values(6, 'Pepe', 1500, NULL, NULL, NULL, NULL, NULL),
insert into persona values(7, 'Pepa', 1000, NULL, NULL, NULL, NULL, NULL),
insert into persona values(8, 'Lola', 1500, NULL, NULL, NULL, NULL, NULL),
insert into persona values(9, 'Alejandro', 1500, NULL, NULL, NULL, NULL, NULL),
insert into persona values(10, 'Leonardo', 1000,NULL, NULL, NULL, NULL, NULL),


--- Cree una función para cada punto teniendo en cuenta que: ---

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_datos//
CREATE PROCEDURE insertar_datos(
  IN DNI VARCHAR(10),
  IN NOMBRE VARCHAR(50))
BEGIN
  INSERT INTO persona AS p
  (p.dni,p.nombre,p.apellido1,p.apellido2,p.peso,p.sexo)
  VALUES
  (DNI,NOMBRE,APELLIDO1,APELLIDO2,PESO,SEXO);
END
//

--- Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla--

DELIMITER //
DROP FUNCTION IF EXISTS subsidio_transporte//
CREATE FUNCTION subsidio_transporte(id_persona VARCHAR(40))
 RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (SELECT salario_base FROM persona
             WHERE id = id_persona) * 0.07;
END
//

--- Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla ---

DELIMITER //
DROP FUNCTION IF EXISTS salud //
CREATE FUNCTION salud (id_persona VARCHAR(40))
RETURNS FLOAT 
DETERMINISTIC 
BEGIN
RETURN (SELECT salario_base 
        FROM persona WHERE id = id_persona) * 0.04;
END 
//

--- Funcion pension La pension que corresponde al 8% al salario
 
 DELIMITER // 
 DROP FUNCTION IS EXISTS pension //
 CREATE FUNCTION pension (id_persona VARCHAR (40))
 RETURNS FLOAT
 DETERMINISTIC
BEGIN
    RETURN (SELECT salario_base FROM persona 
            WHERE id = id_persona) * 0.08;
END
//            
