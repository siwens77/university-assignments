----1
SELECT d.dept_name, d.dept_name, d.address 
from departments d
WHERE NOT EXISTS
				(SELECT 1 FROM employees e
				WHERE e.dept_id = d.dept_id );

----2
select e.surname, e.job, e.salary from employees e
where e.salary >  (select AVG(e2.salary) from employees e2 where e2.job =e.job)
order by e.surname;


----3
select e.surname, e.job, e.salary, (select avg(e3.salary) from employees e3
where e3.job = e.job) from employees e
where e.salary >  (select AVG(e2.salary) from employees e2 where e2.job =e.job)
order by e.surname;


----4
select e.surname, e.job, e.salary from employees e
where e.salary > 0.6*(select b.salary from employees b
where b.emp_id = e.boss_id )
order by e.surname;



-----5
select MAX(dept_sum) as max_sum from (select sum(e.salary) as dept_sum from employees e 
group by e.dept_id);



------6
select d.dept_name, sum(e2.salary) from departments d join employees e2 using(dept_id)
group by d.dept_name 
having sum(e2.salary) = (select MAX(dept_sum) as max_sum from 
(select sum(e.salary) as dept_sum from employees e 
	group by e.dept_id));



------7
select d.dept_name, e3.name ,e.max_salary 
from departments d join (select dept_id, max(e.salary) as max_salary from employees e
group by e.dept_id) e using(dept_id) 
join (select e2.surname as name, e2.salary from employees e2) e3 on e3.salary = e.max_salary 
order by d.dept_name;



-------8
select e.surname, e.salary from employees e
where 3>(select count(*) from employees e2 where e2.salary >e.salary)
order by  e.salary desc;











