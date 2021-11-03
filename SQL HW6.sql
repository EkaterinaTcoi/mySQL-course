-- The film rental company manager would like to have a report that includes the name of every country, along with the total payments for all customers who live in each country. 
-- Generate a view definition that queries the country table and uses a scalar subquery to calculate a value for a column named tot_payments

USE sakila;

DROP VIEW country_payments;

SELECT customer_id, 
SUM(amount)tot_amount
FROM payment
GROUP BY customer_id;

CREATE VIEW country_payments
AS 
SELECT SUM(p.amount)tot_payments, c.country
FROM country c  
INNER JOIN city ct
	ON ct.country_id = c.country_id
INNER JOIN address a
	ON ct.city_id = a.city_id
INNER JOIN customer cst
	ON a.address_id = cst.address_id
INNER JOIN payment p
	ON  cst.customer_id = p.customer_id
GROUP BY c.country;

SELECT *
FROM country_payments;