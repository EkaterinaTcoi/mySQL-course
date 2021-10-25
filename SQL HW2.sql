--  1. Retrieve the actor ID, first name, and last name for all actors. Sort by last name and then by first name.

SELECT actor_id, first_name, last_name
FROM actor
ORDER BY last_name;

SELECT actor_id, first_name, last_name
FROM actor
ORDER BY first_name;

-- 2. Retrieve the actor ID, first name, and last name for all actors whose last name equals 'WILLIAMS' or 'DAVIS’ 

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'WILLIAMS' OR last_name = 'DAVIS';

-- 3. Write a query against the rental table that returns the IDs of the customers who rented a film on July 5th 2005 (use the rental.rental_date column, and you can use the date()
-- function to ignore the time component). Include a single row for each distinct customer ID.

SELECT c.customer_id, c.first_name, c.last_name,
	TIME(r.rental_date)rental_date
FROM customer c
	INNER JOIN rental r
    ON c.customer_id = r.customer_id
WHERE DATE (r.rental_date) = '2005-07-05'
ORDER BY TIME (r.rental_date) DESC;