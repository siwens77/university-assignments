--task1
select surname, emp_id, UPPER(substr(surname, 1,2)) || emp_id as login from employees e
order by surname;

--task2
select surname from employees e
where surname like '%L%' or surname like '%l%'
order by surname;

--task3
select surname from employees e
where ((POSITION('L' in surname)<=length(surname)/2) and (POSITION('L' in surname)>0))
or ((POSITION('l' in surname)<=length(surname)/2) and (POSITION('l' in surname)>0))
order by surname;

--task4
select surname, salary as original_salary, round(salary*1.15) as increased_salary from employees e
order by surname;

--task5
select TO_CHAR(current_date, 'FMDay') as "Today is";

--task6
select TO_CHAR(DATE '2005-05-10', 'Day') as "I was born on";

--task7
select surname, TO_CHAR(hire_date,'FMDD FMMonth FMYYYY')|| ', ' ||TO_CHAR(hire_date, 'FMDay') as "hire_date" from employees e
order by surname;

--task8
select surname as "SURNAME", job as "JOB",age(DATE '01-01-2000', hire_date) as "EXPERIENCE_IN_2000" from employees e
where job in ('PROFESSOR', 'ASSISTANT', 'LECTURER')
order by "EXPERIENCE_IN_2000" desc;

--task9
select surname as "SURNAME", job as "JOB",age(DATE '01-01-2000', hire_date) as "EXPERIENCE_IN_2000" from employees e
where job in ('PROFESSOR', 'ASSISTANT', 'LECTURER') and extract(year from age('01-01-2000', hire_date))>10
order by "EXPERIENCE_IN_2000" desc;

--task10
select surname as "SURNAME", job as "JOB",extract(year from age(DATE '01-01-2000', hire_date)) as "EXPERIENCE_IN_2000" from employees e
where job in ('PROFESSOR', 'ASSISTANT', 'LECTURER') and extract(year from age('01-01-2000', hire_date))>10
order by "EXPERIENCE_IN_2000" desc;