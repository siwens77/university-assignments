------1
insert into employees(emp_id, name,surname, job, boss_id, hire_date, salary, add_salary, dept_id)
values (300, 'Jack', 'Snow', 'PROFESSOR', 
(select emp_id from employees e1
where surname like 'Smith'),date '01-05-2013', 4750, null, (select dept_id from departments where dept_name like 'EXPERT SYSTEM')),
(310, 'Robin', 'Cook', 'PROFESSOR', 
(select emp_id from employees e1
where surname like 'Smith'),date '15-09-2016', 3500, 1250, (select dept_id from departments where dept_name like 'ALGORITHMS')),
(320, 'Francis', 'Dormand', 'ASSISTANT', 
(select emp_id from employees e1
where surname like 'Jones'),date '01-01-2018', 3900, null, (select dept_id from departments where dept_name like 'ALGORITHMS'));

select * from employees
where emp_id in (300,310,320);

-------2
insert into departments (dept_id, dept_name)
values(70, 'DATABASE SYSTEMS');

select * from departments d
where dept_id = 70;

--------3
update employees
set dept_id = (select dept_id from departments d where dept_name like 'DATABASE SYSTEMS')
where emp_id in (300,310,320);

select surname, name, salary, add_salary from employees join departments using(dept_id )
where dept_id = 70
order by surname;



--------4
update employees set (salary, add_salary) = (salary*1.1, coalesce(add_salary*1.2, 100))
	where dept_id=70;

select surname, name, salary, add_salary from employees where dept_id=70;


--------5
update employees set salary = salary +
(select 0.1*avg(e1.salary) from employees e1 join departments using(dept_id) where dept_name like 'ADMINISTRATION'
group by dept_id)
where dept_id = 70;

select surname, name, salary from employees where dept_id=70
order by surname;


-------6
delete from departments
where dept_name like 'DATABASE SYSTEMS';
----SQL Error [23503]: BŁĄD: modyfikacja lub usunięcie na tabeli "departments" narusza klucz obcy "fk_department" tabeli "employees"
--- three employees in different table are related to this one (their FK are relaeted to database systems)


-----7
delete from employees 
where salary < 5000
and dept_id = (select dept_id from departments where dept_name = 'DATABASE SYSTEMS');

update employees set dept_id = null
where dept_id = (select dept_id from departments where dept_name = 'DATABASE SYSTEMS');

select * from employees e;

------8
delete from departments
where dept_name like 'DATABASE SYSTEMS';

select * from departments d ;


-----9
delete from employees 
where emp_id = (select emp_id from employees where name like 'Jack' and surname like 'Snow')

select * from employees order by emp_id











