desc products;

CREATE OR REPLACE PACKAGE c_prd AS 
   -- Adds a product 
   PROCEDURE addproduct(p_id in products.product_id%type, 
   p_name in  products.productName%type, 
   p_stprice in  products.standard_price%type, 
   p_lprice in products.last_price %type,  
   p_catid in products.category_id%type) ;
   
   -- Removes a product
   PROCEDURE delproduct(p_id in products.product_id%type); 
END c_prd; 
/

------package body-----

CREATE OR REPLACE PACKAGE body c_prd  AS 
   -- Adds a product 
   PROCEDURE addproduct(p_id in products.product_id%type, 
   p_name in products.productName%type, 
   p_stprice in  products.standard_price%type, 
   p_lprice in  products.last_price %type,  
   p_catid in products.category_id%type) 
    IS  iv_err_code varchar2(20); 
    BEGIN 
      INSERT INTO products(product_id,productName,standard_price,last_price,category_id) 
         VALUES(p_id, p_name, p_stprice, p_lprice, p_catid); 
         if Sql%found then 
         dbms_output.put_line('product  inserted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('product not inserted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
END addproduct;
   
   PROCEDURE delproduct(p_id in products.product_id%TYPE) IS iv_err_code varchar2(20);
   BEGIN 
      DELETE FROM products WHERE product_id =p_id ;
       
     if Sql%found then 
         dbms_output.put_line('product  deleted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('product not deleted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END delproduct;
   
   END  c_prd;
    /
EXECUTE  c_prd.addproduct(4537,'samsung',25000,20000,'jay');
EXECUTE c_prd.delproduct('3452');
set serveroutput on;
desc products;
select*from products ;

----------employeee-------
create or replace package e_emp as 
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type);

   -- Removes a product
   PROCEDURE del_emp(emp_id in employees.employee_id%type); 

end e_emp;

------body------
CREATE OR REPLACE PACKAGE body e_emp  AS 
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,name,email,phone,hire_date,manager_id,job_title) values(emp_id,emp_name,emp_email,emp_no,h_date,man_id,emp_job);
  if Sql%found then 
         dbms_output.put_line('employee  inserted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('employee not inserted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END add_emp;
    PROCEDURE del_emp(emp_id in employees.employee_id%type)IS iv_err_code varchar2(20);
   BEGIN 
      DELETE FROM employees WHERE employee_id =emp_id ;
       
     if Sql%found then 
         dbms_output.put_line('employee deleted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('employee not deleted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END del_emp;
   
   end e_emp;
   /
   execute e_emp.add_emp(5437,'pandidurai','pandi@gmail.com',9840220587,'22-12-2021',777,'sales');
   EXECUTE e_emp.del_emp(5437);
  desc employees;
  select* from employees;
  
  
  ---------------custemers-------
  desc customers1;
  CREATE  or replace PACKAGE cus AS  
procedure addCustomers( c_id in customers1.customer_id%type,name in customers1.name%type,address in customers1.address%type,website in customers1.website%type,credit_limt in customers.credit_limit%type);

 PROCEDURE del_cus(c_id in customers1.customer_id%type); 

end cus;
/
-------package--------

CREATE OR REPLACE PACKAGE BODY cus AS 
procedure addCustomers( c_id in customers1.customer_id%type,name in customers1.name%type,address in customers1.address%type,website in customers1.website%type,credit_limt in customers.credit_limit%type)
is iv_err_code varchar2(20);  
begin    
insert into customers1(customer_id,name ,address,website,credit_limit ) values(c_id, name,address,website,credit_limt );  
if Sql%found then 
         dbms_output.put_line('customers inserted');
         else
          dbms_output.put_line('customers not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then 
       iv_err_code:='e';
       dbms_output.put_line('customers not inserted ||||sqlerrm'); 
       dbms_output.put_line('customers not inserted');

   
   COMMIT;
   END addcustomers;
   
     PROCEDURE del_cus(c_id in customers1.customer_id%type)IS iv_err_code varchar2(20);
   BEGIN 
      DELETE FROM customers1 WHERE customer_id=c_id;
       
     if Sql%found then 
         dbms_output.put_line('customer deleted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('customer not deleted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END del_cus;
   
   end cus;
   /
   execute cus.addcustomers(456,'marirajan','chennai kilbakkam','fusion','60000');
   execute cus.del_cus(456);
   desc customers1;
   select*from customers1;
   
   
   desc orders;
   CREATE OR REPLACE PACKAGE c_ord AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesmen_id %type,  
   o_date  orders.order_date%type);
   
   PROCEDURE delorder(o_id orders.order_id%type);
end c_ord;
/

----order body----
CREATE OR REPLACE PACKAGE body c_ord  AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesmen_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20); 
    BEGIN 
      INSERT INTO orders(order_id,customer_id,status,salesmen_id,order_date) 
         VALUES(o_id, c_id, o_status, o_salmen, o_date); 
         if Sql%found then 
         dbms_output.put_line('record inserted');
          iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
         end if;
EXCEPTION
WHEN others then 
 dbms_output.put_line('record  not inserted');
       iv_err_code:='e';
         dbms_output.put_line('error:'||''||iv_err_code);  
  COMMIT;
   END addorder;
   
   
     PROCEDURE  delorder(o_id orders.order_id%type)IS iv_err_code varchar2(20);
   BEGIN 
      DELETE FROM orders WHERE order_id=o_id;
       
     if Sql%found then 
         dbms_output.put_line('order deleted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('order not deleted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END delorder;
END  c_ord;
   /

execute c_ord.addorder(1022,222,'process',678,'10-12-2021');
execute c_ord.delorder(1012);
desc orders;
select*from orders;


CREATE OR REPLACE PACKAGE c_ot AS 
   -- Adds a product 
   PROCEDURE addorderitem(o_id order_item.order_id%type, 
   c_id order_item.item_id%type, 
   o_pid  order_item.product_id%type, 
   o_quan order_item.quantity%type,  
   o_price order_item.unit_price%type);
   
   PROCEDURE delorderitem( c_id order_item.item_id%type);
   
   
end c_ot;
/
desc  order_item;


CREATE OR REPLACE PACKAGE body c_ot AS  
   -- Adds a product 
   PROCEDURE addorderitem(o_id order_item.order_id%type, 
   c_id order_item.item_id%type, 
   o_pid  order_item.product_id%type, 
   o_quan  order_item.quantity%type,  
   o_price order_item.unit_price%type)
 IS iv_err_code varchar2(20); 
    BEGIN 
      INSERT INTO order_item(order_id,item_id,product_id,quantity,unit_price) 
         VALUES(o_id, c_id, o_pid, o_quan, o_price); 
         if Sql%found then 
         dbms_output.put_line('order_item inserted');
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         end if;
EXCEPTION
WHEN others then 
     dbms_output.put_line('item  not inserted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
     COMMIT;
   END addorderitem;
   
    PROCEDURE  delorderitem ( c_id order_item.item_id%type)IS iv_err_code varchar2(20);
   BEGIN 
      DELETE FROM order_item WHERE item_id=c_id;
       
     if Sql%found then 
         dbms_output.put_line('item deleted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('item not deleted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END delorderitem;
   END  c_ot;
   /

    execute c_ot.addorderitem(6547,87,103,6,60000);
    execute c_ot.delorderitem(25);
desc order_item;
SELECT * FROM order_item;
  