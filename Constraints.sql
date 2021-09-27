
SQL*Plus: Release 10.2.0.1.0 - Production on Mon Sep 27 14:49:55 2021

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> create table stud (ID Number(2) OP Primary Key, Name Varchar (10) Not Null,
  2  Contact_No Number (10) Unique);
create table stud (ID Number(2) OP Primary Key, Name Varchar (10) Not Null,
                                *
ERROR at line 1:
ORA-00907: missing right parenthesis


SQL>  create table stud (ID Number(2)  Primary Key, Name Varchar (10) Not Null,
  2   Contact_No Number (10) Unique);

Table created.

SQL> insert into stud values (1,'A',1234567890);

1 row created.

SQL> insert into stud values (2,'B',1234567891);

1 row created.

SQL> insert into stud values (Null,'B',1234567892);
insert into stud values (Null,'B',1234567892)
                         *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("SCOTT"."STUD"."ID")


SQL> insert into stud values (2,'B',Null);
insert into stud values (2,'B',Null)
*
ERROR at line 1:
ORA-00001: unique constraint (SCOTT.SYS_C005430) violated


SQL> insert into stud values (3,'C',Null);

1 row created.

SQL> insert into stud values (4,Null,1234567933);
insert into stud values (4,Null,1234567933)
                           *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("SCOTT"."STUD"."NAME")


SQL> insert into stud values (4,'D',1234567933);

1 row created.

SQL> select * from stud;

        ID NAME       CONTACT_NO
---------- ---------- ----------
         1 A          1234567890
         2 B          1234567891
         3 C
         4 D          1234567933
