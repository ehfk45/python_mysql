CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    subject1 VARCHAR(30),
    subject2 VARCHAR(30),
    subject3 VARCHAR(30)
);

INSERT INTO student VALUES
(1001,'홍길동','DB','Python','Power BI'),
(1002,'김철수','Java','SQL',NULL),
(1003,'이영희','Python',NULL,NULL);

SELECT * FROM student;


CREATE TABLE student1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30)
);


CREATE TABLE student1_subject (
    student_id INT,
    subject_name VARCHAR(30),
    PRIMARY KEY(student_id, subject_name),
    FOREIGN KEY(student_id)
        REFERENCES student1(student_id)
);

INSERT INTO student1 VALUES
(1001,'홍길동'),
(1002,'김철수'),
(1003,'이영희');

INSERT INTO student1_subject VALUES
(1001,'DB'),
(1001,'Python'),
(1001,'Power BI'),
(1002,'Java'),
(1002,'SQL'),
(1003,'Python');

SELECT * FROM student1_subject;

INSERT INTO student1_subject
VALUES('1001','java');

-- 1정규화 전
SELECT * FROM student WHERE student_id = '1001';
-- 1정규화 후
SELECT * FROM student1_subject WHERE student_id = '1001';

SELECT s.student_id, s.student_name,ss.subject_name 
FROM student1_subject as ss join student1 as s
on ss.student_id = s.student_id
WHERE s.student_id = '1001';


SELECT s.student_id, s.student_name, group_concat(ss.subject_name) 
FROM student1_subject as ss join student1 as s
on ss.student_id = s.student_id
WHERE s.student_id = '1001'
GROUP BY student_id,s.student_name;