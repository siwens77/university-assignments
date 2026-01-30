--exercise 1
create table projects(
project_id integer generated always as identity,
project_name character varying(200),
description character varying(1000),
start_date date default current_date,
end_date date,
budget numeric(10,2)
);

--exercise 2
insert into projects(project_name, description, start_date, end_date, budget) values(
'New Technologies Survey', 'A project aimed at reviewing the area
of advanced database technologies.', DATE '01-01-2018', null, 1500000),
('Advanced Data Analysis', 'Analyzing data obtained from various
organizations.', date '20-09-2017', date '01-10-2018', 2750000);


--exercise 3
insert into projects(project_id, project_name, description, start_date,end_date, budget) values(
55,'Creating backbone network','Expanding the organizations network
infrastructure.', date '01-06-2019', date '31-05-2020',5000000
);
--it does not work because it try to generate project_id =55 and it is automatically created =3


---exercise 4
insert into projects( project_name, description, start_date,end_date, budget) values(
'Creating backbone network','Expanding the organizations network
infrastructure.', date '01-06-2019', date '31-05-2020', 5000000
);
select project_id, project_name from projects;



--exercise 5
update projects 
set project_id =100
where project_name like 'Creating backbone network';
--it is not possible to edit column project_id



--exercise 6
create table projects_copy(
project_id,
project_name ,
description,
start_date,
end_date,
budget
) as select * from projects;


--exercise 7
insert into projects_copy(project_id, project_name, description, start_date,end_date, budget) values(
100, 'Creating mobile network', 'Expanding the organizations network
infrastructure – part 2.', date '01-06-2019', date '31-05-2020', 4000000
);
--it works now because copying table copy only data and not constraints



--exercise 8
delete from projects_copy
where project_name like 'Creating backbone network';


--exercise 9
alter table projects 
add number_of_emp numeric(3),
alter description set data type varchar(1500);


--exercise 10
select max(length(project_name)) from projects p;
alter table projects 
alter project_name set data type varchar(25);
--it can only be performed when max length of string in column is smaller than new length


--exercise 11
alter table projects 
rename column budget to project_budget;


--exercise 12
drop table projects_copy;



















