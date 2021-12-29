select*from products;
desc products;

------------product SPEC---------
 
 
CREATE OR REPLACE PACKAGE c_pro AS 
   -- Adds a product 
   PROCEDURE addproduct(p_id products.product_id%type, 
   p_name products.productName%type, 
   p_stprice   products.standard_price%type, 
   p_lprice  products.last_price %type,  
   p_catid  products.category_id%type,status out varchar2,error out varchar2); 
 
   
   -- Removes a product
   PROCEDURE delproduct(p_id  products.product_id%TYPE); 
   --Lists all products
    
  
END c_pro; 
/

------package body-----

CREATE OR REPLACE PACKAGE body c_pro  AS 
   -- Adds a product 
   PROCEDURE addproduct(p_id products.product_id%type, 
   p_name products.productName%type, 
   p_stprice   products.standard_price%type, 
   p_lprice  products.last_price %type,  
   p_catid  products.category_id%type,status out varchar2,error out varchar2) 
    IS 
    BEGIN 
      INSERT INTO products(product_id,productName,standard_price,last_price,category_id) 
         VALUES(p_id, p_name, p_stprice, p_lprice, p_catid); 
         if Sql%found then 
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          status:='s';
           dbms_output.put_line('record inserted');
         
EXCEPTION
WHEN others then 
       error:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm'); 
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addproduct;
   
   PROCEDURE delproduct(p_id  products.product_id%type) IS
   BEGIN 
      DELETE FROM products WHERE product_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF; 
      
   END delproduct;
   
   END  c_pro;
   
   /
   set serveroutput on
EXECUTE  c_pro.addproduct(7,'iphone',5000,3000,'oracle');
EXECUTE c_pro.delproduct(765);
select*from products;
desc products;


-------------------------------------
select*from EMPLOYEES;

create or replace package e_emp as 
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type);
procedure del_emp (emp_id employees.employee_id%type);
end e_emp;

----------body---------
CREATE OR REPLACE PACKAGE body e_emp  AS 
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type);
begin
insert into employees(employee_id,name,email,phone,hire_date,manager_id,job_title) values(emp_id,emp_name,emp_email,emp_no,h_date,man_id,emp_job);
IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('employee INSERTED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('employee NOT PRODUCT');
   END IF; 
   COMMIT;
   END add_emp;
   
   
   
   
  -----------customers--------
CREATE  or replace PACKAGE cus AS  
procedure addCustomers( name in customers1.name%type,address in customers1.address%type,website in customers1.website%type,credit_limt in customers.credit_limit%type,
status out varchar2,error out varchar2) ;
end cus;
/

CREATE OR REPLACE PACKAGE BODY cus AS 
procedure addCustomers( name in customers1.name%type,address in customers1.address%type,website in customers1.website%type,credit_limt in customers.credit_limit%type,
status out varchar2,error out varchar2) ;
is    
begin    
insert into customers1(name ,address,website,credit_limit ) values( name,address,website,credit_limt );    
dbms_output.put_line('Customers record inserted successfully');

if sql%rowcount>0 then 
status:='Values Inserted';
end if;
commit;

EXCEPTION when others then 
status:='Value not Inserted';
error:=sqlcode||' '||sqlerrm;

end;
