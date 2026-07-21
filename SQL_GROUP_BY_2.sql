-- left join : category x film_category

SELECT 
	sum(case when t.cnt = 0 then 1 else 0 end) "영화가 존재하지 않는 카테고리",
    sum(case when t.cnt > 0 then 1 else 0 end) "영화가 존재하는 카테고리"
FROM
(SELECT c.category_id id, count(fc.film_id) cnt
FROM category c left join film_category fc
on c.category_id = fc.category_id
GROUP BY c.category_id) t;