
CREATE TABLE product(id int, name varchar(30),describtion varchar(35));
DESCRIBE product;
CREATE TABLE PRODUCT1(ID int PRIMARY KEY,name varchar(10));
DESCRIBE PRODUCT1;
ALTER TABLE PRODUCT MODIFY ID PRIMARY KEY;

SELECT * FROM PRODUCT; 

INSERT INTO product VALUES (101,'paracetamol','fever');

INSERT INTO product VALUES (102,'HALFPRIN','fever');
INSERT INTO product VALUES (103,'aspirin','fever');


DROP TABLE product;


ROLLBACK;

ALTER TABLE PRODUCT ADD DESCRIPTION VARCHAR(20); 
UPDATE PRODUCT SET DESCRIPTION='FEVER' WHERE id=101;
alter table product drop column describtion;
    DELETE FROM product WHERE  id=102 ;
    
UPDATE PRODUCT SET DESCRIBTION='HIGH FEVER' WHERE id=102;
COMMIT;
alter table product add produced_By varchar (25);

select * from product;
insert into product values (104,'ibuprofen','painkiller','parfen_care');
insert into product values (105,'cofsils','cough relief','cipla');
select * from product order by id;
drop table  product;