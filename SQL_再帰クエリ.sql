CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    manager_id INT NULL,
    FOREIGN KEY (manager_id) REFERENCES emp(emp_id)
);


INSERT INTO emp VALUES
(1, 'CEO', NULL),

(2, '영업본부장', 1),
(3, '개발본부장', 1),
(4, '관리본부장', 1),

(5, '영업팀장', 2),
(6, '해외영업팀장', 2),

(7, '백엔드팀장', 3),
(8, '프론트팀장', 3),

(9, '인사팀장', 4),

(10, '신입사원A', 7),
(11, '신입사원B', 8);


WITH RECURSIVE emp_tree AS
(
    -- 시작점
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level -- 시작 행(ROOT)의 레벨값은 1
    FROM emp
    WHERE manager_id IS NULL -- 시작 행(ROOT)의 조건

    UNION ALL

    -- 하위 직원 계속 찾기, 끝날때 까지 재귀(자기 자신을 이용해서 같은 작업을 반복) 호출
    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        t.level + 1
    FROM emp e INNER JOIN emp_tree t
         ON e.manager_id = t.emp_id
)

SELECT *
FROM emp_tree;


WITH RECURSIVE emp_tree AS
(
    SELECT
        emp_id,
        emp_name,
        manager_id,
        emp_name AS path
    FROM emp
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        CONCAT(t.path,' > ',e.emp_name)
    FROM emp e
    JOIN emp_tree t
      ON e.manager_id=t.emp_id
)

SELECT *
FROM emp_tree;


WITH RECURSIVE numbers AS
(
    SELECT 1 AS num

    UNION ALL

    SELECT num+1
    FROM numbers
    WHERE num<10
)

SELECT *
FROM numbers;


WITH RECURSIVE dates AS
(
    SELECT DATE('2026-07-01') dt

    UNION ALL

    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM dates
    WHERE dt<'2026-07-10'
)

SELECT *
FROM dates;


with recursive m10 as (
	select date('2026-10-01') d
    union all
    select date_add(d, interval 1 day)
    from m10
    where d < '2026-10-31'
), 
holiday as (
	select date('2026-10-05') d, '개천절 대체공휴일' title
    union all
    select date('2026-10-09') d, '한글날' title
),
work_m10 as (
	select d, 
		case weekday(d) 
			when 0 then '월'
            when 1 then '화'
            when 2 then '수'
            when 3 then '목'
            when 4 then '금'
		end 요일
	from m10
	where weekday(d) < 5

	except

	select d, 
			case weekday(d) 
				when 0 then '월'
				when 1 then '화'
				when 2 then '수'
				when 3 then '목'
				when 4 then '금'
			end 요일
	from holiday
)

select *,
		concat(count(*) over(),'일') 공휴일제외
from work_m10;