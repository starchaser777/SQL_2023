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
                        where bookname like '축구의 역사';

select custname, phone from customer
                where custname='김연아';

select * from customer
                where custname='김연아';

-- book 테이블에서 도서명과 가격을 검색하시오.
select bookname, price from book;
-- book 테이블에서 가격과 도서명을 검색하시오.
select price, bookname from book;
-- book 테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오.
select * from book;
-- book 테이블에서 모든 출판사를 검색하시오.
select publisher from book;
-- book 테이블에서 모든 출판사를 검색하시오.(중복되는 출판사는 제거하세요)
select distinct publisher from book;
-- book 테이블에서 가격이 15000원 미만이 도서를 검색하시오.
select * from book
            where price < 15000;
-- book 테이블에서 가격이 10000원 이상 16000원 이하인 도서를 검색하시오.
select * from book
        where price BETWEEN 10000 AND 16000;
-- book 테이블에서 가격이 10000원 이상 16000원 이하인 도서를 검색하시오.
-- 단, between and를 사용하지 마시오.
select * from book
        where price >= 10000 AND price <= 16000;

-- book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검색하시오.
-- 단, in 연산자를 사용하시오.
select * from book
        where publisher IN ('굿스포츠', '해냄', '웅진지식하우스');
-- book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스인 도서를 검색하시오.
-- 단, in 연산자를 사용하지 마시오.(비교연산자와 or 연산자 사용)
select * from book
        where publisher='굿스포츠' OR publisher='해냄' OR publisher='웅진지식하우스';
-- book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스가 아닌 도서를 검색하시오.
-- 단 not in 연산자를 사용하시오.
select * from book
        where publisher NOT IN ('굿스포츠', '해냄', '웅진지식하우스');
-- book 테이블에서 출판사가 굿스포츠, 해냄, 웅진지식하우스가 아닌 도서를 검색하시오.
-- 단 not in 연산자를 사용하지 마시오.(비교연산자와 and 연산자 사용)
select * from book
        where publisher<>'굿스포츠' AND publisher<>'해냄' AND publisher<>'웅진지식하우스';