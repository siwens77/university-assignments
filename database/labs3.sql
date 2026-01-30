--task1
select surname, salary, case
when salary<1500 then 'low paid'
when salary>1500 and salary<3000 then 'average paid'
when salary>3000 then 'well paid'
end as "label"
from employees e
order by surname;

select surname, salary, 'low paid' as label from employees e
where salary<1500
UNION
select surname, salary, 'average paid' as label from employees e
where salary between 1500 and 3000
UNION
select surname, salary, 'well paid' as label from employees e
where salary > 3000
order by surname;


--task2
select name, surname, dept_id as "department", salary
from employees e
where 
	case
		when dept_id = 10 then salary>=3670
		when dept_id = 20 then salary>=2475.03
		when dept_id = 30 then salary>=1623.33
		when dept_id = 40 then salary>=3350.00
	end
order by dept_id, salary;


--task3
select name || ' ' || surname as employee,
case when job in ('PROFESSOR', 'PRINCIPAL') then extract(year from age(date '01-01-2000', hire_date))
end as exp_2000,
case when job in ('LECTURER', 'ASSISTANT') then extract(year from age(date '01-01-2010', hire_date))
end as exp_2010,
case when job in ('PHD STUDENT', 'SECRETARY') then extract(year from age(date '01-01-2020', hire_date))
end as exp_2020
from employees e
order by exp_2000, exp_2010, exp_2020;


--task4
select boss_id
from employees e
intersect 
select emp_id
from employees e
order by boss_id;


--task5
select distinct dept_id, job from employees e
where dept_id is not null
order by dept_id, job;


--task6
select distinct extract(year from hire_date) as years from employees e
order by years;


--task7
select dept_id from departments d 
except
select dept_id as dept_id from employees e;