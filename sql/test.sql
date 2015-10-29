CREATE TABLE student(
	student_id INTEGER PRIMARY KEY,
	name VARCHAR(10),
	year SMALLINT DEFAULT "1",
	dept_no INTEGER,
	major VARCHAR(20) NOT NULL
);


CREATE TABLE department(
	dept_no INTEGER AUTO_INCREMENT PRIMARY KEY,
	dept_name VARCHAR(20) UNIQUE,
	office VARCHAR(20),
	office_tel VARCHAR(13) NOT NULL
);

ALTER TABLE student CHANGE COLUMN major major VARCHAR(40) NOT NULL;
ALTER TABLE student ADD COLUMN gender VARCHAR(10);
ALTER TABLE department CHANGE COLUMN  dept_name dept_name VARCHAR(40) UNIQUE;
ALTER TABLE department CHANGE COLUMN office office VARCHAR(30);






ALTER TABLE student DROP COLUMN gender;
INSERT INTO student VALUES (20070002, 'James Bond', 3, 4, 'Business Administration');
INSERT INTO student VALUES (20060001, 'Queenie', 4, 4, 'Business Administration');
INSERT INTO student VALUES (20030001, 'Reonardo', 4, 2, 'Electronic Engineering');
INSERT INTO student VALUES (20040003, 'Julia', 3, 2, 'Electronic Engineering');
INSERT INTO student VALUES (20060002, 'Roosevelt', 3, 1, 'Computer Science');
INSERT INTO student VALUES (20100002, 'Fearne', 3, 4, 'Business Administration');
INSERT INTO student VALUES (20110001, 'Chloe', 2, 1, 'Computer Science');
INSERT INTO student VALUES (20080003, 'Amy', 4, 3, 'Law');
INSERT INTO student VALUES (20040002, 'Selina', 4, 5, 'English Literature');
INSERT INTO student VALUES (20070001, 'Ellen', 4, 4, 'Business Administration');
INSERT INTO student VALUES (20100001, 'Kathy', 3, 4, 'Business Administration');
INSERT INTO student VALUES (20110002, 'Lucy', 2, 2, 'Electronic Engineering');
INSERT INTO student VALUES (20030002, 'Michelle', 5, 1, 'Computer Science');
INSERT INTO student VALUES (20070003, 'April', 4, 3, 'Law');
INSERT INTO student VALUES (20070005, 'Alicia', 2, 5, 'English Literature');
INSERT INTO student VALUES (20100003, 'Yullia', 3, 1, 'Computer Science');
INSERT INTO student VALUES (20070007, 'Ashlee', 2, 4, 'Business Administration');
INSERT INTO department VALUES (1,'Computer Science', 'Engineering building', '02-3290-0123');
INSERT INTO department VALUES (2,'Electronic Engineering', 'Engineering building', '02-3290-2345');
INSERT INTO department VALUES (3,'Law', 'Law building', '02-3290-7896');
INSERT INTO department VALUES (4,'Business Administration', 'Administration building', '02-3290-1112');
INSERT INTO department VALUES (5,'English Literature', 'Literature building', '02-3290-4412');





REPLACE INTO department VALUES (2,'Electronic and Electrical Engineering','Engineering building','02-3290-2345');
INSERT INTO department VALUES(6,'Education','Education building','02-3290-2347');
UPDATE student SET dept_no=6,major='Education' WHERE name='Chloe';
DELETE FROM student WHERE name='Michelle';
DELETE FROM student WHERE name='Fearne';






select * from student where major='Computer Science';
select student_id,year,major from student;
select * from student where year=3;
select * from student where year=1 OR year=2;
select * from student s,department d where s.major='Business Administration' and s.dept_no=d.dept_no;






SELECT * FROM student WHERE student_id LIKE "%2007%";
SELECT * FROM student ORDER BY student_id;
SELECT major,avg(year) as AVG_year FROM student GROUP BY major HAVING AVG_year>3;
SELECT * FROM student WHERE student_id LIKE "%2007%" LIMIT 2;






SELECT * FROM roles r,movies m WHERE r.movie_id=m.id and m.name="Pi";
SELECT a.first_name,a.last_name FROM actors a,roles r,movies m WHERE a.id=r.actor_id and r.movie_id=m.id and m.name="Pi";
select first_name,last_name 
from actors a
join roles r1 on r1.actor_id = a.id
join roles r2 on r2.actor_id = a.id
join movies m1 on m1.id = r1.movie_id
join movies m2 on m2.id = r2.movie_id
where m1.name = 'Kill Bill: Vol. 1' and m2.name = 'Kill Bill: Vol. 2';
SELECT a.*,count(a.id) as COUNT FROM actors a,roles r,movies m WHERE a.id=r.actor_id and r.movie_id=m.id GROUP BY m.name HAVING COUNT ORDER BY COUNT DESC LIMIT 7;
SELECT genre,count(genre) as count FROM movies_genres GROUP BY genre having count ORDER BY count DESC LIMIT 3;
SELECT d.first_name,d.last_name, count(d.id) as count FROM directors d, directors_genres dg WHERE d.id=dg.director_id and dg.genre='Thriller' GROUP BY dg.genre HAVING count ORDER BY count DESC LIMIT 1;





SELECT g.grade FROM grades g JOIN courses c ON g.course_id=c.id WHERE  c.name='Computer Science 143';
SELECT s.name, g.grade FROM students s JOIN grades g ON s.id=g.student_id JOIN courses c ON g.course_id = c.id WHERE c.name = 'Computer Science 143' AND g.grade<= 'B-';
SELECT s.name, c.name, g.grade FROM students s JOIN grades g ON s.id=g.student_id JOIN courses c ON g.course_id=c.id WHERE g.grade<='B-';
SELECT DISTINCT c.name, count(*) howmany FROM students s JOIN grades g ON s.id=g.student_id JOIN courses c ON g.course_id = c.id GROUP BY c.name HAVING count(*) >= 2;





select name 
from movies
where year = 1995;

select count(*) people
from movies m
join roles on m.id = roles.movie_id
where m.name = "Lost in Translation";

select a.first_name, a.last_name, r.role
from movies m join roles r on m.id = r.movie_id
join actors a on a.id = r.actor_id
where m.name = "Lost in Translation";

select d.first_name, d.last_name, m.name
from movies m
join movies_directors md on m.id = md.movie_id
join directors d on d.id = md.director_id
where m.name = "Fight Club";

select count(*) maked
from movies m
join movies_directors md on m.id = md.movie_id
join directors d on d.id = md.director_id
where d.first_name = "Clint" and d.last_name = "Eastwood";

select m.name movie_name, d.first_name, d.last_name
from movies m
join movies_directors md on m.id = md.movie_id
join directors d on d.id = md.director_id
where d.first_name = "Clint" and d.last_name = "Eastwood";

select d.first_name, d.last_name
from movies_genres mg
join movies_directors md on mg.movie_id = md.movie_id
join directors d on d.id = md.director_id
where mg.genre = "Horror";

select a.first_name, a.last_name
from movies m
join movies_directors md on m.id = md.movie_id
join directors d on d.id = md.director_id
join roles r on r.movie_id = m.id
join actors a on a.id = r.actor_id
where d.first_name = "Christopher" and d.last_name = "Nolan";