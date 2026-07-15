select *
from actor
where upper(first_name) like '%z%' 
or upper(last_name) like '%Z%';

select *
from actor
where upper(concat(first_name)) like '%z%' ;

with a_n as (
	select upper(concat(first_name, last_name)) fullname
    from actor)
select fullname from a_n
where fullname like '%Z%';