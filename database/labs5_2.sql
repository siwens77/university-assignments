--task1
select e.name , e.surname , d.dept_name, d.address  
from departments d right outer join employees e using(dept_id) 
order by e.surname;

--task2
select e.name , e.surname , 
case when d.dept_name is null then 'no department' else d.dept_name end, 
case when d.address is null then 'no department' else d.address end
from departments d right outer join employees e using(dept_id) 
order by e.surname

--task3
select 
case when e.name is null then 'no employee' else e.name end, 
case when e.surname is null then 'no employee' else e.name end,  
case when d.dept_name is null then 'no department' else d.dept_name end,
case when d.address is null then 'no department' else d.address end 
from departments d full join employees e using(dept_id) 
order by e.surname

--task4
select dept_name as "departemnt", count(e.name) as "employees_at_dept",
sum(e.salary) as "salaries_at_dept" 
from departments d left outer join employees e using(dept_id)
group by d.dept_name
order by dept_name;

--task5
select e.surname as "employee", 
case when b.surname is null then 'no boss' else b.surname end as "boss"
from employees e left join employees b 
on e.boss_id  = b.emp_id 
order by e.surname;

--task6
select e.surname as "employee", 
case when b.surname is null then 'no boss' else b.surname end as "boss"
from employees e left outer join employees b 
on b.emp_id = e.boss_id
where b.surname in ('Smith', 'Wilson') or b.surname is null
order by employee;

--task7
select e.surname as "employee",
e.salary*12+coalesce(e.add_salary, 0) as "emp_annual_salary",
b.salary*12+coalesce(b.add_salary, 0)-e.salary*12+coalesce(e.add_salary, 0) as "less_than_boss"
from employees e inner join employees b on b.emp_id = e.boss_id
order by employee;


--task8
select b.surname as "boss_id", count(e.surname) as "subordinates"
from employees e full outer join employees b 
on e.boss_id = b.emp_id 
where b.surname is not null
group by b.surname
order by b.surname;


--task9
select e.name || ' ' || e.surname as "employee", 
d.dept_name as "employee_department", 
b.name || ' ' || b.surname as "boss",
d2.dept_name as "boss_department"
from employees e join departments d using(dept_id)
join employees b on e.boss_id = b.emp_id
join departments d2 on b.dept_id =d2.dept_id
order by e.name;


--task10
select e.name || ' ' || e.surname as "employee", 
case when d.dept_name is null then 'no department' else d.dept_name end as "employee_department", 
case when b.name is null then 'no boss' else b.name || ' ' || b.surname end as "boss",
case when d2.dept_name is null then 'no department' else d2.dept_name end as "boss_department"
from employees e left join departments d using(dept_id)
left join employees b on e.boss_id = b.emp_id
left join departments d2 on b.dept_id =d2.dept_id
order by e.name;


--task11
select count(*) as "rows_of_cartesian_product" from departments d cross join employees e cross join jobs j ;








