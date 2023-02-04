-- Fetch "Age"  automatically from "Date of birth".

  create table basic_info
  (
  Id int Primary key,
  Name varchar (50),
  DOB date
  )

  insert into basic_info values
  (4,'Ajay Sumant', '1994/04/23')

  update basic_info set DOB='1997/12/04' where id =1
  select * from basic_info

  select Id, Name, DOB, 
  Datediff(year, DOB, getdate())-
  case when dateadd (year,datediff(year,DOB,getdate()), DOB)>getdate()
  then 1
  else 0
  END as [Age]
  from basic_info
