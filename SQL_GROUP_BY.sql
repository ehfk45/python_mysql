CREATE TABLE person(
	id int primary key,
	name varchar(50),
	gender char(1)
);

INSERT INTO gender (id, name, gender) VALUES
(1, '김민수', 'M'),
(2, '이영희', 'F'),
(3, '박지훈', 'M'),
(4, '최수진', 'F'),
(5, '정우성', 'M'),
(6, '한지민', 'F'),
(7, '오세훈', 'M'),
(8, '윤아름', 'F'),
(9, '강동원', 'M'),
(10, '송지은', 'F');

SELECT gender, count(*), sum(id)
FROM person -- 1 결과셋
GROUP BY gender; -- 2 계산셋 2개 -> 2개 


SELECT * FROM person
ORDER BY gender;

SELECT rating, count(*), sum(length), avg(length), max(length), min(length) 
FROM film -- 결과셋 1개
GROUP BY rating
having sum(length) > 25000; -- 계산셋 5개


-- SELECT 집계함수 5
-- from 1
-- WHERE 2
-- GROUP BY 3
-- HAVING 4

SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

SELECT rating,
       COUNT(*) AS 영화수
FROM film
GROUP BY rating;

SELECT rating,
       AVG(rental_rate) AS 평균대여료
FROM film
GROUP BY rating;

SELECT rating,
       SUM(length) AS 총상영시간
FROM film
GROUP BY rating;

SELECT rating,
       MAX(length) AS 최대길이
FROM film
GROUP BY rating;

SELECT rating,
       MIN(length) AS 최소길이
FROM film
GROUP BY rating;

SELECT rating,
       COUNT(*) AS 영화수,
       AVG(length) AS 평균길이,
       MAX(length) AS 최대길이,
       MIN(length) AS 최소길이
FROM film
GROUP BY rating;

SELECT count(*), avg(length) "전체 러닝타임 평균"
FROM film; -- 계산셋을 쓰려면 무조건 GROUP BY 안적어도 (*)같은게 되는건 GROUP BY null 내용이 생략된 형태

SELECT rating r,
       COUNT(*) c
FROM film -- 결과셋 1
WHERE rating IN ('R', 'G') -- 결과셋 1
GROUP BY rating -- 계산셋 R/G 2개 생성
ORDER BY c desc -- 계산셋 집계된 결과셋에 대한 정렬
LIMIT 1; 