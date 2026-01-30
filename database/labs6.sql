---1
select surname, job from employees e
where e.dept_id  = (select e.dept_id  from employees e
where surname like 'Johnson') and surname not like 'Johnson'
order by surname;


---2
select surname, job, d.dept_name  from employees e join departments d using(dept_id)
where e.dept_id  = (select e.dept_id  from employees e
where surname like 'Johnson') and surname not like 'Johnson'
order by surname;


---3
select surname, job, hire_date from employees e
where e.hire_date = (select min(hire_date) from employees e where e.job like 'LECTURER') and job like 'LECTURER';


---4
select d.dept_name, e.surname, e.hire_date from employees e join departments d using (dept_id)
where (e.dept_id , e.hire_date) in (select e1.dept_id, min(e1.hire_date) from employees e1 group by e1.dept_id)
order by d.dept_name;


---5
select d.dept_id, d.dept_name, d.address from departments d
where d.dept_id not in (select e.dept_id from employees e where e.dept_id is not NULL)


---6
select e.surname, e.job, e.salary from employees e
where e.emp_id not in (select e1.boss_id from employees e1 where e1.job like 'PHD_STUDENT') 
and e.job like 'PROFESSOR';


---7
select d.dept_name , count(*) as num_of_empl from employees e join departments d using(dept_id)
group by d.dept_name
having count(*) > (select count(*) from employees e1 join departments d2 using (dept_id)
where d2.dept_name like 'ADMINISTRATION'
group by e1.dept_id);


---8
select extract(year from hire_date) as year, count(*) as num_of_prof from employees e
where e.job like 'PROFESSOR'
group by e.hire_date 
having count(*) >= all(select count(*) from employees e1 where e1.job like 'PROFESSOR' group by extract(year from e1.hire_date))


--9
select dept_name, sum(salary+coalesce(add_salary, 0)) as "MAX_SUM"
from departments join employees using(dept_id)
group by dept_name 
having sum(salary+coalesce(add_salary, 0)) >= all(select sum(salary) 
from departments join employees using (dept_id) group by dept_name);

























