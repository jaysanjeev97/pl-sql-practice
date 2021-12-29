set SERVEROUTPUT ON
CREATE OR REPLACE PACKAGE sales AS

 PROCEDURE addproduct(p_id products.product_id%type, 
   p_name products.productName%type, 
   p_stprice   products.standard_price%type, 
   p_lprice  products.last_price %type,  
   p_catid  products.category_id%type) ;
   
   -- Removes a product
   PROCEDURE delproduct(p_id  products.product_id%TYPE); 
   --Lists all products


 
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type);

 -- Removes a employee
   PROCEDURE del_emp(emp_id in employees.employee_id%type); 

 
procedure addCustomers( c_id in customers1.customer_id%type,name in customers1.name%type,address in customers1.address%type,website in customers1.website%type,credit_limt in customers.credit_limit%type);
 PROCEDURE del_cus(c_id in customers1.customer_id%type);
 
 
       -- Adds a order 
PROCEDURE addorder(o_id orders.order_id%type, c_id orders.customer_id%type, o_status   orders.status%type,  o_salmen  orders.salesmen_id %type,  o_date  orders.order_date%type);
   PROCEDURE delorder(o_id orders.order_id%type);


 
   -- Adds a order_item 
   PROCEDURE addorderitem(o_id order_item.order_id%type, 
   c_id order_item.item_id%type, 
   o_pid  order_item.product_id%type, 
   o_quan order_item.quantity%type,  
   o_price order_item.unit_price%type);
   
   PROCEDURE delorderitem( c_id order_item.item_id%type);
   
   procedure addcategory(cate_id product_categories.category_id%type,cate_name product_categories.category_name%type);
   procedure delcategory(cate_id product_categories.category_id%type);
   
   
end sales;
/

------BODY-------
CREATE OR REPLACE PACKAGE body SALES  AS 
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
         dbms_output.put_line('product inserted');
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
   
   
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,name,email,phone,hire_date,manager_id,job_title) values(emp_id,emp_name,emp_email,emp_no,h_date,man_id,emp_job);
  if Sql%found then 
         dbms_output.put_line('employee inserted');
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
 
   procedure addcategory(cate_id product_categories.category_id%type,cate_name product_categories.category_name%type)is iv_err_code varchar2(40);
    BEGIN 
      INSERT INTO product_categories( category_name) 
         VALUES (cate_name); 
         if Sql%found then 
         dbms_output.put_line(' id inserted');
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         end if;
EXCEPTION
WHEN others then 
     dbms_output.put_line('id not inserted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
     COMMIT;
   END addcategory;
   
     procedure delcategory(cate_id product_categories.category_id%type) is iv_err_code varchar2(20);
   BEGIN 
      DELETE FROM product_categories WHERE category_id =cate_id;
       
     if Sql%found then 
         dbms_output.put_line('id deleted');
        iv_err_code:='s';
        dbms_output.put_line('status:'||' '||iv_err_code);
        end if;
         
EXCEPTION
WHEN others then
       dbms_output.put_line('id not deleted');
       iv_err_code:='e';
       dbms_output.put_line('error:'||''||iv_err_code); 
COMMIT;
   END delcategory ;
   
   
   
END SALES;
 /
set serveroutput on;
EXECUTE  SALES.addproduct(3452,'samsung',25000,20000,'jay');
EXECUTE SALES.delproduct('3452');
SELECT * FROM products;
desc products;

execute sales.add_emp(3497,'pandidurai','pandi@gmail.com',9840220587,'22-12-2021',777,'sales');
EXECUTE sales.del_emp(5437);
SELECT * FROM employees;
desc employees;

execute sales.addcustomers(456,'marirajan','chennai kilbakkam','fusion','60000');
execute sales.del_cus(456);
SELECT * FROM  customers1;
desc customers1;

execute sales.addorder(1022,222,'process',678,'10-12-2021');
execute sales.delorder(1012);
SELECT * FROM orders;
desc orders;

execute sales.addorderitem(6547,87,103,6,60000);
execute sales.delorderitem(25);
SELECT * FROM order_item;
desc order_item;

execute sales.addcategory('windows');
desc  product_categories;
SELECT * FROM  product_categories;

   




