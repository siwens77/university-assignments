-----1
with
	empl_salary_job(surname, salary, job) as 
	(select surname, salary, job from employees),
	av_job(average, job) as
	(select avg(salary), job from employees
	group by job )
select surname, job, salary, average as avg_salary_for_job from empl_salary_job e join av_job using(job)
where average<salary
order by surname;


----2
with
	sum_of_salary(dept_name, sum_salary) as
	(select d.dept_name, sum(e.salary) from departments d join employees e using(dept_id)
	group by d.dept_name )
select dept_name, sum_salary from sum_of_salary
fetch first 1 rows only;


-----3
with 
	boss(boss_surname, boss_salary, boss_id) as
	(select distinct b.surname, b.salary, b.emp_id  from employees b join employees e on e.boss_id = b.emp_id )
select e2.surname, e2.salary ,b2.boss_surname as boss_name, b2.boss_salary from boss b2 join employees e2 on e2.boss_id = b2.boss_id
where e2.salary >0.6*b2.boss_salary 
order by e2.surname;


------4
select e.surname, e.hire_date from employees e
order by e.hire_date 
fetch first 1 rows only;



------5
with 
	oldest(o_surname, o_date) as
	(select e.surname, e.hire_date from employees e
	order by e.hire_date 
	fetch first 1 rows only)
select e2.surname, e2.hire_date-o_date as num_of_days from oldest cross join employees e2
order by num_of_days;



--------6
with 
	grand(salary,digit) as
	(select word, digit from 
	(values(0,'zero'), (1, 'one'), (2,'two'), (3,'three'), (4,'four'), (5,'five')) digits(digit,word))
select surname || ' earns ' || g.salary || ' grand'  as sentence from employees e join grand g on g.digit = round(e.salary/1000)
order by e.surname;



--------7
with recursive emp_hierarchy(emp_id, name, surname, boss_id, path) as (
    select emp_id, name, surname, boss_id, name || ' '  || surname as path from employees
    where surname = 'Smith'    
    union all
    select e.emp_id, e.name, e.surname, e.boss_id,
        h.path || ' -> ' || e.name || ' ' || e.surname AS path 
        from employees e join emp_hierarchy h on e.boss_id = h.emp_id)
select name,surname,path from emp_hierarchy order by path;







