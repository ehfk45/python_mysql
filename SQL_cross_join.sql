CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30)
);
CREATE TABLE subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(30)
);

INSERT INTO student VALUES
(1, '홍길동'),
(2, '김철수'),
(3, '이영희');
INSERT INTO subject VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Power BI');


SELECT *
FROM student AS s1 CROSS JOIN student AS s2
WHERE s1.student_name <> s2.student_name;
