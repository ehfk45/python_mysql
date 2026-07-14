SELECT CAST('100' AS float) AS result;
-- cast(인수 as) 형변환 함수

SELECT cast('100' as unsigned) + '200' AS result;
SELECT '100' + 50;
SELECT '100원' + 50;
SELECT 'xyz' + 50; -- 문자는 0으로 변환

SELECT CAST(123 AS CHAR);

SELECT CONCAT(CAST(100 AS CHAR), '원');

SELECT CONCAT(100,'원');  -- 100을 자동으로 문자로 형변환 후 연산.alter

-- 자동형변환 이용as
select concat(customer_id, '번') 번호, first_name
from customer;

SELECT CAST('2026-07-13' AS DATE);

SELECT CAST('2026-07-13 09:30:00' AS DATETIME);

SELECT STR_TO_DATE('20260713', '%Y%m%d');

SELECT STR_TO_DATE('2026-07-13', '%Y-%m-%d');

SELECT CAST(123.987 AS SIGNED);

SELECT CAST(100 AS DECIMAL(10,2));

