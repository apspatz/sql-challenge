create table dept_manager (
	dept_no varchar(4) not null,
	emp_no bigint not null,
	from_date varchar(15) not null,
	to_date varchar(15));

create table departments (
	dept_no varchar(4) not null,
	dept_name varchar(50) not null);

create table employees (
	emp_no bigint not null,
	birth_date varchar(15),
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	gender varchar(1),
	hire_date varchar(15) not null);

create table titles(
	emp_no bigint not null,
	title varchar(50) not null,
	from_date varchar(15) not null,
	to_date varchar(15));

create table dept_emp(
	emp_no bigint not null,
	dept_no varchar(4) not null,
	from_date varchar(15) not null,
	to_date varchar(15));
	
create table salaries(
	emp_no bigint not null,
	salary bigint not null,
	from_date varchar(15) not null,
	to_date varchar(15));