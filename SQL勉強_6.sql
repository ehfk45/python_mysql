SELECT
    NOW(),
    CURDATE(),
    CURTIME(),
    YEAR(NOW()),
    MONTH(NOW()),
    DAY(NOW());
    
    SELECT
    first_name,
    YEAR(create_date) AS join_year,
    YEAR(curdate()) - YEAR(create_date) "가입 후 몇 년",
    datediff(curdate(),create_date)"가입 후 몇 일"
FROM customer;

select date_add(curdate(), interval 1000 day);

select curdate() + 1000;

SELECT
    first_name,
    create_date,
    DATE_ADD(create_date, INTERVAL 30 DAY) AS after30
FROM customer;

SELECT
    first_name,
    DATEDIFF(CURDATE(), create_date) AS days_after_join
FROM customer;

SELECT
    first_name,
    DATE_FORMAT(create_date, '%Y년 %m월 %d일') AS join_date
FROM customer;

SELECT
    NOW() AS current_datetime,
    CURDATE() AS current_date,
    CURTIME() AS current_time;
    
SELECT *
FROM customer
WHERE YEAR(create_date) = 2005; 

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM customer
WHERE LENGTH(first_name) >= 6;

select * from customer
order by length(first_name) desc, length(last_name) desc;