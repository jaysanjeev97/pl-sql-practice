SET SERVEROUTPUT ON
DECLARE
a NUMBER:=0;
BEGIN 
FOR i IN 1.. 7 LOOP
a:=a+i;
DBMS_OUTPUT.PUT_LINE(a);
end loop;
end;

set SERVEROUT on

DECLARE 
   a number := 5; 
BEGIN 
   WHILE a < 10 LOOP 
      DBMS_OUTPUT.PUT_LINE(a); 
      a := a + 1; 
   END LOOP; 
END; 
/ 
DESCRIBE PRODUCTS;

DECLARE
PNAME  PRODUCTS.PRODUCTNAME%TYPE;
P_ID PRODUCTS.PRODUCT_ID %TYPE:=&PRODUCT_ID;
BEGIN
SELECT PRODUCTNAME  INTO PNAME
FROM PRODUCTS
WHERE PRODUCT_ID = P_ID;
DBMS_OUTPUT.PUT_LINE('PRODUCTNAME IS'||PNAME);
EXCEPTION 
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('PRODUCT_ID'||'DOES NOT EXIT');

END;
/
-----exception-----
select * from products;
DECLARE 
   p_id products.product_id%type:=201 ; 
   p_name products.productName%type; 
BEGIN 
   SELECT  productname INTO  p_name
   FROM products 
   WHERE product_id = p_id ;  
   DBMS_OUTPUT.PUT_LINE ('productname  is'|| p_name); 

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('productid'|| p_id||'does not exit'); 
   WHEN TWO_MANY_ROWS THEN 
      dbms_output.put_line('Error'); 
END; 
/

-----cursors------


 select * from products;

set serveroutput on
Declare
cursor c1 is select productname, last_price  from products;
p_product products.productname%type;
p_list products.last_price%type;

BEGIN
open c1;
loop
Fetch c1 into p_product,p_list;
If C1%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('no product');
exit;
END IF;
DBMS_OUTPUT.PUT_LINE('productName '|| p_product ||' lastprice '|| p_list);
END loop;
close c1;
END;
/

------row count------
create or replace procedure add_sum(num1 in number,num2 in number)
as
total number(20);
begin
total:=num1+num2;
dbms_output.put_line('addition of two numbers is:'||total);

end;


execute add_sum(10,20);


create or replace procedure jay(firstName in varchar2,lastname in varchar2)
is

begin

dbms_output.put_line(firstname || lastname);

end;


EXEC jay('SELVA','RAGAVAN');

------package------

CREATE OR REPLACE PACKAGE c_prd AS 
   -- Adds a product 
   PROCEDURE addproduct(p_id products.product_id%type, 
   p_name products.productName%type, 
   p_stprice   products.standard_price%type, 
   p_lprice  products.last_price %type,  
   p_catid  products.category_id%type); 
   
   -- Removes a product
   PROCEDURE delproduct(p_id  products.product_id%TYPE); 
   --Lists all products
    
  
END c_prd; 
/

------package body-----

CREATE OR REPLACE PACKAGE body c_prd  AS 
   -- Adds a product 
   PROCEDURE addproduct(p_id products.product_id%type, 
   p_name products.productName%type, 
   p_stprice   products.standard_price%type, 
   p_lprice  products.last_price %type,  
   p_catid  products.category_id%type) 
    IS
    
   BEGIN 
      INSERT INTO products(product_id,productName,standard_price,last_price,category_id) 
         VALUES(p_id, p_name, p_stprice, p_lprice, p_catid); 
   END addproduct; 
   
   PROCEDURE delproduct(p_id  products.product_id%type) IS
   BEGIN 
      DELETE FROM products
      WHERE product_id =? ; 
   END delproduct;
   
   END  c_prd;
   /
EXECUTE  c_prd.addproduct(777,'nokia',25000,22000,'os');


------cursors-----
declare
   p_id products.product_id%type; 
   p_name products.productName%type;
   p_stprice   products.standard_price%type; 
   p_lprice  products.last_price %type;  
   p_catid  products.category_id%type;
  
  cursor p_cu is
  select productName,last_price from products where product_id=p_id;
  begin 
 product_id :=&p_id; 
  open p_cu;
  loop
  fetch p_cu into p_name,p_lprice;
  exit when p_cu%rowcount>5 or p_cu%notfound;
  dbms_output.put_line(p_name||''||p_lprice);
  end loop;
  close p_cu;
  end;
   








