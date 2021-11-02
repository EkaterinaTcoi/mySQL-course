-- 1 - Construct a query that counts the number of rows in the payment table. 

USE sakila; 

SELECT COUNT(payment_id) num_rows
FROM payment;
-- output 16049 rows in totall 

SELECT customer_id
FROM payment
GROUP BY customer_id;
-- output 599 row(s)

SELECT staff_id
FROM payment
GROUP BY staff_id;
-- output 2 row(s)

SELECT amount
FROM payment
GROUP BY amount;
-- output 19 row(s)

SELECT last_update
FROM payment
GROUP BY last_update;
-- output 704 row(s)

  
-- 2 - Modify your query from question 1 to count the number of payments made by each customer. Show the customer ID and the total amount paid for each customer. 

SELECT customer_id, MAX(amount) max_amt,
	COUNT(*) num_payments
FROM payment
GROUP BY customer_id;


-- 3 - Modify your query from Exercise 2 to include only those customers having made at least five payments. 

SELECT customer_id, MAX(amount) max_amt,
	COUNT(*) num_payments
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 5;


-- 4 - Write a query that retrieves every row from Sales_Fact, and add a column to generate a ranking based on the tot_salescolumn values. The highest value should receive a 
-- ranking of 1, and the lowest a ranking of 24. 

CREATE DATABASE database_sales; 

USE database_sales; 

DROP TABLE Sales_Fact; 
   
CREATE TABLE Sales_Fact(
	year_no YEAR,
    month_no INT,
    tot_sales INT PRIMARY KEY NOT NULL
);

SELECT * FROM Sales_Fact;

INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 1, 19228);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 2, 18554);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 3, 17325);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 4, 13221);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 5, 9964);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 6, 12658);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 7, 14233);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 8, 17342);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 9, 16853);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 10, 17121);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 11, 19095);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2019, 12, 21436);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 1, 20347);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 2, 17434);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 3, 16225);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 4, 13853);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 5, 14589);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 6, 13248);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 7, 8728);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 8, 9378);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 9, 11467);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 10, 13842);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 11, 15742);
INSERT INTO Sales_Fact(year_no,month_no,tot_sales) VALUES(2020, 12, 18636);

SELECT year_no,month_no,tot_sales,RANK() OVER (ORDER BY tot_sales) sales_rank
FROM Sales_Fact
GROUP BY tot_sales;

    
-- 5 - Modify the query from exercise 4 to generate two sets of rankings from 1 to 12, one for 2019 data and one for 2020. 

SELECT year_no,month_no,tot_sales,RANK() OVER (PARTITION BY (year_no) ORDER BY tot_sales) sales_rank
FROM Sales_Fact
GROUP BY tot_sales
ORDER BY 4;


-- 6 - Write a query that retrieves all 2020 data, and include a column which will contain the tot_salesvalue from the previous month. 

SELECT year_no, month_no, tot_sales,
	lag(tot_sales) over(order by month_no) prev_month_sales
FROM Sales_Fact
WHERE year_no = 2020;