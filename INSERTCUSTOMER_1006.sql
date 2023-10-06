create or replace procedure insertcustomer(
    myCustId in number,
    myCustName in varchar2,
    myAddress in varchar2,
    myPhone in varchar2)
AS 
BEGIN
  insert into customer(custid, custname, address, phone)
  values(myCustId, myCustName, myAddress, myPhone);
END;