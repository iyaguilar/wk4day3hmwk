SELECT * 
FROM customer




1. List all the customers who live in Texas? Use JOINS=
Jennifer Davis
Kim Cruz
Richard McCrary
Bryan Hardison
Ian Still

SELECT customer.first_name, customer.last_name
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
WHERE address.district = 'Texas';


2. Get all payments above $6.99 with the Customer's Full 
Name ; ITS A VERY LONG LIST

SELECT customer.first_name, customer.last_name,
payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;



3. Show all customers names who have made payments over $175(use 
subqueries) NONE

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);

4. List all customers that live in Nepal (use the city 
table)  = 1 CUSTOMER (KEVIN SCHULER)

SELECT customer.first_name, customer.last_name
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

5. Which staff member had the most 
transactions?  STAFF ID #2-JON STEPHENS HAD 7304 TRANSACTIONS

SELECT staff.staff_id, staff.first_name, staff.last_name, COUNT(payment.payment_id) AS transaction_count
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY transaction_count DESC
LIMIT 1;


6. How many movies of each rating are 
there?  
PG-13=223
G=178
R=195
NC-17=210
PG=194

SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating;



7.Show all customers who have made a single payment 
above $6.99 (Use Subqueries) 

SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN (
    SELECT payment.customer_id
    FROM payment
    WHERE payment.amount > 6.99
    GROUP BY payment.customer_id
    HAVING COUNT(*) = 1
);

