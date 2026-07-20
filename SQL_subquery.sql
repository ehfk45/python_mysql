-- subquery : select 안에 select 

SELECT round(avg(length)) FROM film;
SELECT 
	title, 
    length, 
   (SELECT round(avg(length)) FROM film) 전체평균
FROM film; -- 스칼라(단일값), 벡터(컬렉션)

SELECT t.title
FROM ( SELECT * FROM film WHERE length > 120) t
WHERE t.title like 'b%';
-- 인라인 뷰

SELECT avg(length) FROM film;

SELECT *
FROM film
WHERE length > (SELECT avg(length) FROM film);

-- SELECT 절 (스칼라 서브쿼리)
-- FROM 절 (인라인 뷰)
-- WHRER 절 (서브쿼리)

SELECT title,
		   rental_rate,
		   (SELECT AVG(rental_rate) FROM film) AS avg_rate
FROM film;


SELECT *
FROM (
    SELECT title, rental_rate
    FROM film
) AS f
WHERE rental_rate >= 4.99;

SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);