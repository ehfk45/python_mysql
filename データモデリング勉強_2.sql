CREATE TABLE person (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(30),
    hobby VARCHAR(100)
);


INSERT INTO person VALUES
(1001, '홍길동', '야구,농구'),
(1002, '김철수', '독서'),
(1003, '이영희', '영화감상,여행'),
(1004, '박민수', '등산,수영,캠핑'),
(1005, '최지훈', '게임,발야구');

SELECT * FROM person 
WHERE hobby like '%야구%';


CREATE TABLE person1 (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(30)
);


INSERT INTO person1 VALUES
(1001,'홍길동'),
(1002,'김철수'),
(1003,'이영희'),
(1004,'박민수'),
(1005,'최지훈');

CREATE TABLE person1_hobby (
    person_id INT,
    hobby VARCHAR(30),
    PRIMARY KEY(person_id, hobby),
    FOREIGN KEY(person_id)
        REFERENCES person1(person_id)
);


INSERT INTO person1_hobby VALUES
(1001,'야구'),
(1001,'농구'),
(1002,'독서'),
(1003,'영화감상'),
(1003,'여행'),
(1004,'등산'),
(1004,'수영'),
(1004,'캠핑'),
(1005,'게임'),
(1005,'발야구');

SELECT * FROM person1_hobby as ph join person1 as p
on ph.person_id = p.person_id
WHERE hobby = '영화감상';