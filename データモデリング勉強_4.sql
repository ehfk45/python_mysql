CREATE TABLE employee_project (
    emp_id INT,
    emp_name VARCHAR(30),
    phone_numbers VARCHAR(100),
    project_id INT,
    project_name VARCHAR(50),
    dept_code CHAR(2),
    dept_name VARCHAR(30),
    PRIMARY KEY(emp_id, project_id)
);


INSERT INTO employee_project
VALUES
(1001,'홍길동','010-1111-1111,010-9999-9999',101,'쇼핑몰 구축','D1','개발부'),
(1001,'홍길동','010-1111-1111,010-9999-9999',102,'ERP 구축','D1','개발부'),
(1001,'홍길동','010-1111-1111,010-9999-9999',103,'모바일 앱','D1','개발부'),
(1002,'김철수','010-2222-2222',101,'쇼핑몰 구축','D2','영업부'),
(1002,'김철수','010-2222-2222',104,'CRM 구축','D2','영업부'),
(1003,'이영희','010-3333-3333',103,'모바일 앱','D1','개발부'),
(1003,'이영희','010-3333-3333',105,'AI 챗봇','D1','개발부'),
(1004,'박민수','010-4444-4444',102,'ERP 구축','D3','인사부'),
(1004,'박민수','010-4444-4444',106,'전자결재','D3','인사부'),
(1005,'최지훈','010-5555-5555,010-8888-8888',101,'쇼핑몰 구축','D2','영업부'),
(1005,'최지훈','010-5555-5555,010-8888-8888',107,'데이터웨어하우스','D2','영업부'),
(1006,'한소영','010-6666-6666',105,'AI 챗봇','D1','개발부'),
(1006,'한소영','010-6666-6666',108,'클라우드 전환','D1','개발부'),
(1007,'정우성','010-7777-7777',104,'CRM 구축','D4','마케팅부'),
(1007,'정우성','010-7777-7777',109,'홈페이지 리뉴얼','D4','마케팅부'),
(1008,'오세훈','010-8888-1111',106,'전자결재','D3','인사부'),
(1008,'오세훈','010-8888-1111',108,'클라우드 전환','D3','인사부'),
(1009,'강민지','010-9999-2222',107,'데이터웨어하우스','D5','전략기획부'),
(1010,'윤성호','010-1234-5678',109,'홈페이지 리뉴얼','D4','마케팅부'),
(1010,'윤성호','010-1234-5678',105,'AI 챗봇','D4','마케팅부');

SELECT * FROM employee_project;


CREATE TABLE member (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(30),
    password VARCHAR(100),
    password_changed_at DATETIME
);

CREATE TABLE password_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    password VARCHAR(100),
    changed_at DATETIME,

    FOREIGN KEY(member_id)
        REFERENCES member(member_id)
);

INSERT INTO member VALUES
(1001,'홍길동','pw1234',NOW()),
(1002,'김철수','abcd1234',NOW());

SELECT * FROM member;

update member 
set password = '0000'
WHERE member_id = 1001;

insert into password_history(member_id, password, changed_at) values(1001,'0000',now());