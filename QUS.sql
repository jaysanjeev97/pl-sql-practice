create table region(id number primary key,name varchar2(20));
describe region
select * from region;

-----country-----

create table countries(id varchar2(50) primary key,name varchar2(50),region_id number,foreign key(region_id) references region(id));
select * from countries;

-----location-------

create table location(id varchar(50) primary key,street_address varchar(50),postal_code varchar(50),city varchar(50),
state varchar(50),country_id varchar(50),foreign key(country_id) references countries(id));
describe location;

------department-------

Create table department(id number primary key,name varchar(50),location_id varchar(50),
foreign key(location_id) references location(id));
describe department;
select * from department;

-----------emplyoees-----
Create table employeess(id int primary key,first_name varchar(50),last_name varchar(50),email varchar(50),phone_number varchar(50),
hire_datet date,salary int,date_of_birth date,department_id int ,foreign key(department_id) references department(id));
DESCRIBE employeess;

------manager------
Create table manager(employee_id number,department_id number,primary key(employee_id,department_id),
foreign key(employee_id) references employeess(id),foreign key(department_id) references department(id));
DESCRIBE manager;


region-------

insert into Region values(1,'Europe');
insert into region values(2,'Americas');
insert into region values(3,'Asia');
alter table region modify name varchar2(30);
insert into region values(4,'Middle east and africa');
 SELECT * FROM  region;

-----country-----


insert into Countries values('AR','ARgentina',2);
insert into countries values('AU','Australia',3);
insert into countries values('BE','Belgium',1);
insert into countries values('BR','BRAZIL',2);
insert into countries values('CA','Canada',2);
insert into countries values('CH','Switzerland',1);
insert into countries values('CN','China',3);
insert into countries values('DE','Germany',1);
insert into countries values('DK','Denmark',1);
insert into countries values('EG','Egpty',4);
insert into countries values('FR','France',1);
insert into countries values('HK','Hongkong',3);
insert into countries values('IL','Isreal',4);
insert into countries values('IN','India',3);
insert into countries values('IT','Italy',1);
insert into countries values('JP','Japan',3);
insert into countries values('KW','Kuwait',4);
insert into countries values('Mx','Mexico',2);
insert into countries values('NG','Nigeria',4);
insert into countries values('NL','Netherlands',1);
insert into countries values('SG','Singapore',3);
insert into countries values('UK','United Kingdom',1);
insert into countries values('US','United States of America',2);
insert into countries values('ZM','ZAMBIA',4);
insert into countries values('zw','Zimbabwe',4);
insert into countries values('OX','Oxford',4);
insert into countries values('eu','Europe',1);
select * from countries;

location--------

insert into location values(1000, '1297 via cola di rie',989, 'Roma','Roma','IT');
insert into location values(1100,'93091 Calle della testa', 10934,'Venice','venice','IT');
insert into location values(1200,'2017 ShinJUKU-KU',1689,'Tokyo','Tokyo prefecture','JP');
insert into location values(1300,'9450 Kamya-Cho',6823,'Hiroshima','hiroshi','JP');
insert into location values(1400,'2014 Jabberwocky RD', 26192, 'South lake','Texas','US');
insert into location values(1500,'2011 Interiors BLVD',99236,'South san Francisco','California','US');
insert into location values(1600,'2007 Zagora ST',50090,'South bruncswick','New Jersey','US');
insert into location values(1700,'2004 Charade Rd',98199,'Seattle','washington','US');
insert into location values(1800,'147 Spadna Ave','MSV 2L7','Toronto','Ontario','CA');
insert into location values(1900,'6092-BoXwood ST','YSW 9T2','Whitehorse','Yukon','CA');
insert into location values(2000,'40-5-12 Laogianggen',190518,'Beijing','Beijing','CN');
insert into location values(2100, '1298 VILEPARLE ed',490231,'BOMBAY','Maharasthra','IN');
insert into location values(2200,'12-98 Victoria Street',2901,'Sydney','New South wales','AU');
insert into location values(2300,'198 Clementi North',540198,'Singapore','Singapore','SG');
insert into location values(2400,'B204 Arthur ST',2345,'London','LOndon','UK');
insert into location values(2500,'MagdalenCenter',234,'The Oxford','Oxford','OX');
insert into location values(2600,'9702 Chester Road',9629850293,'Stretford','Manchester','UK');
insert into location values(2700,'Schwanthalerstr, 7301',80925,'Munich','Bavaria','DE');
insert into location values(2800,'RUA FREI Caneca 1360','01307-002','SAO Paulo','SAOPaulo','BR');
insert into location values(2900,'20 RUE DES Corps-Saints',1730,'Geneva','Geneve','CH');
insert into location values(3000,'MURTENSTRASSE 921',3095,'BERN','BE','CH');
insert into location values(3100,'PIETER BREUGHELSTRAATB37','3029SK','UTRECHIT','UTRECHIT','NL');
insert into location values(3200,'MARIANO ESCOBEDO 9991',11932,'Mexico city','Distritofederal','eu');
select * from location;

---department----


insert into department values(1,'Accounts',1000);
insert into department values(2,'HR',1600);
insert into department values(3,'Business Development',1800);
insert into department values(4,'IT Support',2400);
insert into department values(5,'IT',3200);
SELECT * FROM department;

--------employees-------


Insert into employeess values(1,'anu','sharma','anu@gmail.com',9864675634,'13-08-2015',20000,'12-01-1994',5);


Insert into employeess values(2,'ananthi','sharma','ananthi@gmail.com',8608491910,'03-08-2015',22000,'21-03-1994',3);
Insert into employeess values(3,'amarnath','pillai','amarnath@gmail.com',7894589654,'03-07-2004',38000,'12-01-1992',4);
Insert into employeess values(4,'clinton','pritheev','clinton@gmail.com',7708480901,'01-06-2015',23000,'05-09-1994',2);
Insert into employeess values(5,'collin','paul','collin@gmail.com',9842524655,'02-06-2014',30500,'26-12-1993',1);
Insert into employeess values(6, 'haritha', 'mohan', 'haritha@gmail.com', 7710589123, '22-07-2014', 41000, '12-06-1993', 4);
Insert into employeess values(7, 'shrihari', 'pillai', 'shrihari@gmail.com', 9842512456, '01-07-2015', 21000, '01-05-1994', 2);
Insert into employeess values(8, 'jeeva', 'annath', 'jeeva@gmail.com', 8608491912, '02-06-2013',28000, '23-12-1991', 3);
Insert into employeess values(9, 'jimesh', 'sharma', 'jimesh@gmail.com', 9634565231, '06-05-2012', 51000, '28-10-1992', 1);
Insert into employeess values(10, 'giruba', 'dharan', 'giri@gmail.com', 9842524655, '02-06-2012',24000, '22-11-1990', 2);
Insert into employeess values(11, 'karthiga', 'pillai', 'karthi@gmail.com', 8608491510, '04-08-2013', 32000, '26-08-1993', 4);
insert into employeess values(12,'MADHU','SHARMA','MADHU@GMAIL.COM',9865478963,'03-06-2014',34000,'01-05-1995',2);
insert into employeess values(13,'MADHAN','KUMAR','MADHAN@GMAIL.COM',8608491810,'02-06-2014',25500,'11-01-1993',3);
insert into employeess values(14,'MALINI','KENNEDY','MALINI@GMAIL.COM',9965684384,'03-06-2015',27800,'02-01-1994',2);
insert into employeess values(15,'PRAVEEN','SINGH','PRAVEEN@GMAIL.COM',9842578910,'02-09-2015',32800,'18-08-1993',4);
insert into employeess values(16,'PRABHA','MURUGAN','PRAGHA@GMAIL.COM',9865478963,'03-06-2013',25000,'01-05-1994',2);
insert into employeess values(17,'PRADEEP','SINGH','PRADEEP@GMAIL.COM',8604527865,'02-10-2004',76000,'23-12-1981',3);
insert into employeess values(18,'PERICHI','PILLAI','PERICHI@gmail.com',9842578910,'02-09-2015',31780,'28-08-1993',4);
insert into employeess values(19,'PUNITHA','SHARMA','PUNITHA@gmail.com',9865478963,'03-06-2008',44148,'01-05-1984',2);
insert into employeess values(20,'SIVA','PILLAI','SIVA@gmail.com',9845612458,'02-06-2013',19348,'23-12-1991',3);
insert into employeess values(21,'THANA','RATHINAM','PRAGHA@gmail.com',9865478963,'03-06-2013',14148,'01-05-1994',2);
insert into employeess values(22,'YOGESH','SINGH','PRADEEP@gmail.com',8604527865,'02-06-2013',20348,'23-12-1991',3);
insert into employeess values(23,'VIDYA','SINGH','PERICHI@gmail.com',9842578910,'02-09-2014',21780,'16-08-1993',4);
select * from employeess;

-------manager------
Insert into manager(department_id,employee_id) values (1,9);
Insert into manager(department_id,employee_id) values (2,19);
Insert into manager(department_id,employee_id) values (2,4);
Insert into manager(department_id,employee_id) values (3,17);
Insert into manager(department_id,employee_id) values (3,8);
Insert into manager(department_id,employee_id) values (4,15);
Insert into manager(department_id,employee_id) values (5,1);
select * from manager;














