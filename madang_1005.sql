-- [Ch04 ��������]
-- �μ�����
-- 05-(2)
-- �ֹ��� �� ���� �̸�, ��� ���Ű����� ���Ͻÿ�.
SELECT  c.custname, s
FROM    (SELECT custid, AVG(saleprice) s
        FROM    Orders
        GROUP BY custid) o, Customer c
WHERE   c.custid = o.custid;

-- 05-(3)
-- ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ踦 ���Ͻÿ�.

select * from book;

-- å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * from book
where bookname like '%����%';

create view v_book
as select * from book
where bookname like '%����%';

select * from customer;
-- �ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
select * from customer
where address like '%����%';

create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.
create view vw_orders(orderid, custname, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.custname, o.custid,  o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where custname = '�迬��';

-- ������ �並 �����Ѵ�.
create or replace view vw_customer(custid, custname, address)
as select custid, custname, address
from customer
where address like '����';

select * from customer;

select * from vw_customer;

-- �� ����
drop view vw_customer;

-- 08-(1)
-- �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.
create view highorders
as select o.bookid, b.bookname, c.custname, b.publisher, o.saleprice
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid and saleprice >= 20000;

-- 08-(2)
-- ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
select bookname, custname
from highorders;

-- 08-(3)
-- highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�. ���� �� (2)�� SQL ���� �ٽ� �����Ͻÿ�.
create or replace view highorders
as select o.bookid, b.bookname, c.custname, b.publisher
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and saleprice >= 20000;

-- insertbook ���ν��� ����
exec insertbook(17, '����������', '������м���', 25000);

select * from book;

exec insertorupdate(16, '������ ��ſ�', '������м���', 30000);

exec insertorupdate(16, '������ ��ſ�', '������м���', 20000);

set serveroutput on;
declare
    averageVal number;
begin
    averagePrice(averageVal);
    DBMS_OUTPUT.PUT_LINE('������հ���: '||round(averageVal,2));
end;