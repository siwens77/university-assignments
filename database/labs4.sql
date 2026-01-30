--task1
select max(salary) as maximum_salary, min(salary) as minimum_salary, max(salary)-min(salary) as difference from employees e;

--task2
select count(surname) as employees_without_dept from employees e 
where e.dept_id is null;

--task3
select count(surname) as professors from employees e 
where e.job in ('PROFESSOR');

--task4
select job, round( avg(salary),2) as job_average_salary from employees e 
group by job
order by avg(salary) desc;

--task5
select job, round(avg(salary+coalesce(e.add_salary ,0)),2) as job_average_salary, count(surname) as employees from employees e 
group by job
order by avg(salary) desc;

--task6
select job, round(avg(salary+coalesce(e.add_salary ,0)),2) as job_average_salary, count(surname) as employees from employees e 
group by job
having count(surname)!=1
order by avg(salary) desc;

--task7
select dept_id, count(coalesce (add_salary, 0)) from employees e 
where e.add_salary>0
group by dept_id
having dept_id is not null
order by dept_id;

--task8
select dept_id, count(coalesce (add_salary, 0)), avg(coalesce (add_salary, 0)) as avg_add_salary, 
sum(coalesce (add_salary, 0)) as sum_of_add_salaries from employees e 
where e.add_salary>0
group by dept_id
having dept_id is not null
order by dept_id;

--task9
select boss_id, count(boss_id) as number_of_subordinates from employees e
where boss_id is not Null
group by boss_id
order by boss_id;

--task10
select dept_id as department, 
count(*) filter(where job in ('PROFESSOR')) as no_of_prof, 
count(*) filter(where job in ('LECTURER')) as no_of_lecturers,
count(*) filter(where job in ('ASSISTANT')) as no_of_assistants, 
count(*) filter(where job not in ('LECTURER', 'ASSISTANT', 'PROFESSOR')) as no_of_others, 
count(job) as total
from employees e 
where dept_id is not null
group by dept_id
order by department;

--task11
select extract(year from hire_date) as year_of_employement, count(hire_date) from employees e 
group by year_of_employement
order by year_of_employement;

--task12
select (length(surname)) as surname_length, count(length(surname)) as numbe_of_surnames from employees
group by surname_length
order by surname_length;

--task13
select count(*) filter(where surname like '%a%' or surname like '%A%') as surname_with_a from employees;
select count(*) filter(where surname like '%e%' or surname like '%E%') as surname_with_e from employees;

--task14
select count(*) filter(where surname like '%a%' or surname like '%A%') as surnames_with_a,
count(*) filter(where surname like '%e%' or surname like '%E%') as surnames_with_e from employees;


select count(case when surname like '%a%' or surname like '%A%' then 1 end) as surnames_with_a,
count(case when surname like '%e%' or surname like '%E%' then 1 end) as surnames_with_e
from employees e;

--task15
select extract(year from hire_date) as year_of_employement, 
count(hire_date),
string_agg(surname, ',')
from employees e 
group by year_of_employement
order by year_of_employement;
