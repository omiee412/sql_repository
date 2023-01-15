
SQL> set linesize 140
SQL> set pagesize 20
SQL> select * from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL> select * from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> SELECT ENAME FROM EMP WHERE DEPTNO=20;

ENAME
----------
SMITH
JONES
SCOTT
ADAMS
FORD

SQL> SELECT LOC FROM DEPT WHERE DEPTNO=20;

LOC
-------------
DALLAS

SQL> SELECT EMPNO FROM EMP WHERE DEPTNO=20;

     EMPNO
----------
      7369
      7566
      7788
      7876
      7902

SQL> SELECT MGR FROM EMP WHERE ENAME='ADAMS';

       MGR
----------
      7788

SQL> SELECT MGR FROM EMP WHERE ENAME='ADAMS' 
  2  IN (SELECT EMPNO FROM EMP WHERE DEPTNO=20)
  3  ;
IN (SELECT EMPNO FROM EMP WHERE DEPTNO=20)
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> SELECT MGR FROM EMP WHERE ENAME='ADAMS' 
  2  IN ( SELECT EMPNO FROM EMP MGR=EMPNO);
IN ( SELECT EMPNO FROM EMP MGR=EMPNO)
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> SELECT MGR FROM EMP WHERE ENAME='ADAMS' 
  2  I;
I
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> SELECT ENAME FROM EMP WHERE MAX(SAL)='SALESMAN','MANAGER','CLERK','ANALYST','PRESIDENT';
SELECT ENAME FROM EMP WHERE MAX(SAL)='SALESMAN','MANAGER','CLERK','ANALYST','PRESIDENT'
                            *
ERROR at line 1:
ORA-00934: group function is not allowed here


SQL> SELECT ENAME FROM EMP WHERE SAL=
  2  (SELECT ENAME WHERE MAX(SAL)='SALESMAN'),
  3  (SELECT ENAME ;
(SELECT ENAME WHERE MAX(SAL)='SALESMAN'),
              *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected


SQL> SELECT ENAME FROM EMP WHERE SAL=
  2  (SELECT SAL FROM EMP WHERE MAX(SAL)='SALESMAN');
(SELECT SAL FROM EMP WHERE MAX(SAL)='SALESMAN')
                           *
ERROR at line 2:
ORA-00934: group function is not allowed here


SQL> SELECT ENAME FROM EMP WHERE MAX(SAL)=
  2  (SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT ENAME FROM EMP WHERE MAX(SAL)=
                            *
ERROR at line 1:
ORA-00934: group function is not allowed here


SQL> SELECT ENAME FROM EMP WHERE SAL=
  2  (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');

ENAME
----------
ALLEN

SQL> SELECT ENAME, SAL FROM EMP WHERE SAL=
  2  (SELECT SAL FROM EMP WHERE JOB='SALESMAN')AND
  3  (SELECT SAL FROM EMP WHERE JOB='CLERK') AND
  4  (SELECT SAL FROM EMP WHERE JOB='PRESIDENT') AND
  5  (SELECT SAL FROM EMP WHERE JOB='MANAGER;
ERROR:
ORA-01756: quoted string not properly terminated
