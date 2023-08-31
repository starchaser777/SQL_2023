insert into orders VALUES (1, 1, 1, 6000, TO_DATE('2023-01-10', 'yyyy-mm-dd'));
insert into orders VALUES (2, 1, 3, 21000, TO_DATE('2023-03-15', 'yyyy-mm-dd'));
insert into orders VALUES (3, 2, 5, 8000, TO_DATE('2022-11-07', 'yyyy-mm-dd'));
insert into orders VALUES (4, 3, 6, 6000, TO_DATE('2023-07-12', 'yyyy-mm-dd'));
insert into orders VALUES (5, 4, 7, 20000, TO_DATE('2023-07-07', 'yyyy-mm-dd'));
insert into orders VALUES (6, 1, 2, 12000, TO_DATE('2022-11-14', 'yyyy-mm-dd'));
insert into orders VALUES (7, 4, 8, 13000, TO_DATE('2023-08-28', 'yyyy-mm-dd'));
insert into orders VALUES (8, 3, 10, 12000, TO_DATE('2023-08-04', 'yyyy-mm-dd'));
insert into orders VALUES (9, 2, 10, 7000, TO_DATE('2022-10-29', 'yyyy-mm-dd'));
insert into orders VALUES (10, 3, 8, 13000, TO_DATE('2022-10-04', 'yyyy-mm-dd'));

insert into imported_book VALUES(21, 'Zen Golf', 'Person', 12000);
insert into imported_book VALUES(22, 'Soccer Skills', 'Kinetics', 15000);

select publisher, price FROM book
                        where bookname like '�౸�� ����';

select custname, phone from customer
                where custname='�迬��';

select * from customer
                where custname='�迬��';

-- book ���̺��� ������� ������ �˻��Ͻÿ�.
select bookname, price from book;
-- book ���̺��� ���ݰ� �������� �˻��Ͻÿ�.
select price, bookname from book;
-- book ���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�.
select * from book;
-- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher from book;
-- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ��Ǵ� ���ǻ�� �����ϼ���)
select distinct publisher from book;
-- book ���̺��� ������ 15000�� �̸��� ������ �˻��Ͻÿ�.
select * from book
            where price < 15000;
-- book ���̺��� ������ 10000�� �̻� 16000�� ������ ������ �˻��Ͻÿ�.
select * from book
        where price BETWEEN 10000 AND 16000;
-- book ���̺��� ������ 10000�� �̻� 16000�� ������ ������ �˻��Ͻÿ�.
-- ��, between and�� ������� ���ÿ�.
select * from book
        where price >= 10000 AND price <= 16000;

-- book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� ������ �˻��Ͻÿ�.
-- ��, in �����ڸ� ����Ͻÿ�.
select * from book
        where publisher IN ('�½�����', '�س�', '���������Ͽ콺');
-- book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� ������ �˻��Ͻÿ�.
-- ��, in �����ڸ� ������� ���ÿ�.(�񱳿����ڿ� or ������ ���)
select * from book
        where publisher='�½�����' OR publisher='�س�' OR publisher='���������Ͽ콺';
-- book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� �ƴ� ������ �˻��Ͻÿ�.
-- �� not in �����ڸ� ����Ͻÿ�.
select * from book
        where publisher NOT IN ('�½�����', '�س�', '���������Ͽ콺');
-- book ���̺��� ���ǻ簡 �½�����, �س�, ���������Ͽ콺�� �ƴ� ������ �˻��Ͻÿ�.
-- �� not in �����ڸ� ������� ���ÿ�.(�񱳿����ڿ� and ������ ���)
select * from book
        where publisher<>'�½�����' AND publisher<>'�س�' AND publisher<>'���������Ͽ콺';