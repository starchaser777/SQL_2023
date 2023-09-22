-- [Ch04 연습문제]
-- 01-(1)
-- ABS(숫자) -> 숫자의 절댓값 계산
-- ABS(-15) -> 15
select abs(-15) from dual;

-- 01-(2)
-- CEIL(숫자) -> 숫자보다 크거나 같은 최소의 정수(올림 계산)
-- CEIL(15.7) -> 16
select CEIL(15.7) from dual;

-- 01-(3)
-- COS(숫자) -> 숫자의 삼각함수 값 리턴(코사인 계산)
-- COS(3.14159) -> -1(-0.99999999999647923060461239250850048324)
select COS(3.14159) from dual;

-- 01-(4)
-- FLOOR(숫자) -> 숫자보다 작거나 같은 최소의 정수(내림 계산)
-- FLOOR(15.7) -> 15
select FLOOR(15.7) from dual;

-- 01-(5)
-- LOG(n,숫자) -> 숫자의 자연로그 값 반환(로그 계산)
-- LOG(10,100) -> 2
select LOG(10,100) from dual;

-- 01-(6)
-- MOD(숫자1,숫자2) -> 첫 번째 매개변수를 두 번째 매개변수로 나눈 후의 나머지를 리턴(나머지 계산)
-- MOD(11,4) -> 3
select MOD(11,4) from dual;

-- 01-(7)
-- POWER(숫자,n) -> 숫자의 n제곱 값 계산
-- POWER(3,2) -> 9
select POWER(3,2) from dual;

-- 01-(8)
-- ROUND(숫자,m) -> m 자리를 기준으로 숫자 반올림
-- ROUND(15.7) -> 16
select ROUND(15.7) from dual;

-- 01-(9)
-- SIGN(숫자) -> 숫자가 음수이면 -1, 0이면 0, 양수이면 1(숫자 부호 확인)
-- SIGN(-15) -> -1
select SIGN(-15) from dual;

-- 01-(10)
-- TRUNC(숫자,m) -> 소수점 m 자리에서 잘라서 리턴, m 생략 시 디폴트값 0(소수점 이하 제거)
-- TRUNC(15.7) -> 15
select TRUNC(15.7) from dual;

-- 01-(11)
-- CHR(k) -> 정수 아스키코드를 문자로 변환
-- CHR(67) -> C
select CHR(67) from dual;

-- 01-(12)
-- CONCAT(s1,s2) -> 두 문자열을 연결
-- CONCAT('HAPPY','Birthday') -> HAPPYBirthday
select CONCAT('HAPPY', 'Birthday') from dual;

-- 01-(13)
-- LOWER(s) -> 대상 문자열을 모두 소문자로 변환
-- LOWER('Birthday') -> birthday
select LOWER('Birthday') from dual;

-- 01-(14)
-- LPAD(s,n,c) -> 대상 문자열의 왼쪽부터 지정한 자릿수까지 지정한 문자로 채움(왼쪽 패딩 추가)
-- 원본 문자열의 길이를 총 15개로 맞추는데 마지막 인수에 있는 문자열로 왼쪽부터 채운다.
-- LPAD('Page 1',15,'*.') -> *.*.*.*.*Page 1
select LPAD('Page 1',15,'*.') from dual;

-- 01-(15)
-- LTRIM(s1,s2) -> 대상 문자열의 왼쪽부터 지정한 문자들을 제거
-- LTRIM('Page 1','ae') -> Page 1
select LTRIM('Page 1', 'ae') from dual;

-- 01-(16)
-- REPLACE(s1,s2,s3) -> 대상 문자열의 지정한 문자를 원하는 문자로 변경(문자열 대체)
-- REPLACE('JACK','J','BL') -> BLACK
select REPLACE('JACK','J','BL') from dual;

-- 01-(17)
-- RPAD(s,n,c) -> 대상 문자열의 오른쪽부터 지정한 자릿수까지 지정한 문자로 채움(오른쪽 패딩 추가)
-- RPAD('Page 1',15,'*.') -> Page 1*.*.*.*.*
select RPAD('Page 1',15,'*.') from dual;

-- 01-(18)
-- RTRIM(s1,s2) -> 대상 문자열의 오른쪽부터 지정한 문자들을 제거
-- RTRIM('Page 1','ae') -> Page 1
select RTRIM('Page 1','ae') from dual;

-- 고객의 이름과 전화번호를 출력하시오.(단, 전화번호가 없는 고객은 '연락처없음'으로 출력)
select custname 이름, phone 전화번호 from customer;
select custname 이름, nvl(phone, '연락처없음') 전화번호 from customer;

-- 고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오.
select rownum 순번, custid, custname, phone from Customer;
select rownum 순번, custid, custname, phone from Customer
where rownum <= 2;

-- mybook 테이블 생성
create table mybook(
    bookid number not null primary key,
    price number
);

-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

-- NULL
-- 02-(1)
-- mybook 테이블의 데이터값 모두 출력
select * from mybook;

-- 02-(2)
-- null 값이 0으로 출력
select bookid, nvl(price, 0) from mybook;

-- 02-(3)
-- price 값이 null인 행만 출력
select * from mybook
where price is null;

-- 02-(4)
-- price열이 빈 문자열인 행 선택
-- 단, 이 쿼리는 정확한 결과를 반환하지 않을 수 있음. NULL과 빈 문자열은 다른 개념
select * from mybook
where price='';

-- 02-(5)
-- price 값에 100씩 더하여 출력
select bookid, price+100 from mybook;

-- 02-(6)
-- bookid >= 4 이기 때문에 4이하로만 구성된 mybook 테이블의 값들이 출력되지 않음
select sum(price), avg(price), count(*) from mybook
where bookid >= 4;

-- 02-(7)
-- 전체 데이터값은 3개이고, price 데이터값은 2개이므로 3 2가 출력
select count(*), count(price) from mybook;

-- 02-(8)
-- null 값을 제외한 1번과 2번의 price의 합(30000)과 평균(15000)이 출력
select sum(price), avg(price) from mybook;

-- ROWNUM
-- 03-(1)
-- book 테이블의 모든 데이터를 반환
select * from book;

-- 03-(2)
-- book 테이블에서 처음 5개의 행만 선택
select * from book where rownum <= 5;

-- 03-(3)
-- book 테이블에서 처음 5개의 행을 선택하고 price열을 기준으로 오름차순으로 정렬
select * from book
where rownum <= 5 order by price;

-- 03-(4)
-- book 테이블의 모든 행을 price 열을 기준으로 정렬한 다음, 그 결과에서 처음 5개의 행만 선택
select * from (select * from book order by price) b
where rownum <= 5;

-- 03-(5)
-- 3과 같음
select * from (select * from book where rownum <= 5) b
order by price;

-- 03-(6)
-- book 테이블에서 처음 5개의 행을 선택하고, 그 결과를 price열을 기준으로 오름차순으로 정렬
select * from (select * from book where rownum <= 5 order by price) b;

-- 평균 주문금액 이하의 주문에 대해 주문번호와 판매금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;
select avg(saleprice) from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 판매금액을 출력하시오.
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice)
                   from orders so
                   where mo.custid = so.custid);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders;
-- 서울에 거주하는 사람의 고객번호
select custid from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in (select custid from customer
                 where address like '%서울%');

-- 서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오.   
select sum(saleprice) 총판매금액 from orders
where custid not in (select custid
                     from customer
                     where address like '%서울%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;
select saleprice from orders where custid=3;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid=3); -- max도 사용 가능

-- 서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단, exist 연산자 사용)
select sum(saleprice) 총판매금액 from orders mo
where exists(
             select * from customer c
             where address like '%서울%' and mo.custid = c.custid
);

-- 고객별 판매금액의 합계를 출력하시오.(고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

-- 고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select custname from customer c
        where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 from orders o
group by o.custid;

-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- 고객번호가 2 이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, custname 이름 from customer
where custid <= 2;

-- 고객번호가 2 이하인 고객의 판매금액을 출력하시오.(고객이름과 고객별 판매액 출력)
select custname 고객이름, sum(saleprice) 판매총액
from (select custid, custname from customer
      where custid <= 2) c, orders o
where c.custid = o.custid
group by custname;

-- 부속질의
-- 05-(1)
--고객번호, 주소, 총판매액을 고객번호별로 묶어서 출력
select custid,(select address from customer cs
               where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;