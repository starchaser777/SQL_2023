-- �������� Book ���̺�
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ���Ե������� Imported_Book ���̺�
create table Imported_Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ������ Customer ���̺�
create table Customer(
    custid NUMBER(2) primary key,
    custname VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- �ֹ����� Orders ���̺�
create table Orders(
    orderid NUMBER(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book values(1, '�౸�� ����', '�½�����', 7000);
insert into Book values(2, '�ظ����� ������ ����', '����å', 12000);
insert into Book values(3, '����', '�س�', 15000);
insert into Book values(4, '���ö��� �ð�', '�۴�', 12420);
insert into Book values(5, '�̻��� �׸�', '�ϴ�', 14400);
insert into Book values(6, '�� ���� ����', '���е���', 15120);
insert into Book values(7, '�츮�� ���ϸ���', '���а�������', 13500);
insert into Book values(8, '�Ƹ޸�ĭ ���θ��׿콺', '���̾𽺺Ͻ�', 22500);
insert into Book values(9, '���ְ� Ŭ����', 'PAROLE&', 14400);
insert into Book values(10, '�׿��ڰ��濡���Ŵ�', '�ĸ���Ÿ��', 14400);

-- Customer ���̺� ������ 5�� �߰�
insert into Customer values(1, '������', '���� ��ü����', '000-5000-001');
insert into Customer values(2, '�迬��', '���� ���۱� �漮��', '02-333-5555');
insert into Customer values(3, '��̶�', '���� ��걸 ������', '02-555-7777');
insert into Customer values(4, '�߽ż�', '��õ������ ������', '032-233-5656');
insert into Customer values(5, '�ڼ���', '���������� ������', '042-322-1237');