SELECT first_name
FROM actor
UNION ALL
SELECT first_name
FROM customer;

SELECT first_name
FROM actor
INTERSECT
SELECT first_name
FROM customer;

SELECT first_name
FROM actor
EXCEPT
SELECT first_name
FROM customer;

SELECT t.name
FROM
(SELECT first_name AS name FROM actor
UNION
SELECT first_name AS name FROM customer)t
WHERE t.name like '%ac%';