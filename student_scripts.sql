create database school_db;

use school_db;

-- DDL (Data Definition Language)
-- 1. Create table
create table if not exists students (
	id int auto_increment primary key,
    full_name varchar(40) not null,
    birthday date,
    gpa decimal(3, 2)
);

-- 2. Alter table: add column
alter table students add column phone varchar(12);

-- 3. Alter table: modify column
alter table students modify column birthday varchar(40);

-- 4. Alter table: drop column
alter table students drop column phone;

-- 5. Drop table
drop table students;

-- DML (Data Manipulation Language)
-- 1. Insert
insert into students (full_name, birthday, gpa) values
('Nguyen Van A', '1990-02-15', 8.5),
('Nguyen Thi B', '1994-04-20', 9.5),
('Nguyen Van C', '1992-06-18', 8.5)
;

-- 2. Select all fields
select * from students;

-- 2.2. Select specific fields
select id, full_name, gpa from students;

-- 2.3. Select with alias fields
select id as student_id,
		full_name as student_name,
        gpa as student_gpa
from students;

-- 2.4. Select with where operator
select full_name
from students
-- where full_name like '%Van%'; 
-- where full_name like 'Nguyen Van%';
where full_name like '%A';

-- 3. Order By & Limit
select * from students
order by gpa desc, full_name asc;

select * from students
where gpa > 3.5
order by gpa desc
limit 2;

-- 4. Update data
update students set gpa = 7.5
where id = 2;

select * from students;

-- 5.1. Delete one or many rows
delete from students
-- where id = 2 or id = 3;
where id in (4, 5, 6);

-- 5.2. Delete all rows (do not drop table)
truncate table students;

-- 5.3. Soft delete -> update statement
-- 5.3.1. Prepare for soft delete
alter table students add column is_active bit;
select * from students;

insert into students (full_name, birthday, gpa, is_active) values
('Nguyen Van A', '1990-02-15', 8.5, true),
('Nguyen Thi B', '1994-04-20', 9.5, true),
('Nguyen Van C', '1992-06-18', 8.5, true)
;

-- 5.3.2. Execute soft delete
update students set is_active = 0
where id = 2;

-- check data again after softing delete
select * from students;
select * from students where is_active = 1;




