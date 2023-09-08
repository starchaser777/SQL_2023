-- ���տ�����: ������(UNION), ������(MINUS), ������(INTERSECT)
-- ������ ������ ���
-- ������ �ֹ����� ���� ���� �̸��� ���ÿ�.
select custname from customer;

select distinct custid from orders;

select custname from customer
where custid in (select distinct custid from orders);

-- ������ ������ ����� ���
select custname from customer
minus 
select custname from customer
where custid in (select distinct custid from orders);

-- ���� ������ ������� ���� ���
select custname from customer
where custid not in (select distinct custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
select custname, address from customer
where custid in (select distinct custid from orders);
-- �������ΰ� �ߺ��� ����
select distinct custname, address from customer c, orders o
where c.custid = o.custid;
-- Exists ����� ���
select custname, address from customer c
where exists (select * from orders o
                        where c.custid = o.custid);

-- [Ch03 ��������]
-- 01-(5) �������� ������ ������ ���ǻ� ��
select count(publisher) from book b, orders o
where b.bookid = o.bookid and o.custid = 1;

-- 01-(6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, price, price - saleprice from book b, orders o, customer c
where b.bookid = o.bookid and o.custid = c.custid and c.custname = '������';

-- 01-(7) �������� �������� ���� ������ �̸�
select distinct b.bookname from book b, orders o, customer c
where b.bookid = o.bookid and c.custid = o.custid and c.custname != '������';

-- 02-(8) �ֹ����� ���� ���� �̸�(�μ����� ���)
select custname from customer
where custid not in (select distinct custid from orders);

-- 02-(9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�

-- 02-(10) ���� �̸��� ���� ���ž�

-- 02-(11) ���� �̸��� ���� ������ ���� ���

-- 02-(12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select * from book b, orders o
where b.bookid = o.bookid
and price - saleprice = (select max(price - saleprice)
                                    from book sb, orders so
                                    where sb.bookid = so.bookid);
                                    
-- 02-(13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�

-- DDL(Data Defination Language): ������ ���Ǿ�
-- create table/alter table/drop table
-- ���̺� ���� ���� 1
create table NewBook (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- ���̺� ���� ���� 2
-- primary key ���� ��� 1
create table NewBook2 (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);

-- primary key ���� ��� 2
create table NewBook3 (
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000���� �ϰ� �Էµ� ���� 1000 �ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����

create table NewBook4 (
    bookname varchar2(20) not null,
    publisher varchar(20) unique,
    price number default 10000 check(price > 1000),
    primary key (bookname, publisher)
);