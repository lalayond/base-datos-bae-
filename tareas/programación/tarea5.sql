--- Se crea una base de datos ---
Crear tabla Salario(
 identificador int not null primary key,
 nombre varchar(20) not null,
 salario_base int not null
);

--- Insertar varios datos ---
insertar en valores salariales(1, 'Laura', 1000);
insertar en valores salariales(2, 'Antonio', 1500);
insertar en valores salariales(3, 'Lucas', 1000);
insertar en valores salariales(4, 'Pablo', 1500);
insertar en valores salariales(5, 'Ricardo', 1200);
insertar en valores salariales(6, 'Pepe', 1500);
insertar en valores salariales(7, 'Pepa', 1000);
insertar en valores salariales(8, 'Lola', 1500);
insertar en valores salariales(9, 'Alejandro', 1250);
insertar en valores salariales(10, 'Leonardo', 1000);


--- 1. Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico ---
DELIMITER //
DROP FUNCTION IF EXISTS subsidio_transporte//
CREATE FUNCTION subsidio_transporte(id_persona VARCHAR(50)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (SELECT salario_base FROM persona WHERE id = id_persona) * 0.07;
END
//

--- Tambien se puede hacer así  --
DELIMITER //
DROP FUNCTION IF EXISTS subsidio_transporte//
CREATE FUNCTION subsidio_transporte(id_persona VARCHAR(50)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (SELECT salario_base FROM persona WHERE id = id_persona) * 0.07;
END
//


--- 2. Función salud: La salud que corresponde al 4% al salario básico --

DELIMITER //
DROP FUNCTION IF EXISTS salud//
CREATE FUNCTION salud(id_persona VARCHAR(9)) 
RETURNS FLOAT(5,2)
DETERMINISTIC 
BEGIN
RETURN (SELECT salario_base FROM persona WHERE id = id_persona) * 0.04;
END
//

--- Tambien se puede hacer así  --




--- 3. Función pension: La pensión que corresponde al 4% al salario básico ---

DELIMITER //
DROP FUNCTION IF EXISTS pension//
CREATE FUNCTION pension(id_persona VARCHAR(9)) 
RETURNS FLOAT(5,2)
DETERMINISTIC 
BEGIN
RETURN (SELECT salario_base FROM persona WHERE id = id_persona) * 0.04;
END
//

--- Tambien se puede hacer así  --


--- 4. Función bono: Un bono que corresponde al 8% al salario básico.

DELIMITER //
DROP FUNCTION IF EXISTS bono//
CREATE FUNCTION bono(id_persona VARCHAR(9)) 
RETURNS FLOAT(5,2)
DETERMINISTIC 
BEGIN
RETURN (SELECT salario_base FROM persona WHERE id = id_persona) * 0.08;
END
//

--- Tambien se puede hacer así  ---
 


--- 5. Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte.

DELIMITER //
DROP FUNCTION IF EXISTS integral//
CREATE FUNCTION integral(id_persona VARCHAR(9)) 
RETURNS FLOAT(9,2)
DETERMINISTIC 
BEGIN
RETURN (SELECT salario_base FROM persona WHERE id = id_persona) +
(SELECT subsidio_transporte(id_persona)) +
(SELECT salud(id_persona)) +
(SELECT pension(id_persona)) +
(SELECT bono(id_persona));
END
//
