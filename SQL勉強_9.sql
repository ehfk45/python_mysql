SELECT
    title,
    rating,
    CASE rating
        WHEN 'G' THEN '전체관람가'
        WHEN 'PG' THEN '부모지도'
        WHEN 'PG-13' THEN '13세 이상'
        WHEN 'R' THEN '청소년 제한'
        WHEN 'NC-17' THEN '17세 이상'
        ELSE '기타'
    END AS rating_name
FROM film;


         
 SELECT
    title,
    rating,
    length
FROM film
WHERE IF(rating = 'G',
         length >= 90,
         length >= 120);
         
SELECT
    title,
    original_language_id
FROM film
-- WHERE IFNULL(original_language_id, 0) >= 10;  믿에 코드랑 같은 의미          
WHERE original_language_id = 0
or original_language_id is not null;

SELECT
    title,
    rental_rate
FROM film
WHERE NULLIF(rental_rate, 4.99) IS NULL;
-- WHERE rental_rate is NULL or rental_rate = 4.99

-- G 등급은 90분 이상, 그 외는 120분 이상 조회
SELECT
    title,
    rating,
    length
FROM film
WHERE
CASE
    WHEN rating = 'G'
        THEN length >= 90
    ELSE
        length >= 120
END;



SELECT
    title,
    length
FROM film
ORDER BY length ASC, title ASC;

-- 120분보다 작은 영화와 120분 이상인 영화로 구분하여 제목의 오름차순으로 조회 
SELECT
    title,
    length
FROM film
ORDER BY IF(length < 120, 0, 1) ASC, title ASC;