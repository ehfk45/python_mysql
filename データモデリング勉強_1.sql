CREATE TABLE employee (
    emp_no      CHAR(4) PRIMARY KEY,
    emp_name    VARCHAR(20),
    address     VARCHAR(100),
    phone       VARCHAR(20),
    dept_no     CHAR(3),
    dept_name   VARCHAR(30),
    dept_loc    VARCHAR(30)
);

INSERT INTO employee VALUES
('E001', '홍길동', '서울', '010-1111-1111', 'D01', '영업부', '서울');

INSERT INTO employee VALUES
('E002', '김철수', '인천', '010-2222-2222', 'D01', '영업부', '서울');

INSERT INTO employee VALUES
('E003', '이영희', '부산', '010-3333-3333', 'D02', '개발부', '판교');

INSERT INTO employee VALUES
('E004', '박민수', '대전', '010-4444-4444', 'D02', '개발부', '판교');

INSERT INTO employee VALUES
('E005', '최지훈', '광주', '010-5555-5555', 'D03', '인사부', '서울');

SELECT * FROM employee;


INSERT INTO employee
VALUES
('E006', '마이클', '서울', '000', 'D01', '영업', '서울');

DELETE
FROM employee
WHERE emp_no = 'E005';