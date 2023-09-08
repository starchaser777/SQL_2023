-- �������� (Equi Join)
-- �������� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- ���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�.
select custname, saleprice from customer c, orders o
where c.custid = o.custid;

-- ���̸����� �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ���̸������� �����Ͻÿ�.
select custname, sum(saleprice) from customer, orders
where customer.custid = orders.custid
group by custname
order by custname;

-- ���� �̸��� �ֹ��� ������ �̸��� ���̸������� ���Ͻÿ�.
-- 3���� ���̺� ���� ��������
select custname, bookname from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid
order by custname;

-- ���������� 14400���� ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�.
select custname, bookname from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and price = 14400;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ�����
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�.
select custname, saleprice
from customer c left outer join orders o
                        on c.custid = o.custid;

-- Sub Query(�μ� ����)
-- Main Query ���� �ִ� Query

-- ���������� ���� ��� �����̸��� ����Ͻÿ�.

-- ���������� ���� ��� ����
select max(price) from book;
-- �����̸�
select bookname from book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�.
select bookname from book
where price = (select max(price) from book);

-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�.
select bookname, price from book
where price = (select min(price) from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select custname from customer
where custid in (select distinct custid from orders);
-- sub query: �ֹ��� ���� �ִ� ����ȣ��
select distinct custid from orders;

-- �ĸ���Ÿ������ ������ ������ ������ ���� �̸��� ����Ͻÿ�.
select custname from customer;
select bookid, bookname from book
where publisher = '�ĸ���Ÿ��';
-- ������ ������ ����� ����ȣ
select distinct custid from orders;

select custname from customer
where custid in (select distinct custid from orders
                where bookid in (select bookid from book
                                where publisher='�ĸ���Ÿ��'));
                                
select custname from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and publisher = '�ĸ���Ÿ��';