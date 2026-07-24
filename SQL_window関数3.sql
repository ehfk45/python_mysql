select customer_id, payment_date, amount,
	sum(amount) over(partition by customer_id
					order by payment_date asc
                    rows between 2 preceding and current row) "최근3일합계"
from payment
order by customer_id, payment_date;


select c.name, f.title, f.length,
	avg(f.length) over(partition by c.name
						order by f.length
                        rows between unbounded preceding and current row) "처음~현재행 러닝타임 누적평균"
from category c inner join film_category fc
	on c.category_id = fc.category_id
    inner join film f
		on fc.film_id = f.film_id;

    


with t1 as (
	select staff_id, date(payment_date) "날짜", sum(amount) "하루총매출액"
	from payment
	group by staff_id, date(payment_date)
)
select staff_id, 날짜, 하루총매출액,
	-- 하루총매출액 평균, 스텝아이디, 날짜오름차순, 최근5일
	avg(하루총매출액) over(partition by staff_id 
						order by 날짜 asc
						rows between 4 preceding and current row) "최근5일평균"
from t1;


with t1 as (
	select staff_id, date(payment_date) "날짜", sum(amount) "하루총매출액"
	from payment
	group by staff_id, date(payment_date)
),
t2 as (
	select staff_id, 날짜, 하루총매출액,
		-- 하루총매출액 평균, 스텝아이디, 날짜오름차순, 최근5일
        avg(하루총매출액) over(partition by staff_id 
							order by 날짜 asc
                            rows between 4 preceding and current row) "최근5일평균"
	from t1
)
select *
from (select *,
			row_number() over(partition by staff_id
							order by 최근5일평균 desc) rn
		from t2) t3
where t3.rn = 1;