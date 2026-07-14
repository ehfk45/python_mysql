SELECT
    first_name,
    UPPER(first_name) AS upper_name
FROM customer;

SELECT
    first_name,
    LOWER(first_name) AS lower_name
FROM customer;

SELECT
    first_name,
    LENGTH(first_name) AS length
FROM customer;

SELECT
    email,
    REPLACE(email, '.org', '.com') AS new_email
FROM customer;

SELECT
    first_name,
    LEFT(first_name, 3) AS first3
FROM customer;

SELECT
    last_name,
    RIGHT(last_name, 3) AS last3
FROM customer;

SELECT
    first_name,
    SUBSTRING(first_name, 2, 3) AS sub_name
FROM customer;

-- 고객 이름과 성을 합치고 이름 길이를 함께 출력
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    LENGTH(first_name) AS name_length
FROM customer;

SELECT
    customer_id,
    MOD(customer_id, 10) AS remainder 
FROM customer;

SELECT
    customer_id,
    FLOOR(RAND() * 100) + 1 AS coupon_number -- 1~100까지
FROM customer
LIMIT 10;

SELECT
    payment_id,
    amount,
    ROUND(amount, 1) AS round_amount
FROM payment;

SELECT
    payment_id,
    amount,
    ROUND(amount * 0.9, 2) AS discount_price
FROM payment
LIMIT 10;