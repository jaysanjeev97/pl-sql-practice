create table salary(id int,name VARCHAR2(40),deptname VARCHAR2(50),age int);
DESCRIBE salary;
alter  table salary modify id primary key; 
alter table salary add place VARCHAR2(40);
alter table salary add salary int;
alter table salary add DOB DATE;
SELECT * FROM SALARY;
INSERT INTO SALARY VALUES (2934,'Jay','JAVA',22,'TAMBARAM',15000,'7-2-1991');
INSERT INTO SALARY VALUES (2931,'GANESH','JAVA',23,'MNAGAR',15500,'6-2-1997');
INSERT INTO SALARY VALUES (2933,'JEGA','ORACLE',26,'NAGAR',16000,'2-3-1991');
INSERT INTO SALARY VALUES (2932,'POTHI','JAVA',22,'TNAGAR',15600,'6-2-1997');
INSERT INTO SALARY VALUES (2935,'SELVA','FUNCTIONAL',21,'C NAGAR',12000,'7-5-1993');
INSERT INTO SALARY VALUES (2938,'VELU','C',32,'KK NAGAR',13000,'6-6-1996');
INSERT INTO SALARY VALUES (2930,'MARI','C++',22,'ZOO NAGAR',11000,'27-12-1995');
INSERT INTO SALARY(ID,NAME,SALARY)   VALUES (2222,'JOHNCENA',222222);

--insert into salary values(2929,'sgth','jquery',35,'shtrth',5364,to_char())
select * from salary where to_char(dob,'mmyyyy')='121995';



UPDATE SALARY SET DEPTNAME='ORACLE' WHERE ID =2934;
SELECT NAME,SALARY FROM SALARY;
SELECT*FROM SALARY ORDER BY SALARY;
SELECT*FROM SALARY ORDER BY SALARY DESC;

SELECT MIN(SALARY)  FROM SALARY;
SELECT MIN (NAME)AS NAMEOFNAME FROM SALARY;
   
SELECT MAX (SALARY) FROM SALARY; 

SELECT COUNT (NAME)FROM SALARY;

SELECT AVG (SALARY)FROM SALARY;

SELECT SUM(SALARY)FROM SALARY;

SELECT COUNT(NAME)AS NAMEOF , DEPTNAME FROM SALARY GROUP BY DEPTNAME ;

SELECT * FROM SALARY WHERE NAME LIKE '%y';

SELECT*FROM SALARY WHERE ID BETWEEN 2931 AND 2935;



---------------- TABLE 2 ---------
CREATE TABLE  SALARY2(ID INT ,NAME VARCHAR2(30),PROJECT VARCHAR2(60),MARK INT,foreign key (id) references salary (id));
DESCRIBE SALARY2;
ALTER TABLE SALARY2 MODIFY PROJECT PRIMARY KEY;
SELECT * FROM SALARY2;
INSERT INTO SALARY2 VALUES (2932,'JAY','MAKEMYSHOW',70);
INSERT INTO SALARY2 VALUES(2934,'KARTHIK','MAKEMYTRIP',65);
INSERT INTO SALARY2 VALUES(2930,'GANESH','MAKETRIP',55);
INSERT INTO SALARY2 VALUES(2932,'KART','MAKEMYBUS',45);
INSERT INTO SALARY2 VALUES(2935,'THIK','ULIKE',65);
INSERT INTO SALARY2 VALUES(2938,'GOWTHEM','MYNTRA',45);
INSERT INTO SALARY2 VALUES(2931,'VEL','BUS',60);
INSERT INTO SALARY2 VALUES(2938,'KARTHIK','TRAIN',75);
INSERT INTO SALARY2 VALUES(2934,'SELVA','CYCLE',85);
INSERT INTO SALARY2 VALUES(2934,'KARTHIKRAJA','MOTAR',65);
UPDATE SALARY2 SET id=2933 WHERE PROJECT= 'MOTAR';
SELECT * FROM SALARY2;
select id,name from salary2;
ALTER TABLE SALARY2 MODIFY id int FOREIGN KEY REFERENCES SALARY(ID);
drop  table salary2;


----joins------
