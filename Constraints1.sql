
SQL> create table omkar (ID Number(2), Name varchar (20) Not Null, Contact_No Number(10) Unique, Moc
k_Rating Number(1), Remarks varchar (10) Not Null);
create table omkar (ID Number(2), Name varchar (20) Not Null, Contact_No Number(10) Unique, Mock_Rat
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> drop table omkar;

Table dropped.

SQL> create table omkar (ID Number(2),
  2  Name varchar (20) Not Null,
  3  Contact_No Number(10) Unique,
  4  Mock_Rating Number(1),
  5  Remarks varchar (10) Not Null);

Table created.

SQL> insert into omkar (1,'Omkar More',7972985617,1,'LaiGhasli');
insert into omkar (1,'Omkar More',7972985617,1,'LaiGhasli')
                   *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into omkar values (1,'Omkar More',7972985617,1,'LaiGhasli');

1 row created.

SQL> insert into omkar values (2,'Akash Kshirsagar',9922741134,1,'Excellent');

1 row created.

SQL> insert into omkar values (3,'Omkar Potdar',8087136082,2,'Baadad');

1 row created.

SQL> insert into omkar values (4,'Apurv Patil',8408004993,2,'Khacchi');

1 row created.

SQL> select * from omkar;

        ID NAME                 CONTACT_NO MOCK_RATING REMARKS
---------- -------------------- ---------- ----------- ----------
         1 Omkar More           7972985617           1 LaiGhasli
         2 Akash Kshirsagar     9922741134           1 Excellent
         3 Omkar Potdar         8087136082           2 Baadad
         4 Apurv Patil          8408004993           2 Khacchi
