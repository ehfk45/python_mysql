SELECT *
FROM customer
ORDER BY customer_id;

SELECT *
FROM customer
ORDER BY customer_id DESC;

SELECT *
FROM customer
ORDER BY first_name;

SELECT *
FROM customer
ORDER BY last_name, first_name;

SELECT *
FROM customer
ORDER BY store_id ASC, customer_id DESC;

-- 최근 등록된 고객 순으로
SELECT *
FROM customer
ORDER BY create_date DESC;

SELECT *
FROM customer
order by customer_id
LIMIT 3,10;

SELECT *
FROM customer
order by customer_id
limit 10 offset 3 -- limit 3,10

SELECT *
FROM customer
ORDER BY create_date DESC 
LIMIT 10; -- 제일 마지막에 실행

SELECT *
FROM customer
ORDER BY customer_id
LIMIT 10, 5; -- 0~9행 10개 건너뛰고 5개 출력

-- 같은 표현(OFFSET 키워드 사용)
SELECT *
FROM customer
ORDER BY customer_id
LIMIT 5 OFFSET 10;

SELECT *
FROM customer
WHERE active = 1
ORDER BY customer_id
LIMIT 10;

SELECT *
FROM customer
WHERE first_name LIKE 'A%'
ORDER BY first_name
LIMIT 3 OFFSET 1;


SELECT first_name AS "이름", now() AS 오늘, 10+7 AS 계산결과, '미국'AS 국적,customer_id%2 AS "짝수 홀수"
FROM customer
ORDER BY customer_id
limit 10;

SELECT
    c.customer_id,
    c.first_name
FROM customer AS c; -- AS생략가능 FROM customer c

-- 컬럼 별칭은 조회 결과에 필요해서, 테이블 별칭은 편의상 사용.

SELECT
    customer_id,
    customer_id + 1000 AS new_id
FROM customer;

SELECT
    customer_id,
    first_name, 
    10*10,
    'USA',
    NOW()
FROM customer 
LIMIT 10;