SELECT title, rental_rate
FROM film
WHERE rental_rate >
(
    SELECT AVG(rental_rate)
    FROM film
);



SELECT film_id,category_id
FROM film_category
WHERE category_id IN 
( -- 서브쿼리의 결과셋이 2행이상
    SELECT category_id
    FROM category
    WHERE name IN ('Action', 'Comedy')
);

SELECT name
FROM category
WHERE category_id NOT IN
(
    SELECT category_id
    FROM category
    WHERE name = 'Action'
);


SELECT *
FROM category c -- 메인쿼리
WHERE EXISTS
(
    SELECT *
    FROM film_category fc -- 서브쿼리
    WHERE fc.category_id = c.category_id -- 메인 서브 조인조건
);

SELECT c.*
FROM category c left join film_category fc
	on fc.category_id = c.category_id
except
SELECT c.*
FROM category c inner join film_category fc
	on fc.category_id = c.category_id;