-- Using the Sakila database complete the following tasks.


-- 1 --
-- 1. Which of the payment IDs would be returned by the following filter conditions? 
-- customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23’) 

SELECT payment.payment_id
FROM payment
WHERE customer_id <> 5 AND(amount >8 OR date (payment_date) = '2005-08-23');

-- 2. Which of the payment IDs would be returned by the following filter conditions? 
-- customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19’) 

SELECT payment.payment_id
FROM payment
WHERE customer_id = 5 AND NOT(amount > 6 OR date (payment_date) = '2005-06-19');

-- 3. Construct a query that retrieves all rows from the Payment table where the amount is either 1.98, 7.98, or 9.98.

SELECT*
FROM payment
WHERE amount = 1.98 OR amount = 7.98 OR amount = 9.98;

-- 4. Construct a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.

SELECT customer.last_name
FROM customer
WHERE last_name LIKE '_A%W%';



-- 2 --
-- 1. Fill in the blanks (denoted by <#>) for the following query to obtain the results that follow:

SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
	INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id 
WHERE a.district = 'California';

-- 2. Write a query that returns the title of every film in which an actor with the first name JOHN appeared. 

SELECT f.title, a.first_name
FROM film f
	INNER JOIN film_actor fa
    ON f.film_id = fa.film_id
    INNER JOIN actor a
    ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';

-- 3. Construct a query that finds returns all addresses which are in the same city. You will need to join the address table 
-- to itself, and each row should include 2 different addresses.

SELECT a.city_id, a.address, a.address2
FROM address a
	INNER JOIN address a_city
    ON a_city.city_id = a.city_id
ORDER BY a.city_id ASC;


-- 3 --
-- 1. Write a query that returns the 17 through 25 characters of the string 'Please find the substring in this string’.

SELECT INSERT('World is beautiful!', 9,0, ' really') STRING; 
SELECT INSERT('World is beautiful!',1,8,'You are') STRING;
SELECT REPLACE('World is beautiful', 'beautiful', 'Amazing!')
FROM DUAL;
SELECT SUBSTRING('World is beautiful',1,5);

-- 2. Write a query that returns the absolute value and sign (−1, 0, or 1) of the number −25.76823. Also return the number rounded to the nearest hundredth. 

SELECT 
	SIGN(-25.76823),
	ABS(-25.76823)
FROM DUAL;
SELECT 
	SIGN(-25.76823),
	-ABS(-25.76823)
FROM DUAL;   
SELECT ROUND(-25.76823);
SELECT TRUNCATE(-25.76823,2);

-- 3. Write a query to return just the month portion of the current date.

SELECT EXTRACT(MONTH FROM current_timestamp);