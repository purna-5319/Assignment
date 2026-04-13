-- Create database
create database Digital_Library;
use Digital_Library;

-- Tables Creation
create table Books (book_id int primary key,book_name varchar(100),author varchar(100),category varchar(50));

create table Students(s_id int primary key,s_name varchar(100),last_borrowed_date date);

create table IssuedBooks(issue_id int primary key,book_id int,
s_id int,IssueDate date,ReturnDate date, 
foreign key(book_id) references Books(book_id) on delete cascade,
foreign key(s_id) references Students(s_id) on delete cascade);

-- insert sample data
insert into Books values (1,'Java Programming','James gosling','Programming'),
(2,'Data Structures','Mark Allen','Programming'),
(3,'Python','Guido van rossum','Programming'),
(4,'Physics','Isaac Newton','Science'),
(5,'Chemistry Basics','neils bohr','Science'),
(6,'world History','John Smith','History'),
(7,'Mathematics for Engineers','Euler','Mathematics'),
(8,'English Literature','William Shakespeare','Literature'),
(9,'The Silent Patient','Alex Michaelidis','Fiction'),
(10,'The Book Theif','Markus Zusak','Fiction');

select * from Books;

insert into Students values (11,'Purna Latha','2026-03-21'),
(12,'Bhanu Priya','2026-01-12'),
(13,'Sahana','2025-03-07'),
(14,'Harsha Vardhan','2022-06-21'),
(15,'Renuka','2021-01-01'),
(16,'Ananya Singh','2023-04-17'),
(17,'Arjun Rao','2024-05-01'),
(18,'Sneha Gupta','2026-03-04'),
(19,'Deepika Pande','2025-06-25'),
(20,'Nirmitha Reddy','2026-02-26');

select * from Students;

insert into IssuedBooks values(1,1,11,'2026-03-21',null),
(2,2,12,'2024-11-10','2024-11-20'),
(3,3,13,'2025-03-07',null),
(4,4,14,'2022-06-21','2022-06-26'),
(5,5,15,'2021-12-01','2021-12-10'),
(6,6,16,'2023-11-15',null),
(7,7,17,'2024-03-01',null),
(8,8,20,'2025-02-26','2025-03-26'),
(9,9,13,'2023-03-12','2023-03-16'),
(10,10,16,'2023-04-05','2023-04-17');
insert into IssuedBooks values
(11,1,12,'2025-03-01',null),
(12,2,13,'2025-02-20','2025-02-25'),
(13,3,14,'2025-01-15','2025-03-10'),
(14,4,15,'2025-03-07',null);

select * from IssuedBooks;

-- Overdue logic 
select s.s_id as Student_Id, s.s_name as Student_Name, b.book_name as Title, i.IssueDate
from Students s join IssuedBooks i 
on s.s_id=i.s_id join Books b on i.book_id=b.book_id
where IssueDate < curdate()-interval 14 day and ReturnDate is null;

-- Popularity Index  
select b.category as Popular_Genre,count(*) as Borrowed_Times from Books b join IssuedBooks i 
on i.book_id=b.book_id group by b.category order by Borrowed_Times desc limit 1;

-- Data Cleanup
alter table Students add column status varchar(10);
update Students set status = 'Inactive' where last_borrowed_date < curdate()-interval 3 year;
update Students set status = 'Active' where status is null;
select * from Students where status='Inactive';
delete from Students where status='Inactive';
