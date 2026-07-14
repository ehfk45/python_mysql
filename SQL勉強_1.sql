create database test;

show tables; 

create table product(
	id int auto_increment primary key,
	name varchar(30),
    price int
);

-- DDL create / drop / alter
-- DML insert / update / delete / select

insert into product(name, price)
values('마우스',3000); 

select * from product;

update product
set price = 50000
where id = 1;
delete from product where id = 1;

truncate product;


CREATE TABLE product2 (
    id INT AUTO_INCREMENT PRIMARY KEY, -- 기본키는 자동으로 NOT NULL
    name VARCHAR(30), -- NOT NULL 옵션이 없으면 NULL값 허용
    price INT NOT NULL -- price는 NULL 값을 허용하지 않는다
);

INSERT INTO product(name)
VALUES('모니터');
INSERT INTO product(name, price)
VALUES('카메라', NULL);
-- 둘 다 정상적으로 price값은 NULL로 저장된다.

select * from product;

INSERT INTO product2(name, price)
VALUES('마우스', NULL);

drop table product2;

-- insert, update, delete 실행 후 실행된 결과 행의 수를 반환
-- select 실행후 결과 셋을 반환 