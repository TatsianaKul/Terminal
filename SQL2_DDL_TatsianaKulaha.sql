--Создать таблицу employees
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

--Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values ('Robert Brown'),
       ('Justin Gutierrez'),
       ('Mary Porter'),
       ('Sarah Torres'),
       ('Ashley Moss'),
       ('Raymond Freeman'),
       ('Eleanor Nelson'),
       ('Dawn Harper'),
       ('Marcus Floyd'),
       ('Paul Clark'),
       ('Jeremy Johnson'),
       ('Yolanda Moore'),
       ('Karen Reynolds'),
       ('Sandra Lynch'),
       ('Steven Diaz'),
       ('Phyllis Hawkins'),
       ('Michael Anderson'),
       ('Alice Chavez'),
       ('Robert Williams'),
       ('Kelly Terry'),
       ('James Thomas'),
       ('Billy Wallace'),
       ('Edgar Myers'),
       ('Melissa Thompson'),
       ('Carole Alvarado'),
       ('Lisa Johnson'),
       ('Shirley Green'),
       ('Rhonda Collier'),
       ('Laura Peterson'),
       ('Annie Williamson'),
       ('Charlene Patterson'),
       ('Stephen Campbell'),
       ('Virginia Jones'),
       ('Patricia Gordon'),
       ('Ernest White'),
       ('James Larson'),
       ('Carl Fitzgerald'),
       ('Reginald Lucas'),
       ('Cindy Powell'),
       ('Scott Hughes'),
	   ('Christine Scott'),
       ('Laurie Gibson'),
       ('Darren Moore'),
       ('Nancy Miller'),
       ('Judy Burton'),
       ('Christine Johnson'),
       ('Kristen Graham'),
       ('Bertha Williams'),
       ('Craig Richards'),
       ('Edward Chambers'),
       ('John Jennings'),
       ('Bessie Flores'),
       ('Larry Parker'),
       ('Walter Thomas'),
       ('Robin Robertson'),
       ('Sharon Graves'),
       ('Paul Hernandez'),
       ('Timothy White'),
       ('Glenda Reid'),
       ('Rebecca Johnson'),
       ('Connie Smith'),
       ('John Watson'),
       ('Micheal Parker'),
       ('Crystal Young'),
       ('Brian Richardson'),
       ('Charles Smith'),
       ('Stanley Fuller'),
       ('Kathleen Cooper'),
       ('Robert Benson'),
       ('Wanda Stewart');

select * from employees;
--delete from employees
--where id > 71;

--Создать таблицу salary
create table salary(
	id serial primary key,
	monthly_salary int not null
);
--Наполнить таблицу salary 16 строками:
insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);

select * from salary;


--Создать таблицу employee_salary
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);
--Наполнить таблицу employee_salary 40 строками:
insert into employee_salary (employee_id, salary_id)
values (3, 1),
	   (4, 2),
	   (5, 3),
	   (6, 4),
	   (7, 5),
	   (8, 6),
	   (9, 7),
	   (10, 8),
	   (11, 9),
	   (12, 10),
	   (13, 11),
	   (14, 12),
	   (15, 13),
	   (16, 14),
	   (17, 15),
	   (18, 1),
	   (19, 2),
	   (20, 3),
	   (21, 4),
	   (22, 5),
	   (23, 6),
	   (24, 7),
	   (25, 8),
	   (26, 9),
	   (27, 10),
	   (28, 11),
	   (29, 12),
	   (30, 13),
	   (31, 14),
	   (32, 15),
	   (81, 1),
	   (82, 2),
	   (83, 3),
	   (84, 4),
	   (85, 5),
	   (86, 6),
	   (87, 7),
	   (88, 8),
	   (89, 9),
	   (90, 10);
	   
select * from employee_salary;

--Создать таблицу roles
create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;
--Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name type varchar(30);
--alter table <table name> alter column <column name> <column type> 
--поменять с varchar на int 
--alter table roles alter column role_name type int;

--Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');

select * from roles;
--Создать таблицу roles_employee
create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id)
		references employees (id),
	foreign key(role_id)
		references roles (id)
);
--Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values (1, 5),
	   (2, 6),
	   (33, 7),
	   (34, 8),
	   (35, 9),
	   (36, 10),
	   (37, 1),
	   (38, 3),
	   (39, 4),
	   (40, 11),
	   (41, 12),
	   (42, 17),
	   (43, 18),
	   (44, 19),
	   (45, 20),
	   (46, 4),
	   (47, 6),
	   (48, 8),
	   (49, 10),
	   (50, 12),
	   (51, 13),
	   (52, 14),
	   (53, 17),
	   (54, 5),
	   (55, 7),
	   (56, 9),
	   (57, 6),
	   (58, 3),
	   (59, 12),
	   (60, 11),
	   (61, 13),
	   (62, 14),
	   (63, 15),
	   (64, 1),
	   (65, 2),
	   (66, 6),
	   (67, 9),
	   (68, 10),
	   (69, 15),
	   (70, 19);
	  
select * from roles_employee;