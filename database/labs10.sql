--exercise 1
--there is no constraints right now

--exercise 2
alter table projects
add constraint pk_projects primary key(project_id),
add constraint uk_projects_name unique(project_name),
alter column project_name set not null,
alter column start_date set not null,
add constraint chk_projects_end_start_date check(end_date>start_date),
add constraint chk_projects_budget check(project_budget>0),
add constraint chk_projects_no_of_emp check(number_of_emp >=0);

--exercise 3
alter table projects 
alter column number_of_emp set not null;
--cannot do this because it contains nulls

update projects 
set number_of_emp =0
where number_of_emp is null;

alter table projects 
alter column number_of_emp set not null;

--exercise 4
alter table projects
add manager_id numeric(4) generated always as identity,
add constraint projects_fk_emps foreign key(manager_id) references employees(emp_id) on delete restrict;

--exercise 5
--update projects
--set manager_id = 16
--where project_name= 'Advanced Data Analysis';
--cannot be done Detail: Klucz (manager_id)=(16) nie występuje w tabeli "employees".

--exercise 6
update projects
set manager_id = (select emp_id from employees e where name like 'Mark' and surname like 'Clark')
where project_name = 'Advanced Data Analysis';

--delete from employees 
--where name like 'Mark' and surname like 'Clark'
--cannot be done   Detail: Klucz (emp_id)=(180) ma wciąż odwołanie w tabeli "projects".

--exercise 7
create table assignments(
project_id integer not null,
emp_id numeric(4) not null,
function varchar(100) not null,
start_date date default current_date not null,
end_date date,
salary numeric(8,2) not null,
constraint pk_assigment primary key(project_id, emp_id, start_date),
constraint ass_fk_pr foreign key (project_id) references projects(project_id),
constraint ass_fk_emp foreign key (emp_id) references employees(emp_id),
constraint ass_func check(function in ('designer', 'tester', 'programmer')),
constraint ass_end_date check(end_date>start_date),
constraint ass_salary check(salary>0));


--exercise 8
insert into assignments values 
(1,(select emp_id from employees e where surname like 'Clark'), 'designer', date '2000-01-01', current_date, 1000),
(2,(select emp_id from employees e where surname like 'Smith'), 'tester', date '2010-01-01', current_date, 2000),
(3,(select emp_id from employees e where surname like 'Jones'), 'programmer', date '2020-01-01', current_date, 3000),
(4,(select emp_id from employees e where surname like 'Wilson'), 'designer', date '2023-01-01', current_date, 4000)
;

--exercise 9
--insert into assignments values 
--(10,(select emp_id from employees e where surname like 'Clark'), 'walker', date '2000-01-01', current_date, 1000)
--;
--cannot be done BŁĄD: nowy rekord dla relacji "assignments" narusza ograniczenie sprawdzające "ass_func"

--exercise 10
alter table assignments
drop constraint ass_func CASCADE;

insert into assignments values 
(1,(select emp_id from employees e where surname like 'Johnson'), 'walker', date '2005-01-01', current_date, 7000)
;





--exercise 1
create view professors (name,surname, hire_date,salary, add_salary, add_percent) as
select name,surname, hire_date,salary,add_salary, coalesce(add_salary)*100/salary from employees
where job like 'PROFESSOR'
order by surname;

--exercise 2
create view departments_total(dept_id,department, avg_salary, num_of_empl) as
select dept_id, dept_name, avg(salary), count(*) from departments d inner join employees e using(dept_id)
group by dept_id;

--exercise 3
select surname, name, salary, department, avg_salary, salary-avg_salary from employees inner join departments_total using
(dept_id)
where salary>avg_salary
order by surname;

--exercise 4
select department, num_of_empl from departments_total 
where num_of_empl = (select max(num_of_empl) from departments_total);

--exercise 5
create view Emps_and_bosses(employee, emp_salary, boss,boss_salary) as
select e.surname || ' ' ||e.name , e.salary, b.surname || ' ' || b.name, b.salary from employees e inner join employees b
on (e.boss_id = b.emp_id)
where b.salary > e.salary
order by 1;





