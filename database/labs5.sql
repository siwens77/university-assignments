----task1
select e.name, e.surname, d.dept_name, d.address  from employees e inner join departments d on e.dept_id = d.dept_id  
order by surname;

----taks2
select 'Employee ' || e.name ||' '|| e.surname ||' works in '|| d.dept_name ||' located at '|| d.address as sentence from employees e inner join departments d on e.dept_id = d.dept_id  
order by surname;

--task3
select e.surname, e.salary from employees e inner join departments d on e.dept_id = d.dept_id 
where d.address  like '47TH STR'
order by e.surname;

---task4
select count(*), round(avg(e.salary),2) from employees e inner join departments d on e.dept_id = d.dept_id 
where d.address  like '47TH STR'
group by e.dept_id;

---task5
select e.surname, e.job, e.salary, j.min_salary , j.max_salary 
from employees e  inner join jobs j on e.job = j."name"
order by e.surname;

--task6
select e.surname, e.job, e.salary, j.min_salary , j.max_salary 
from employees e  inner join jobs j on e.job = j."name"
where not(e.salary between j.min_salary and j.max_salary) 
order by e.surname;


----task7
select e.surname, e.job, e.salary, j.min_salary, j.max_salary 
from employees e inner join jobs j on (e.salary between j.min_salary and j.max_salary) and j."name" = 'ASSISTANT'
order by e.surname;


---task8
select d.dept_name,count(*) as employees_at_dept, sum(e.salary) as salaries_at_dept
from employees e inner join departments d on e.dept_id = d.dept_id
group by d.dept_name
order by d.dept_name;


---task9
select d.dept_name,count(*) as employees_at_dept, sum(e.salary) as salaries_at_dept
from employees e inner join departments d on e.dept_id = d.dept_id
group by d.dept_name
having count(*)>=2
order by d.dept_name;


---task10
select d.dept_name, case 
	when count(*) <=2 then 'small'
	when count(*) <=6 then 'medium'
	when count(*) >6 then 'big'
	end
from employees e inner join departments d on e.dept_id = d.dept_id
group by d.dept_name
order by d.dept_name;




