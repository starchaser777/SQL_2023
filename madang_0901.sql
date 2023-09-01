select * from book;
-- book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.
select * from book
        where bookname LIKE '%����%' AND price >= 15000;
        
-- book ���̺��� ���ǻ簡 �½����� �Ǵ� PAROLE&�� ������ �˻��Ͻÿ�.
select * from book
        where publisher='�½�����' OR publisher='PAROLE&';
        
-- ���� ������ in �����ڸ� ����Ͽ� �����غ�����.
select * from book
        where publisher IN ('�½�����', 'PAROLE&');
        
-- book ���̺��� ����������� �˻��Ͻÿ�.
select * from book ORDER BY bookname;

-- book ���̺��� ������ȣ������ �˻��Ͻÿ�.
select * from book ORDER BY bookid;

-- book ���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
select * from book ORDER BY price, bookname;

-- book ���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ�� ������������ �˻��Ͻÿ�.
select * from book ORDER BY price DESC, publisher ASC;

select * from orders;
-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
-- �����Լ� ���(�հ�: sum)
select sum(saleprice) as ���Ǹűݾ� from orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ� from orders
                                    where custid = 1;

-- orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�,
        avg(saleprice) as �Ǹž����,
        min(saleprice) as ��������,
        max(saleprice) as �ִ밡��
from orders;

-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*) as ���Ǹż� from orders;

-- orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�.
select count(*)from orders where saleprice >= 13000;

-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
select count(*)from orders where custid = 1 OR custid = 3;

-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.(��Ī �� �� as ���� ����)
-- �׷�ȭ(�κ���) : group by
select custid, count(*) ��������, sum(saleprice) �Ѿ�
from orders
group by custid
order by custid;

-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- ��, 2�� �̻� ������ ���� ����Ͻÿ�.
select custid, count(*) as �������� from orders
where saleprice >= 8000
group by custid
order by custid
having count(*) >= 2;

-- [Ch03 ��������]
-- 01-(1)������ȣ�� 1�� ������ �̸�
select bookname as ������ from book where bookid = 1;

-- 01-(2) ������ 15,000�� �̻��� ������ �̸�
select bookname from book where price >= 15000;

-- 01-(3) �������� �ѱ��ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) as "�������� �ѱ��ž�" from orders where custid = 1;

-- 01-(4) �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
select count(*) as "�������� ���ŵ�����" from orders where custid = 1;

-- 02-(1) ���缭�� ������ �Ѽ�
select count(*) as �ѵ����� from book;

-- 02-(2) ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�
select count(publisher) as �����ǻ�� from book;

-- 02-(3) ��� ���� �̸�, �ּ�
select custname as ����, address as �ּ� from customer;

-- 02-(4) 2022�� 10�� 4��~11�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select orderid from orders where orderdate BETWEEN '22/10/04' AND '22/11/07';

-- 02-(5) 2022�� 10�� 4��~11�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select orderid from orders where orderdate < '22/10/04' OR orderdate > '22/11/07';

-- 02-(6) ���� '��'���� ���� �̸��� �ּ�
select custname as ����, address as �ּ� from customer where custname LIKE '��%';

-- 02-(7) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select custname as ����, address as �ּ� from customer where custname LIKE '��_��';