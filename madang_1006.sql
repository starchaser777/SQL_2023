set serveroutput on;
exec interest;

create table book_log(
    bookid_l number,
    bookname_l varchar2(40),
    publisher_l varchar2(40),
    price_l number
);
