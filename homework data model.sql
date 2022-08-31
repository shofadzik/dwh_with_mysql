select FIRST_NAME, LAST_NAME, PHONE_NUMBER, DEPARTMENT_NAME, HIRE_DATE, SALARY, MIN_SALARY, MAX_SALARY
from hr_db.departments join hr_db.employees
on hr_db.departments.DEPARTMENT_ID = hr_db.employees.DEPARTMENT_ID 
join hr_db.jobs 
on hr_db.jobs.JOB_ID = hr_db.employees.JOB_ID 
order by FIRST_NAME

select FIRST_NAME, LAST_NAME, PHONE_NUMBER, DEPARTMENT_NAME, HIRE_DATE, SALARY, CITY
from hr_db.departments join hr_db.employees
on hr_db.departments.DEPARTMENT_ID = hr_db.employees.DEPARTMENT_ID 
join hr_db.locations
on hr_db.locations.LOCATION_ID  = hr_db.departments.LOCATION_ID 
where SALARY > 12000
order by FIRST_NAME

select EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, LAST_NAME
from hr_db.employees

select a.EMPLOYEE_ID , a.FIRST_NAME , b.MANAGER_ID, b.LAST_NAME
from hr_db.employees a join hr_db.employees b
on a.EMPLOYEE_ID = b.MANAGER_ID
