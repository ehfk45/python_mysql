SELECT f.title, f.rating, f.length, t.avg_length
FROM film f INNER JOIN (SELECT rating,
					AVG(length) AS avg_length
					FROM film
					GROUP BY rating) t
ON f.rating = t.rating
ORDER BY f.rating;

SELECT title,
       rating,
       length,
       AVG(length) OVER(PARTITION BY rating) AS avg_length
FROM film;


SELECT
    title,length,
    ROW_NUMBER() OVER(ORDER BY length DESC) 'row_number',
	RANK() OVER(ORDER BY length DESC) 'rank',
	DENSE_RANK() OVER(ORDER BY length DESC) 'dense_rank'
FROM film;


SELECT
    title,
    length,
    NTILE(4) OVER(ORDER BY length)
FROM film;

SELECT
    title,
    length,
    LAG(length) OVER(ORDER BY film_id)
FROM film;


SELECT
    title,
    length,
    LEAD(length) OVER(ORDER BY film_id)
FROM film;

SELECT
    title,
    length,
    rating,
    CUME_DIST() OVER(partition by rating order BY length)
FROM film;

SELECT
    title,
    length,
    PERCENT_RANK() OVER(ORDER BY length)
FROM film;


SELECT
	title, 
    rating,
	COUNT(length) OVER(PARTITION BY rating), 
	SUM(length) OVER(PARTITION BY rating), 
	AVG(length) OVER(PARTITION BY rating), 
	MIN(length) OVER(PARTITION BY rating), 
	MAX(length) OVER(PARTITION BY rating)
FROM film;