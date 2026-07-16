select
	ci.city, ci.country_id, co.country
from city ci inner join country co
on ci.country_id = co.country_id
where ci.country_id = 200; 


select * from address;

select * from city where city_id = 463;

select * from country where country_id = 50;

SELECT
    co.country,
    c.city,
    a.address
FROM country AS co
INNER JOIN city AS c
    ON co.country_id = c.country_id
INNER JOIN address AS a
    ON c.city_id = a.city_id
WHERE co.country = 'japan'
ORDER BY c.city;

SELECT
    f.title,
    c.name AS category
FROM film AS f  -- ① film 테이블부터 시작한다.
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id  -- ② 영화의 film_id와 film_category의 film_id를 연결한다.
INNER JOIN category AS c
    ON fc.category_id = c.category_id  -- ③ film_category의 category_id와 category의 category_id를 연결한다.
ORDER BY title;
