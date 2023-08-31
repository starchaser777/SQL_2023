-- 도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 수입도서정보 Imported_Book 테이블
create table Imported_Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 고객정보 Customer 테이블
create table Customer(
    custid NUMBER(2) primary key,
    custname VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- 주문정보 Orders 테이블
create table Orders(
    orderid NUMBER(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book 테이블에 10권의 도서 정보를 추가하세요
insert into Book values(1, '축구의 역사', '굿스포츠', 7000);
insert into Book values(2, '해리포터 죽음의 성물', '좋은책', 12000);
insert into Book values(3, '나무', '해냄', 15000);
insert into Book values(4, '도시락의 시간', '글담', 12420);
insert into Book values(5, '이상한 그림', '북다', 14400);
insert into Book values(6, '나 같은 기계들', '문학동네', 15120);
insert into Book values(7, '우리는 매일매일', '문학과지성사', 13500);
insert into Book values(8, '아메리칸 프로메테우스', '사이언스북스', 22500);
insert into Book values(9, '맛있게 클래식', 'PAROLE&', 14400);
insert into Book values(10, '그여자가방에들어가신다', '후마니타스', 14400);

-- Customer 테이블에 고객정보 5명 추가
insert into Customer values(1, '박지성', '영국 맨체스터', '000-5000-001');
insert into Customer values(2, '김연아', '서울 동작구 흑석동', '02-333-5555');
insert into Customer values(3, '장미란', '서울 용산구 보광동', '02-555-7777');
insert into Customer values(4, '추신수', '인천광역시 연수구', '032-233-5656');
insert into Customer values(5, '박세리', '대전광역시 유성구', '042-322-1237');