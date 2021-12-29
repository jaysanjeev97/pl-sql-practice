CREATE TABLE student (id int,name VARCHAR(20),age int);
describe student;
Alter TABLE student ADD department VARCHAR (30) ADD gender VARCHAR(7);

INSERT INTO student VALUES (2932,'JAY',25,'PETRO','MALE');
SELECT*FROM student;
INSERT INTO student VALUES (2933,'POTHI',25,'PETRO','MALE');    

ALTER TABLE STUDENT DROP COLUMN department;
DROP TABLE STUDENT;