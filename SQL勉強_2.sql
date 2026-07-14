show columns from customer;

select first_name, create_date
from customer
where create_date < '' ;


SELECT *
FROM customer
WHERE active = 1
AND store_id = 1;

SELECT *
FROM customer
WHERE store_id = 1
OR store_id = 2;

SELECT *
FROM customer
WHERE NOT active = 1;

SELECT *
FROM customer
WHERE first_name IN ('MARY', 'PATRICIA', 'LINDA');
-- 컬럼값의 대소문자를 구분하지 않음, 다른 RDBMS는 구분을 함.

SELECT *
FROM customer
WHERE first_name NOT IN ('MARY', 'PATRICIA');

SELECT *
FROM customer
WHERE customer_id BETWEEN 10 AND 20; -- 10(포함)~20(포함)

SELECT *
FROM customer
WHERE customer_id NOT BETWEEN 10 AND 20;

SELECT *
FROM customer
WHERE first_name LIKE 'A%'; -- 대문자 A로 시작하는

SELECT *
FROM customer
WHERE first_name LIKE '%A'; -- 대문자 A로 끝나는

SELECT *
FROM customer
WHERE first_name LIKE '%AR%'; -- 대문자 AR을 포함

SELECT *
FROM customer
WHERE first_name NOT LIKE 'A%'; -- 대문자 A로 시작하지 않는

SELECT *
FROM customer
WHERE store_id = 1
AND (active = 1 OR first_name = 'MARY');

SELECT *
FROM customer
WHERE NOT first_name LIKE 'A%';

SELECT *
FROM customer
WHERE active = 1
AND store_id IN (1, 2)
AND first_name LIKE 'M%'
AND customer_id BETWEEN 100 AND 300;