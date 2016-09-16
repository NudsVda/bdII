--select simples
SELECT 
	*
FROM
	film;

-- somente valores distintos
SELECT 
	DISTINCT rental_duration 
FROM film

-- where
SELECT 
	* 
FROM 
	film 
WHERE 
	rental_duration > 2;

-- equal
SELECT * FROM film WHERE rental_duration = 3

-- not equal
SELECT * FROM film WHERE rental_duration != 3

-- maior
SELECT * FROM film WHERE rental_duration > 3

-- menor
SELECT * FROM film WHERE rental_duration < 3

-- maior ou igual
SELECT * FROM film WHERE rental_duration >= 3

-- menor ou igual
SELECT * FROM film WHERE rental_duration <= 3

-- ENTRE
SELECT * FROM film WHERE rental_duration BETWEEN 3 AND 5;

-- LIKE
SELECT * FROM film WHERE title LIKE '%EVER';

SELECT * FROM film WHERE title LIKE 'ALI%';

SELECT * FROM film WHERE title LIKE '%FOR%';

-- IN
SELECT * FROM film WHERE rental_duration IN (3,4);

-- AND
SELECT * FROM film WHERE rental_duration > 3 AND title LIKE '%ACA%';

-- OR
SELECT * FROM film WHERE rental_duration > 3 OR title LIKE '%ACA%';

-- ORDER BY
SELECT * FROM film ORDER BY rental_duration;

SELECT * FROM film ORDER BY rental_duration desc;

-- INSERT
INSERT INTO actor (first_name,last_name,last_update) VALUES ('Camila','Pitanga','2016-09-13 00:00:00');

SELECT * FROM actor WHERE first_name = 'Camila';

-- UPDATE
UPDATE actor
SET last_name = 'Pintagueira'
WHERE actor_id IN (SELECT actor_id FROM actor WHERE first_name = 'Camila');

SELECT * FROM actor WHERE first_name = 'Camila';

DELETE FROM actor WHERE actor_id > 200;

-- ALIASES
SELECT rental_duration AS r FROM film AS f;

-- INNER JOIN
-- tudo que está em uma tabela e na outra também
SELECT * FROM actor AS a
INNER JOIN film_actor as fa
ON a.actor_id = fa.actor_id
INNER JOIN film AS f
ON f.film_id = fa.film_id

-- LEFT JOIN
-- http://www.w3schools.com/sql/sql_join_left.asp
SELECT * FROM customer AS p
LEFT OUTER JOIN payment AS c
ON p.customer_id = c.customer_id;

-- RIGHT JOIN
-- http://www.w3schools.com/sql/sql_join_right.asp
SELECT * FROM customer AS p
RIGHT OUTER JOIN payment AS c
ON p.customer_id = c.customer_id;

-- FULL JOIN
-- http://www.w3schools.com/sql/sql_join_full.asp
SELECT * FROM customer AS p
FULL OUTER JOIN payment AS c
ON p.customer_id = c.customer_id;

-- UNIOR
-- combinar resultado de duas tabelas (ou seja, traz tudo em um campo só filmes e atores)
SELECT first_name FROM actor 
UNION ALL
SELECT title FROM film;

-- SELECT INTO - cria uma nova tabela com os dados do select
--http://www.w3schools.com/sql/sql_select_into.asp
SELECT * INTO newtable
FROM actor;

SELECT * FROM newtable;

TRUNCATE newtable;

-- INSERT INTO SELECT
-- http://www.w3schools.com/sql/sql_insert_into_select.asp
INSERT INTO newtable
SELECT * FROM actor;

SELECT * FROM newtable;

-- AVG (média)
SELECT AVG(rental_duration) FROM film;

-- ARREDONDAR
SELECT ROUND(AVG(rental_duration),2) FROM film;

-- COUNT
SELECT count(*) FROM film;

-- MAX
SELECT MAX(rental_duration) FROM film;

-- MIN 
SELECT MIN(rental_duration) FROM film;

-- SUM
SELECT SUM(rental_duration) FROM film;

-- GROUP BY
SELECT rental_duration FROM film GROUP BY rental_duration;

-- HAVING
SELECT SUM(rental_duration) FROM film GROUP BY rental_duration HAVING rental_duration > 5;

-- UPPER
SELECT UPPER(first_name) FROM actor;

-- LOWER
SELECT LOWER(first_name) FROM actor;

-- SUBSTRING extrair caracterers (campo,inicio,tamanho)
SELECT SUBSTRING(first_name,1,3) AS abv FROM actor;

-- TAMANHO DA STRING
SELECT LENGTH(first_name) FROM actor;

-- NOW
SELECT NOW();

-- FORMATANDO DATA
SELECT to_char(NOW(),'DD/MM/YYYY');

SELECT *,to_char(last_update,'DD/MM/YYYY HH:II') as data_formatada FROM actor;
