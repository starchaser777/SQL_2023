-- [Ch04 연습문제]
-- 부속질의
-- 05-(2)
-- 주문을 한 고객별 이름, 평균 구매가격을 구하시오.
SELECT  c.custname, s
FROM    (SELECT custid, AVG(saleprice) s
        FROM    Orders
        GROUP BY custid) o, Customer c
WHERE   c.custid = o.custid;

-- 05-(3)
-- 고객번호가 3보다 작은 고객의 판매금액의 합계를 구하시오.

select * from book;

-- 책이름에 과학이라는 단어가 포함된 결과행을 출력하시오.
select * from book
where bookname like '%과학%';

create view v_book
as select * from book
where bookname like '%과학%';

select * from customer;
-- 주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
select * from customer
where address like '%서울%';

create view vw_customer
as select * from customer
where address like '%서울%';

select * from vw_customer;

-- 주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
-- 김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오.
create view vw_orders(orderid, custname, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.custname, o.custid,  o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where custname = '김연아';

-- 기존의 뷰를 수정한다.
create or replace view vw_customer(custid, custname, address)
as select custid, custname, address
from customer
where address like '영국';

select * from customer;

select * from vw_customer;

-- 뷰 삭제
drop view vw_customer;

-- 08-(1)
-- 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오.
create view highorders
as select o.bookid, b.bookname, c.custname, b.publisher, o.saleprice
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid and saleprice >= 20000;

-- 08-(2)
-- 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL 문을 작성하시오.
select bookname, custname
from highorders;

-- 08-(3)
-- highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오. 삭제 후 (2)번 SQL 문을 다시 수행하시오.
create or replace view highorders
as select o.bookid, b.bookname, c.custname, b.publisher
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and saleprice >= 20000;

-- insertbook 프로시저 실행
exec insertbook(17, '스포츠과학', '마당과학서적', 25000);

select * from book;

exec insertorupdate(16, '스포츠 즐거움', '마당과학서점', 30000);

exec insertorupdate(16, '스포츠 즐거움', '마당과학서점', 20000);

set serveroutput on;
declare
    averageVal number;
begin
    averagePrice(averageVal);
    DBMS_OUTPUT.PUT_LINE('도서평균가격: '||round(averageVal,2));
end;