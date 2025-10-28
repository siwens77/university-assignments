select * from departments d;

select * from employees e;

select surname, job, salary*12 from employees e;

select surname, job, salary*12 as "yearly_income" from employees e;

select surname, job, salary+coalesce(e.add_salary, 0) as monthly_income from employees e 
order by salary+coalesce(e.add_salary, 0);

select name ||' '||surname as assistans from employees e
where Job = 'ASSISTANT'
order by name, surname;

select name || ' ' || surname as "employee", job, salary, dept_id from employees e 
where dept_id = 30 or dept_id = 40
order by salary desc;

select name || ' ' || surname as "employee", job, salary from employees e 
where salary>=1000 and salary <=2000
order by salary;

select name, surname from employees e 
where surname like '%son';

select name, surname from employees e 
where dept_id is null;

select name, surname, boss_id, salary from employees e 
where boss_id is not null and salary> 2000;

select name, surname, dept_id from employees e
where dept_id = 20 and (surname like 'W%' or surname like '%son');

select name, surname, salary+coalesce(e.add_salary, 0) as monthly_salary from employees e
where salary+coalesce(e.add_salary , 0) > 4000;

select 'Employee ' || name || ' ' || surname || ' works as ' || job ||
' and earns ' || salary+coalesce(e.add_salary, 0) as "employees" from employees e
order by surname, name;



