SELECT
    title,
    rating
FROM film
ORDER BY
CASE
    WHEN rating = 'PG-13' THEN 1
    WHEN rating = 'NC-17' THEN 2
    ELSE 3
END;

SELECT
    title,
    length
FROM film
ORDER BY
CASE
    WHEN length >= 120 THEN 1
    ELSE 2
END,
title;

with f2 as (
	select title 제목, length 시간
    from film
    limit 10
    )


select f2.제목,f2.시간
from
	(select title 제목, length 시간
    from film
    limit 10) as f2


where f2.시간 between 50 and 100;


WITH movie AS (
    SELECT title, rental_rate
    FROM film
)
SELECT *
FROM movie;

WITH expensive_movie AS (
    SELECT title, rental_rate
    FROM film
    WHERE rental_rate >= 4
)
SELECT *
FROM expensive_movie;

WITH long_movie AS (
    SELECT title, length
    FROM film
    WHERE length >= 120
)
SELECT *
FROM long_movie
ORDER BY length DESC;
