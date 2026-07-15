SELECT
    title, -- 컬럼
    length,  -- 컬럼
    IF(length >= 120, '장편', '일반') AS movie_type -- 계산된 조회
FROM film
order by movie_type asc, length asc;

SELECT
    title,
    rental_duration,
    IF(rental_duration >= 5, '길다', '짧다') AS duration_type
FROM film;

SELECT
    title,
    IFNULL(original_language_id, 0) AS language_id
FROM film;

SELECT
    title,
    rental_rate,
    NULLIF(rental_rate, 4.99) AS result  -- () 안에 있는 두가지가 같으면 NULL 로 표시하라는 뜻
FROM film;

USE TEST;