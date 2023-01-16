create database PlSql
drop table Dept
create table Dept
(
Id int ,
Name varchar(50)
)
 insert into Dept values 
 (6, 'comp')

 drop table teach

 select * from stud
 select * from teach
 select * from Dept
 

 select stud.id, teach.id, dept.Id from stud right join teach on 
 stud.id=teach.Id inner join dept
 on 
 teach.id=dept.id

 select * from dept left join teach on
 dept.id=teach.id


