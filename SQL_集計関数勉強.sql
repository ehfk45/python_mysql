CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT NOT NULL
);

INSERT INTO student (id, name, gender, age) VALUES
(1, '김민수', 'M', 20),
(2, '이영희', 'F', 22),
(3, '박지훈', 'M', 21),
(4, '최수진', 'F', 23),
(5, '정우성', 'M', 19),
(6, '한지민', 'F', 20),
(7, '오세훈', 'M', 24),
(8, '윤아름', 'F', 21),
(9, '강동원', 'M', 22),
(10, '송지은', 'F', 19);


insert into student ( id, name, gender, age)
values(11, '송지은', 'F', 20);



SELECT gender, avg(age), variance(age), stddev(age)
FROM student
GROUP BY gender;


SELECT
    f.title,
    GROUP_CONCAT(
        CONCAT(a.first_name, ' ', a.last_name)
        ORDER BY a.last_name
        SEPARATOR ', '
    ) AS actors
FROM film f
INNER JOIN film_actor fa
    ON f.film_id = fa.film_id
INNER JOIN actor a
    ON fa.actor_id = a.actor_id
GROUP BY f.film_id, f.title
ORDER BY f.title;


SELECT
    f.title,
    count(*),
    group_concat(a.first_name ORDER BY a.first_name) 출연배우
FROM film f
INNER JOIN film_actor fa
    ON f.film_id = fa.film_id
INNER JOIN actor a
    ON fa.actor_id = a.actor_id
GROUP BY f.title;


SELECT
    c.name,
    COUNT(*) AS movie_count,
    GROUP_CONCAT(f.title ORDER BY f.title)
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY c.name
HAVING COUNT(*) >= 60
ORDER BY COUNT(*) DESC;


SELECT
    c.name,
    COUNT(DISTINCT f.rating) AS rating_count중복제거카운트, 
    COUNT(*) AS 카테고리카운트
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT
    c.name,
    AVG(f.length) 평균,
    VARIANCE(f.length) AS "분산(평균과의 거리에 제곱)",
    STDDEV(f.length) AS "표준편차(분산에 제곱근)"
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY c.name;

SELECT
    c.name,
    AVG(f.length) 평균,
    VARIANCE(f.length) AS "분산(평균과의 거리에 제곱)",
    STDDEV(f.length) AS "표준편차(분산에 제곱근)"
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY STDDEV(f.length) ASC;


-- 숫자에만 사용가능한 집계함수 avg, sum
-- 숫자+문자 count, max, min
-- 문자 group_concat(문자열값들을 연결)