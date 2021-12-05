 --1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name , monthly_salary 
from employee_salary
join salary on salary.id = employee_salary.salary_id
join employees on employees.id = employee_salary.employee_id;


-- 2. Вывести всех работников у которых ЗП меньше 2000.
select monthly_salary , employee_name 
from employee_salary
join salary on employee_salary.salary_id = salary.id
join employees on employee_salary.employee_id = employees.id
where salary.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary
from employee_salary
left join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id
where employees.employee_name is null; 

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select *-- employee_name, monthly_salary
from employee_salary
left join salary on employee_salary.salary_id = salary.id 
left join employees on employee_salary.employee_id = employees.id
where employees.employee_name is null and salary.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, salary.monthly_salary
from employees
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary is null;


--6. Вывести всех работников с названиями их должности.
 

--7. Вывести имена и должность только Java разработчиков.
select *-- employee_name, role_name 
from roles_employee
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id 
where role_name LIKE '%Java developer';

--8. Вывести имена и должность только Python разработчиков.
select *-- employee_name, role_name
from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Python developer';

--9. Вывести имена и должность всех QA инженеров.
select *-- employee_name,role_name
from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name 
from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id 
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name 
from roles_employee 
join employees on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary , role_name
from salary
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';
--12 (вариант №2)
select employee_name, monthly_salary, role_name 
from employees 
left join employee_salary on employee_salary.employee_id = employees.id
left join salary on salary.id = employee_salary.salary_id
left join roles_employee on roles_employee.employee_id = employees.id 
left join roles on roles_employee.role_id = roles.id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select * --employee_name, monthly_salary, role_name
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id  = employees.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%'

 --14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, salary.monthly_salary, roles.role_name
from salary
join employee_salary on employee_salary.salary_id = salary.id
join employees on employee_salary.employee_id = employees.id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Senior%';

 --15. Вывести зарплаты Java разработчиков
select salary.monthly_salary , roles.role_name
from salary
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer%';

-- 16. Вывести зарплаты Python разработчиков
select salary.monthly_salary, roles.role_name 
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%Python developer%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary, roles.role_name 
from employees 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id  = roles.id
where role_name like '%Junior Python developer%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary, roles.role_name 
from employees
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Middle JavaScript developer%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary, roles.role_name 
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.employee_id 
where role_name like '%Senior Java developer%';

-- 20. Вывести зарплаты Junior QA инженеров
select employees.employee_name, salary.monthly_salary, roles.role_name 
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%QA engineer%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary)
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary)
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary)
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%QA engineer%';

--24. Вывести максимальную ЗП QA инженеров 
select MAX(monthly_salary)
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like '%QA engineer%';

--25. Вывести количество QA инженеров
select COUNT(role_name)
from roles 
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.employee_id 
where role_name like '%QA engineer%';

--26. Вывести количество Middle специалистов.
select COUNT(role_name)
from roles 
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.employee_id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select COUNT(role_name)
from roles 
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.employee_id 
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary)
from salary 
join employee_salary on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
order BY salary.monthly_salary ASC ;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where monthly_salary between 1700 AND 2300
order by salary.monthly_salary ASC ;    

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name , roles.role_name, salary.monthly_salary 
from employees 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where salary.monthly_salary < 2300 
order by salary.monthly_salary ASC ; 

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where salary.monthly_salary = 1100 or salary.monthly_salary = 1500 or salary.monthly_salary = 2000
order by salary.monthly_salary ASC ;


























