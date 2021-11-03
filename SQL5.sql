-- Create a view definition that can be used by the following query to generate the given results:

DROP VIEW film_ctgry_actor;

-- 1 solution --
CREATE VIEW film_ctgry_actor
AS 
SELECT f.title, c.name, a.first_name, a.last_name
FROM film f   
INNER JOIN film_category fc
	ON fc.film_id = f.film_id
INNER JOIN category c
	ON c.category_id=fc.category_id
INNER JOIN film_actor fa
	ON fa.film_id = f.film_id
INNER JOIN actor a
	ON  a.actor_id = fa.actor_id
WHERE a.last_name ='FAWCETT'
WITH CHECK OPTION;

SELECT *
FROM film_ctgry_actor;   

-- 2 solution --
CREATE VIEW film_ctgry_actor
AS 
SELECT f.title, c.name, a.first_name, a.last_name
FROM film f   
INNER JOIN film_category fc
	ON fc.film_id = f.film_id
INNER JOIN category c
	ON c.category_id=fc.category_id
INNER JOIN film_actor fa
	ON fa.film_id = f.film_id
INNER JOIN actor a
	ON  a.actor_id = fa.actor_id
WITH CHECK OPTION;

SELECT *
FROM film_ctgry_actor
WHERE last_name ='FAWCETT'; 




