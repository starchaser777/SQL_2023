-- [Ch04 ��������]
-- 01-(1)
-- ABS(����) -> ������ ���� ���
-- ABS(-15) -> 15
select abs(-15) from dual;

-- 01-(2)
-- CEIL(����) -> ���ں��� ũ�ų� ���� �ּ��� ����(�ø� ���)
-- CEIL(15.7) -> 16
select CEIL(15.7) from dual;

-- 01-(3)
-- COS(����) -> ������ �ﰢ�Լ� �� ����(�ڻ��� ���)
-- COS(3.14159) -> -1(-0.99999999999647923060461239250850048324)
select COS(3.14159) from dual;

-- 01-(4)
-- FLOOR(����) -> ���ں��� �۰ų� ���� �ּ��� ����(���� ���)
-- FLOOR(15.7) -> 15
select FLOOR(15.7) from dual;

-- 01-(5)
-- LOG(n,����) -> ������ �ڿ��α� �� ��ȯ(�α� ���)
-- LOG(10,100) -> 2
select LOG(10,100) from dual;

-- 01-(6)
-- MOD(����1,����2) -> ù ��° �Ű������� �� ��° �Ű������� ���� ���� �������� ����(������ ���)
-- MOD(11,4) -> 3
select MOD(11,4) from dual;

-- 01-(7)
-- POWER(����,n) -> ������ n���� �� ���
-- POWER(3,2) -> 9
select POWER(3,2) from dual;

-- 01-(8)
-- ROUND(����,m) -> m �ڸ��� �������� ���� �ݿø�
-- ROUND(15.7) -> 16
select ROUND(15.7) from dual;

-- 01-(9)
-- SIGN(����) -> ���ڰ� �����̸� -1, 0�̸� 0, ����̸� 1(���� ��ȣ Ȯ��)
-- SIGN(-15) -> -1
select SIGN(-15) from dual;

-- 01-(10)
-- TRUNC(����,m) -> �Ҽ��� m �ڸ����� �߶� ����, m ���� �� ����Ʈ�� 0(�Ҽ��� ���� ����)
-- TRUNC(15.7) -> 15
select TRUNC(15.7) from dual;

-- 01-(11)
-- CHR(k) -> ���� �ƽ�Ű�ڵ带 ���ڷ� ��ȯ
-- CHR(67) -> C
select CHR(67) from dual;

-- 01-(12)
-- CONCAT(s1,s2) -> �� ���ڿ��� ����
-- CONCAT('HAPPY','Birthday') -> HAPPYBirthday
select CONCAT('HAPPY', 'Birthday') from dual;

-- 01-(13)
-- LOWER(s) -> ��� ���ڿ��� ��� �ҹ��ڷ� ��ȯ
-- LOWER('Birthday') -> birthday
select LOWER('Birthday') from dual;

-- 01-(14)
-- LPAD(s,n,c) -> ��� ���ڿ��� ���ʺ��� ������ �ڸ������� ������ ���ڷ� ä��(���� �е� �߰�)
-- ���� ���ڿ��� ���̸� �� 15���� ���ߴµ� ������ �μ��� �ִ� ���ڿ��� ���ʺ��� ä���.
-- LPAD('Page 1',15,'*.') -> *.*.*.*.*Page 1
select LPAD('Page 1',15,'*.') from dual;

-- 01-(15)
-- LTRIM(s1,s2) -> ��� ���ڿ��� ���ʺ��� ������ ���ڵ��� ����
-- LTRIM('Page 1','ae') -> Page 1
select LTRIM('Page 1', 'ae') from dual;

-- 01-(16)
-- REPLACE(s1,s2,s3) -> ��� ���ڿ��� ������ ���ڸ� ���ϴ� ���ڷ� ����(���ڿ� ��ü)
-- REPLACE('JACK','J','BL') -> BLACK
select REPLACE('JACK','J','BL') from dual;

-- 01-(17)
-- RPAD(s,n,c) -> ��� ���ڿ��� �����ʺ��� ������ �ڸ������� ������ ���ڷ� ä��(������ �е� �߰�)
-- RPAD('Page 1',15,'*.') -> Page 1*.*.*.*.*
select RPAD('Page 1',15,'*.') from dual;

-- 01-(18)
-- RTRIM(s1,s2) -> ��� ���ڿ��� �����ʺ��� ������ ���ڵ��� ����
-- RTRIM('Page 1','ae') -> Page 1
select RTRIM('Page 1','ae') from dual;

-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ���)
select custname �̸�, phone ��ȭ��ȣ from customer;
select custname �̸�, nvl(phone, '����ó����') ��ȭ��ȣ from customer;

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�.
select rownum ����, custid, custname, phone from Customer;
select rownum ����, custid, custname, phone from Customer
where rownum <= 2;

-- mybook ���̺� ����
create table mybook(
    bookid number not null primary key,
    price number
);

-- ������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

-- NULL
-- 02-(1)
-- mybook ���̺��� �����Ͱ� ��� ���
select * from mybook;

-- 02-(2)
-- null ���� 0���� ���
select bookid, nvl(price, 0) from mybook;

-- 02-(3)
-- price ���� null�� �ุ ���
select * from mybook
where price is null;

-- 02-(4)
-- price���� �� ���ڿ��� �� ����
-- ��, �� ������ ��Ȯ�� ����� ��ȯ���� ���� �� ����. NULL�� �� ���ڿ��� �ٸ� ����
select * from mybook
where price='';

-- 02-(5)
-- price ���� 100�� ���Ͽ� ���
select bookid, price+100 from mybook;

-- 02-(6)
-- bookid >= 4 �̱� ������ 4���Ϸθ� ������ mybook ���̺��� ������ ��µ��� ����
select sum(price), avg(price), count(*) from mybook
where bookid >= 4;

-- 02-(7)
-- ��ü �����Ͱ��� 3���̰�, price �����Ͱ��� 2���̹Ƿ� 3 2�� ���
select count(*), count(price) from mybook;

-- 02-(8)
-- null ���� ������ 1���� 2���� price�� ��(30000)�� ���(15000)�� ���
select sum(price), avg(price) from mybook;

-- ROWNUM
-- 03-(1)
-- book ���̺��� ��� �����͸� ��ȯ
select * from book;

-- 03-(2)
-- book ���̺��� ó�� 5���� �ุ ����
select * from book where rownum <= 5;

-- 03-(3)
-- book ���̺��� ó�� 5���� ���� �����ϰ� price���� �������� ������������ ����
select * from book
where rownum <= 5 order by price;

-- 03-(4)
-- book ���̺��� ��� ���� price ���� �������� ������ ����, �� ������� ó�� 5���� �ุ ����
select * from (select * from book order by price) b
where rownum <= 5;

-- 03-(5)
-- 3�� ����
select * from (select * from book where rownum <= 5) b
order by price;

-- 03-(6)
-- book ���̺��� ó�� 5���� ���� �����ϰ�, �� ����� price���� �������� ������������ ����
select * from (select * from book where rownum <= 5 order by price) b;

-- ��� �ֹ��ݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select avg(saleprice) from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

-- �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice)
                   from orders so
                   where mo.custid = so.custid);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders;
-- ���￡ �����ϴ� ����� ����ȣ
select custid from customer
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in (select custid from customer
                 where address like '%����%');

-- ���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.   
select sum(saleprice) ���Ǹűݾ� from orders
where custid not in (select custid
                     from customer
                     where address like '%����%');

-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select saleprice from orders where custid=3;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid=3); -- max�� ��� ����

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(��, exist ������ ���)
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
             select * from customer c
             where address like '%����%' and mo.custid = c.custid
);

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select custname from customer c
        where c.custid = o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o
group by o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- ����ȣ�� 2 ������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, custname �̸� from customer
where custid <= 2;

-- ����ȣ�� 2 ������ ���� �Ǹűݾ��� ����Ͻÿ�.(���̸��� ���� �Ǹž� ���)
select custname ���̸�, sum(saleprice) �Ǹ��Ѿ�
from (select custid, custname from customer
      where custid <= 2) c, orders o
where c.custid = o.custid
group by custname;

-- �μ�����
-- 05-(1)
--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� ��� ���
select custid,(select address from customer cs
               where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;