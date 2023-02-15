create table empleado(
    codigo integer primary key,
    nif text,
    nombre text,
    apellido1 text,
    apellido2 text,
    codigo_departamento integer
);

create table departamento(
    codigo integer primary key,
    nombre text,
    presupuesto real,
    gastos real 

);
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);


    Lista el primer apellido de todos los empleados.
    select apellido1 from empleado;
    Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
    select distinct apellido1 from empleado;
    Lista todas las columnas de la tabla empleado.
    select * from empleado;
    Lista el nombre y los apellidos de todos los empleados.
    select nombre Nombre, apellido1, apellido2 from empleado;
    Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
    select codigo_departamento from empleado;
    Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
    select nombre from empleado union select apellido1 from empleado union select apellido2 from empleado;
    Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
    select ucase(nombre) nombre from empleado union select ucase(apellido1) from empleado union select ucase(apellido2) from empleado;
    Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
    select lcase(nombre) nombre_apellidos from empleado union select lcase(apellido1) from empleado union select lcase(apellido2) from empleado;
    Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
    select right(nif, 1) letra, left(nif, 8) numero from empleado;
    Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
    select nombre , presupuesto, gastos 
    Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
    select nombre , presupuesto , gastos , presupuesto from departamento order by presupuesto asc;
    Lista el nombre de todos los departamentos ordenados de forma ascendente.
    select nombre Nombre from departamento order by Nombre asc;
    Lista el nombre de todos los departamentos ordenados de forma desscendente.
    select nombre Nombre from departamento order by Nombre desc;
    Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
    elect apellido1,apellido2,nombre from empleado order by apellido1 asc;
    Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
    select nombre, presupuesto from departamento order by presupuesto desc limit 3;
    Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
    select nombre, presupuesto from departamento order by presupuesto asc limit 3
    Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
    select nombre, gastos from departamento order by gastos desc limit 2;
    Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
    select nombre , gastos from departamento order by gastos asc limit 2;
    Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
    select * from empleado limit 2, 5;
    Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
    select nombre, presupuesto from departamento where presupuesto >= 150000;
    Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
    select nombre, gastos from departamento where presupuesto < 5000;
    Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
    select nombre, presupuesto from departamento where presupuesto >= 100000 and presupuesto <=200000;
    Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
    select nombre, presupuesto from departamento where presupuesto > 200000 or presupuesto < 100000;
    Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
    select nombre, presupuesto from departamento where presupuesto between 100000 and 200000;
    Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
    select nombre, presupuesto from departamento where not presupuesto between 100000 and 200000;
    Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
    select nombre, presupuesto, gastos from departamento where gastos > presupuesto;
    Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
    Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
    Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
    select *  from empleado where apellido2 is null;
    Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
    select *  from empleado where apellido2 is not null; 
    Lista todos los datos de los empleados cuyo segundo apellido sea López.
    select *  from empleado where apellido2 like '%López%';
    Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
    
    Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
    Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
    Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
