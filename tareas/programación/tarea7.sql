-- Se pide:
-- - Realiza la carga de la BBDD de Sakila, tal y como se muestra en los enlaces proporcionados.
-- - Realiza cada una de las siguientes consultas:
-- 1. Actores que tienen de primer nombre __Scarlett__.
SELECT * FROM actor WHERE first_name = 'Scarlett';
-- 2. Actores que tienen de apellido __Johansson__.
SELECT * FROM actor WHERE last_name = 'Johansson';
-- 3. Actores que contengan una __O__ en su nombre.
SELECT * FROM actor WHERE first_name like '%O%';
-- 4. Actores que contengan una __O__ en su nombre y en una __A__ en su apellido.
SELECT * FROM actor WHERE first_name like '%O%' AND last_name like '%A%';
-- 5. Actores que contengan dos __O__ en su nombre y en una __A__ en su apellido.
SELECT * FROM actor WHERE first_name like '%O%O%' AND last_name like '%A%';
-- 6. Actores donde su tercera letra sea __B__.
SELECT * FROM actor WHERE first_name LIKE '__B%';
-- 7. Ciudades que empiezan por __a__.
SELECT * FROM city WHERE city regexp '^a';
-- 8. Ciudades que acaban por __s__.
SELECT * FROM city WHERE city regexp 's$';
-- 9. Ciudades del country __61__.
SELECT * FROM city WHERE country_id = 61;
-- 10. Ciudades del country __Spain__.
SELECT * FROM city WHERE country_id = (SELECT country_id FROM country WHERE country = 'Spain');
-- 11. Ciudades con nombres compuestos.
SELECT * FROM city WHERE city like '% %';
-- 12. Películas con una duración entre __80 y 100__.
SELECT count(*) FROM film WHERE length BETWEEN 80 AND 100;
-- 13. Peliculas con un rental_rate entre __1 y 3__.
SELECT count(*) FROM film WHERE rental_rate BETWEEN 1 AND 3;
-- 14.  Películas con un titulo de más de __12 letras__.
SELECT count(title) FROM film WHERE length(title) >= 12;
-- 15. Peliculas con un rating de __PG__ o __G__.
SELECT count(*) FROM film WHERE rating in ('PG','G');
-- 16. Peliculas que no tengan un rating de __NC-17__.
SELECT count(*) FROM film WHERE rating not in ('NC-17');
-- 17. Peliculas con un rating __PG__ y duracion de más de __120__.
SELECT count(*) FROM film WHERE rating = 'PG' AND length > 120;
-- 18. ¿Cuantos actores hay?
SELECT count(*) FROM actor;
-- 19. ¿Cuántas ciudades tiene el country __Spain__?
SELECT count(*) FROM city WHERE country_id = (SELECT country_id FROM country WHERE country = 'Spain');
-- 20. ¿Cuántos countries hay que empiezan por __a__?
SELECT count(*) FROM country WHERE country regexp '^a';
-- 21. Media de duración de peliculas con __PG__.
SELECT avg(length) as AVG FROM film WHERE rating = 'PG';
-- 22. Suma de __rental_rate__ de todas las peliculas.
SELECT sum(rental_rate) FROM film;
-- 23. Pelicula con mayor duración.
SELECT COUNT(*) FROM film WHERE length = (SELECT max(length) FROM film);
SELECT COUNT(*) FROM film WHERE length = (SELECT min(length) FROM film);
-- 24. Mostrar las ciudades del country __Spain__ (multitabla).
SELECT count(*) FROM city JOIN country ON city.country_id = country.country_id 
AND country = 'Spain';
-- 25. Mostrar el nombre de la película y el nombre de los actores.
SELECT film.title, actor.first_name FROM film, film_actor, actor WHERE film.film_id = film_actor.actor_id
AND film_actor.actor_id = actor.actor_id;
-- 26. Mostrar el nombre de la película y el de sus categorías.
SELECT film.title, category.name FROM film, film_category, category WHERE film.film_id = film_category.film_id 
AND film_category.category_id = category.category_id;
-- 27. Mostrar el country, la ciudad y dirección de cada miembro del staff.
SELECT staff.staff_id, country.country, city.city, address.address FROM staff, country, city, address
WHERE country.country_id = city.country_id AND city.city_id = address.city_id AND staff.address_id = address.address_id;
-- 28. Mostrar el country, la ciudad y dirección de cada customer.
SELECT country.country, city.city, address.address FROM customer, country, city, 
address WHERE customer.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id;
-- 29. Numero de películas de cada rating.
SELECT rating, count(*) FROM film GROUP BY rating;
-- 30. Cuantas películas ha realizado el actor "ED CHASE".
SELECT count(*) FROM actor AS a, film AS f, film_actor AS fa
WHERE f.film_id = fa.film_id AND a.actor_id = fa.actor_id AND first_name = 'ED'
AND last_name = 'CHASE' GROUP BY first_name , last_name;
-- 31. Media de duración de las películas cada categoría.
SELECT c.name, avg(f.length) FROM category AS c, film AS f, film_category AS fc
WHERE c.category_id = fc.category_id AND f.film_id = fc.film_id GROUP BY c.name;
-- Muestra el resultado de la consulta de las vistas que se proporcionan.
-- View structure for view `customer_list`
--
CREATE VIEW customer_list AS
SELECT 
  cu.customer_id AS ID, CONCAT(cu.first_name, _utf8mb4' ', cu.last_name) AS name, 
    a.address AS address, 
    a.postal_code AS `zip code`,
  a.phone AS phone, 
    city.city AS city, 
    country.country AS country, 
    IF(cu.active, _utf8mb4'active',_utf8mb4'') AS notes, 
    cu.store_id AS SID
FROM 
  customer AS cu JOIN address AS a 
    ON cu.address_id = a.address_id 
    JOIN city 
    ON a.city_id = city.city_id
  JOIN country 
    ON city.country_id = country.country_id;
--
SELECT * FROM customer_list;
-- 599 rows in set (0,01 sec)
--
-- View structure for view `film_list`
--
CREATE VIEW film_list AS
SELECT 
  film.film_id AS FID, 
    film.title AS title, 
    film.description AS description, 
    category.name AS category, 
    film.rental_rate AS price,
  film.length AS length, 
    film.rating AS rating, 
    GROUP_CONCAT(CONCAT(actor.first_name, _utf8mb4' ', actor.last_name) SEPARATOR ', ') AS actors
FROM 
  category LEFT JOIN film_category 
    ON category.category_id = film_category.category_id 
    LEFT JOIN film 
    ON film_category.film_id = film.film_id
  JOIN film_actor 
    ON film.film_id = film_actor.film_id
  JOIN actor 
    ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name;
--
SELECT * FROM film_list;
-- Crea 5 vistas sobre la BBDD, y realizar la consulta, para mostrar los resultados. Las vistas deben de
-- tener 3 o más tablas de la BBDD.
--
-- 1. Mostrar el nombre de la película y el nombre de los actores.
CREATE VIEW films_actors AS
SELECT film.title, actor.first_name FROM film, film_actor, actor WHERE film.film_id = film_actor.actor_id
AND film_actor.actor_id = actor.actor_id;

SELECT * FROM films_actors;
-- 2. Mostrar el nombre de la película y el de sus categorías.
CREATE VIEW films_categorys AS
SELECT film.title, category.name FROM film, film_category, category WHERE film.film_id = film_category.film_id 
AND film_category.category_id = category.category_id;

SELECT * FROM films_categorys;
-- 3. Mostrar el country, la ciudad y dirección de cada miembro del staff.
CREATE VIEW staff_address AS
SELECT staff.staff_id, country.country, city.city, address.address FROM staff, country, city, address
WHERE country.country_id = city.country_id AND city.city_id = address.city_id AND staff.address_id = address.address_id;

SELECT * FROM staff_address;
-- 4. Mostrar el country, la ciudad y dirección de cada customer.
CREATE VIEW customer_address AS
SELECT customer.customer_id, country.country, city.city, address.address FROM customer, country, city, 
address WHERE customer.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country.id;

SELECT * FROM custumer.addres_id;
-- 5. Media de duración de las películas cada categoría.
CREATE VIEW avg_category AS
SELECT c.name, avg(f.length) FROM category AS c, film AS f, film_category AS fc
WHERE c.category_id = fc.category_id AND f.film_id = fc.film_id GROUP BY c.name;

SELECT * FROM avg_category;
SELECT * FROM country.country.id;
SELECT * FROM dpodls.id;
SELECT * FROM lopoend.id;
SELECT * FROM point.id;
SELECT * FROM ponter.id;
SELECT * FROM gkg.id,
SELECT * From hdie.id;
SELECT * FROM popop.id;
SELECT * FROM kr.id;




