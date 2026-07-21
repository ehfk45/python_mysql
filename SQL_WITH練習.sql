with f3join as
	(SELECT c.name name,f.title title, f.length length
	FROM category c
	JOIN film_category fc
	ON c.category_id = fc.category_id
	JOIN film f
	ON fc.film_id = f.film_id)

SELECT title, length, (SELECT max(length) FROM f3join WHERE name = 'Children') "Children max"
FROM film
WHERE length > (SELECT max(length)
FROM f3join
WHERE name = 'Children')	
ORDER BY length desc;