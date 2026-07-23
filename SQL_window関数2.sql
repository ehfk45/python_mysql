SELECT
    title,
    length,
    SUM(length) OVER(
        ORDER BY length
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_length
FROM film;

SELECT
    title,
    length,
    AVG(length) OVER(
        ORDER BY length
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS avg_length
FROM film;


SELECT
    title,
    length,
    SUM(length) OVER(
        ORDER BY length
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS remaining_length
FROM film;


WITH daily_sales AS
(
	SELECT
		p.staff_id, DATE(p.payment_date) AS pay_date, SUM(p.amount) AS daily_amount
	FROM payment p
	GROUP BY p.staff_id, DATE(p.payment_date)
),
rolling_sales as (
	select 
		staff_id, pay_date, daily_amount,
		sum(daily_amount) over(partition by staff_id order by pay_date
								rows between 6 preceding and current row) rolling_7days
	from daily_sales
),
ranked as (
	select *,
		row_number() over(partition by staff_id order by rolling_7days desc) rn
    from rolling_sales
)

select staff_id, date_sub(pay_date, interval 6 day) sday,  pay_date eday, rolling_7days
from ranked
where rn = 1;