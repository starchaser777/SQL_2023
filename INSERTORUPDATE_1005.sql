CREATE OR REPLACE PROCEDURE INSERTORUPDATE(
    myBookId number,
    myBookName varchar2,
    myPublisher varchar2,
    myPrice int)
AS
    myCount number;
BEGIN
    select count(*) into myCount from book
    where bookname like myBookName;
  
    if myCount != 0 then
        update book set price = myPrice
        where bookname like myBookName;
    else
        insert into book(bookid, bookname, publisher, price)
        values(myBookId, myBookName, myPublisher, myPrice);
    end if;
END INSERTORUPDATE;