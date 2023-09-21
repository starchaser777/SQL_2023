-- [Ch03 ��������]
-- 03-(1) �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸��� ����Ͻÿ�.
-- �������� ������ ������ ���ǻ� �̸��� ����Ͻÿ�.
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and custname like '������';

select custname from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and custname not like '������'
and publisher in (
    select publisher from customer cs, orders os, book bs
    where cs.custid = os.custid and os.bookid = bs.bookid
    and custname like '������'
    );

-- 03-(2) �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select custname from customer cm
where (
	select count(distinct publisher) from customer c, orders o, book b
    where c.custid = o.custid and b.bookid = o.bookid
	and custname like cm.custname
    ) >= 2;
    
-- 03-(3) ��ü ���� 30% �̻��� ������ ����
select bookname from book bm
 where (
	select count(b.bookid) from book b, orders o
    where b.bookid = o.bookid and b.bookid = bm.bookid)
    >= (select count(*) from customer) * 0.3;

-- 04-(1) ���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���.
-- ������ ���� �߰��Ͻÿ�.
-- ������ ���� �ʴ´ٸ� ������ �����Ͱ� �� �ִ��� �˾ƺ���.
insert into book(bookid, bookname, publisher, price) values(15, '������ ����', '���ѹ̵��', 10000);

-- 04-(2) '�۴�'���� ������ ������ �����Ͻÿ�.
delete from book
where publisher like '�۴�';

-- 04-(3) '���̾𽺺Ͻ�'���� ������ ������ �����Ͻÿ�.
-- ���� �������� �ʴ´ٸ� �����޽����� Ȯ���� ������.
delete from book
where publisher like '���̾𽺺Ͻ�';
-- ���Ἲ ���������� ����Ǿ����ϴ�- orders ���̺��� �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- ���� '���̾𽺺Ͻ�' ���ǻ��� ���������� ������ �� ����.

-- 04-(4) ���ǻ� 'PAROLE&'�� 'PAROLE#'���� �̸��� �ٲٽÿ�.
update book
set publisher = 'PAROLE#'
where publisher = 'PAROLE&';

-- abs: ���밪 ���ϴ� �Լ�
select abs(-33), abs(33) from dual;

-- 5.657�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�.
select round(5.657, 1) from dual;

-- ���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "����ȣ", round(avg(saleprice), -2) "��ձݾ�" from orders
group by custid;

-- ������ '����'�� ���Ե� ������ '����'���� �����Ͽ� ���������� ����Ͻÿ�.
-- ���� book ���̺��� ���������͸� �����ϸ� �ȵ˴ϴ�.
select bookid, replace(bookname, '����', '����') bookname, publisher, price from book;
select * from book;

-- ���ǻ簡 '�س�'�� �������� ���ڼ��� ����Ʈ���� ����Ͻÿ�.
select bookname "������", length(bookname) ���ڼ�, lengthb(bookname) ����Ʈ�� from book
where publisher like '�س�';

-- ���߿��� ���� ������ ���� ����� ������� �������� �ο����� ����Ͻÿ�.
select substr(custname, 1, 1) "����", count(*) "�ο���" from customer
group by substr(custname, 1, 1);

-- ������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�����̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate + 10 �ֹ�Ȯ���� from orders;

-- 2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy-mm-dd"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate = to_date('20230828', 'yyyymmdd');

-- 2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, �������� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy-mm-dd"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, custname ����, bookname ������
from orders o, book b, customer c
where o.custid = c.custid and b.bookid = o.bookid
and orderdate = to_date('20230828', 'yyyymmdd');

-- DB ������ ������ ��¥�� �ð�, ������ ����Ͻÿ�.
-- ���� ��ȯ�� ��¥�� ������ ������ ��¥�� �ð�(�⵵4�ڸ�/��2�ڸ�/��2�ڸ� ������ ����, ��:��:��) 2������ ��� ����Ͻÿ�.
select sysdate ������ȯ�Ȱ�, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') �������ĳ�¥�׽ð� from dual;