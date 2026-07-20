insert into category(name)
values('KContants'); -- 한류 장르 추가

SELECT * FROM category;

SELECT f.title, c.name
FROM  category as c LEFT JOIN film_category as fc
	ON c.category_id =  fc.category_id
LEFT JOIN film as f
	ON fc.film_id = f.film_id
WHERE f.title is null;