select * from book;
-- book 테이블에서 과학이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색하시오.
select * from book
        where bookname LIKE '%과학%' AND price >= 15000;
        
-- book 테이블에서 출판사가 굿스포츠 또는 PAROLE&인 도서를 검색하시오.
select * from book
        where publisher='굿스포츠' OR publisher='PAROLE&';
        
-- 위의 문제를 in 연산자를 사용하여 수정해보세요.
select * from book
        where publisher IN ('굿스포츠', 'PAROLE&');
        
-- book 테이블에서 도서명순으로 검색하시오.
select * from book ORDER BY bookname;

-- book 테이블에서 도서번호순으로 검색하시오.
select * from book ORDER BY bookid;

-- book 테이블에서 가격순으로 검색을 하고 같은 가격이면 이름순으로 검색하시오.
select * from book ORDER BY price, bookname;

-- book 테이블에서 가격을 내림차순으로 검색하고 같은 가격이면 출판사는 오름차순으로 검색하시오.
select * from book ORDER BY price DESC, publisher ASC;

select * from orders;
-- orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오.
-- 집계함수 사용(합계: sum)
select sum(saleprice) as 총판매금액 from orders;

-- orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice) as 총판매금액 from orders
                                    where custid = 1;

-- orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오.
select sum(saleprice) as 총판매금액,
        avg(saleprice) as 판매액평균,
        min(saleprice) as 최저가격,
        max(saleprice) as 최대가격
from orders;

-- orders 테이블에서 판매한 도서의 개수를 구하시오.
select count(*) as 총판매수 from orders;

-- orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오.
select count(*)from orders where saleprice >= 13000;

-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오.
select count(*)from orders where custid = 1 OR custid = 3;

-- orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오.(별칭 쓸 때 as 생략 가능)
-- 그룹화(부분합) : group by
select custid, count(*) 도서수량, sum(saleprice) 총액
from orders
group by custid
order by custid;

-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량을 구하시오.
-- 단, 2권 이상 구매한 고객만 출력하시오.
select custid, count(*) as 도서수량 from orders
where saleprice >= 8000
group by custid
order by custid
having count(*) >= 2;

-- [Ch03 연습문제]
-- 01-(1)도서번호가 1인 도서의 이름
select bookname as 도서명 from book where bookid = 1;

-- 01-(2) 가격이 15,000원 이상인 도서의 이름
select bookname from book where price >= 15000;

-- 01-(3) 박지성의 총구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) as "박지성의 총구매액" from orders where custid = 1;

-- 01-(4) 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
select count(*) as "박지성의 구매도서수" from orders where custid = 1;

-- 02-(1) 마당서점 도서의 총수
select count(*) as 총도서수 from book;

-- 02-(2) 마당서점에 도서를 출고하는 출판사의 총수
select count(publisher) as 총출판사수 from book;

-- 02-(3) 모든 고객의 이름, 주소
select custname as 고객명, address as 주소 from customer;

-- 02-(4) 2022년 10월 4일~11월 7일 사이에 주문받은 도서의 주문번호
select orderid from orders where orderdate BETWEEN '22/10/04' AND '22/11/07';

-- 02-(5) 2022년 10월 4일~11월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select orderid from orders where orderdate < '22/10/04' OR orderdate > '22/11/07';

-- 02-(6) 성이 '김'씨인 고객의 이름과 주소
select custname as 고객명, address as 주소 from customer where custname LIKE '김%';

-- 02-(7) 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select custname as 고객명, address as 주소 from customer where custname LIKE '김_아';