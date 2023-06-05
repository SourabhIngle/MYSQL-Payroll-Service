-------------------------UC1-----------------------------
---------CREATING THE PAYROLL SERVICE DATABASE-----------

mysql> create database payroll_service;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| demo_db            |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use payroll_service;
Database changed

--------------------END OF UC1---------------------------

-------------------------UC2-----------------------------
---------CREATE TABLE EMPLOYEE_PAYROLL-----------
mysql> use payroll_service;
Database changed

mysql> EmpID BIGINT(4) PRIMARY KEY auto_increment,
    -> Name VARCHAR(15),
    -> Salary BIGINT(15),
    -> Start_Date DATE
    -> );

    mysql> create table Employee_Payroll(
        -> EmpID BIGINT(4) PRIMARY KEY auto_increment,
        -> Name VARCHAR(15),
        -> Salary BIGINT(15),
        -> Start_Date DATE
        -> );
    Query OK, 0 rows affected, 2 warnings (0.05 sec)

    mysql> show tables;
    +---------------------------+
    | Tables_in_payroll_service |
    +---------------------------+
    | employee_payroll          |
    +---------------------------+
    1 row in set (0.01 sec)

    mysql> DESC Employee_Payroll;
    +------------+-------------+------+-----+---------+----------------+
    | Field      | Type        | Null | Key | Default | Extra          |
    +------------+-------------+------+-----+---------+----------------+
    | EmpID      | bigint      | NO   | PRI | NULL    | auto_increment |
    | Name       | varchar(15) | YES  |     | NULL    |                |
    | Salary     | bigint      | YES  |     | NULL    |                |
    | Start_Date | date        | YES  |     | NULL    |                |
    +------------+-------------+------+-----+---------+----------------+
    4 rows in set (0.00 sec)

--------------------END OF UC2---------------------------


-------------------------UC3-----------------------------
------------ INSERT INTO employee_payroll ---------------
mysql> insert into Employee_Payroll(EmpID, Name, Salary, Start_Date) values (101, "Mike", 65000, '2022-05-01');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Employee_Payroll(EmpID, Name, Salary, Start_Date) values (102, "Rahul", 57000, '2022-03-21');
Query OK, 1 row affected (0.00 sec)

---- EmpID is the primary key so we don't need to initialize EmpID values ----

mysql> insert into Employee_Payroll(Name, Salary, Start_Date) values ("Arun", 77000, '2022-06-5');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Employee_Payroll(Name, Salary, Start_Date) values ("Anjali", 79000, '2022-06-5');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Employee_Payroll(Name, Salary, Start_Date) values ("Sourabh", 88000, '2022-06-5');
Query OK, 1 row affected (0.00 sec)

----------------END OF UC3---------------------------

-------------------------UC4-----------------------------
------------ Retrieve all the data from the -------------
--------------- employee_payroll table. -----------------

mysql> use payroll_service;
Database changed
mysql> Select * from employee_payroll;
+-------+---------+--------+------------+
| EmpID | Name    | Salary | Start_Date |
+-------+---------+--------+------------+
|   101 | Mike    |  65000 | 2022-05-01 |
|   102 | Rahul   |  57000 | 2022-03-21 |
|   103 | Arun    |  77000 | 2022-06-05 |
|   104 | Anjali  |  79000 | 2022-06-05 |
|   105 | Sourabh |  88000 | 2022-06-05 |
+-------+---------+--------+------------+
5 rows in set (0.00 sec)

----------------END OF UC4---------------------------


-------------------------UC5-----------------------------
---------- Find data employee WHERE CONDITION -----------
mysql> use payroll_service;
Database changed
mysql> SELECT salary FROM employee_payroll WHERE name = 'Arun';
--Use SELECT salary FROM employee_payroll WHERE name = 'Arun’
+--------+
| salary |
+--------+
|  77000 |
+--------+
1 row in set (0.00 sec)
--Query: WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
mysql> SELECT salary FROM employee_payroll WHERE start_date BETWEEN CAST('2022-04-01' AS DATE) AND DATE(NOW());
+--------+
| salary |
+--------+
|  65000 |
|  77000 |
|  79000 |
|  88000 |
+--------+
4 rows in set (0.00 sec)

----------------END OF UC5---------------------------


-------------------------UC6-----------------------------
---------- UPDATE employee_payroll set gender -----------
mysql> alter table employee_payroll add Gender varchar(6);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| EmpID      | bigint      | NO   | PRI | NULL    | auto_increment |
| Name       | varchar(15) | YES  |     | NULL    |                |
| Salary     | bigint      | YES  |     | NULL    |                |
| Start_Date | date        | YES  |     | NULL    |                |
| Gender     | varchar(6)  | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Mike' or name = 'Rahul' or name = 'Arun' or  name = 'Sourabh';
Query OK, 4 rows affected (0.00 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+
| EmpID | Name    | Salary | Start_Date | Gender |
+-------+---------+--------+------------+--------+
|   101 | Mike    |  65000 | 2022-05-01 | M      |
|   102 | Rahul   |  57000 | 2022-03-21 | M      |
|   103 | Arun    |  77000 | 2022-06-05 | M      |
|   104 | Anjali  |  79000 | 2022-06-05 | NULL   |
|   105 | Sourabh |  88000 | 2022-06-05 | M      |
+-------+---------+--------+------------+--------+
5 rows in set (0.00 sec)

mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Anjali';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+
| EmpID | Name    | Salary | Start_Date | Gender |
+-------+---------+--------+------------+--------+
|   101 | Mike    |  65000 | 2022-05-01 | M      |
|   102 | Rahul   |  57000 | 2022-03-21 | M      |
|   103 | Arun    |  77000 | 2022-06-05 | M      |
|   104 | Anjali  |  79000 | 2022-06-05 | F      |
|   105 | Sourabh |  88000 | 2022-06-05 | M      |
+-------+---------+--------+------------+--------+
5 rows in set (0.00 sec)

----------------END OF UC6---------------------------


-------------------------UC7-----------------------------
---------- find sum, average, min, max and number--------
--------of male and female employees --------------------
mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Anjali';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+
| EmpID | Name    | Salary | Start_Date | Gender |
+-------+---------+--------+------------+--------+
|   101 | Mike    |  65000 | 2022-05-01 | M      |
|   102 | Rahul   |  57000 | 2022-03-21 | M      |
|   103 | Arun    |  77000 | 2022-06-05 | M      |
|   104 | Anjali  |  79000 | 2022-06-05 | F      |
|   105 | Sourabh |  88000 | 2022-06-05 | M      |
+-------+---------+--------+------------+--------+
5 rows in set (0.00 sec)

mysql> SELECT SUM(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|      287000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|  71750.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|       57000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|       88000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY gender;
+---------------+
| COUNT(salary) |
+---------------+
|             4 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY gender;
+---------------+
| COUNT(salary) |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)

----------------END OF UC7--------------------------


----------------- UC-8 ------------------
---- Extend employee_payroll data store employee information
----like employee Phone, Address and Department.
----(Ensure employee Department is non-nullable fields.
----Add Default Value for Address field.)

mysql> alter table employee_payroll
    -> add Phone_Number bigint(10),
    -> add Address varchar(20) default 'Pune',
    -> add Department varchar(20) not null;
Query OK, 0 rows affected, 1 warning (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| EmpID        | bigint      | NO   | PRI | NULL    | auto_increment |
| Name         | varchar(15) | YES  |     | NULL    |                |
| Salary       | bigint      | YES  |     | NULL    |                |
| Start_Date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(6)  | YES  |     | NULL    |                |
| Phone_Number | bigint      | YES  |     | NULL    |                |
| Address      | varchar(20) | YES  |     | Pune    |                |
| Department   | varchar(20) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+--------------+---------+------------+
| EmpID | Name    | Salary | Start_Date | Gender | Phone_Number | Address | Department |
+-------+---------+--------+------------+--------+--------------+---------+------------+
|   101 | Mike    |  65000 | 2022-05-01 | M      |         NULL | Pune    |            |
|   102 | Rahul   |  57000 | 2022-03-21 | M      |         NULL | Pune    |            |
|   103 | Arun    |  77000 | 2022-06-05 | M      |         NULL | Pune    |            |
|   104 | Anjali  |  79000 | 2022-06-05 | F      |         NULL | Pune    |            |
|   105 | Sourabh |  88000 | 2022-06-05 | M      |         NULL | Pune    |            |
+-------+---------+--------+------------+--------+--------------+---------+------------+
5 rows in set (0.00 sec)

----------------END OF UC8--------------------------


----------------- UC-9 ------------------
---- Ability to extend employee_payroll table to have Basic
-----Pay, Deductions, Taxable Pay, Income Tax, Net Pay ----

mysql> alter table employee_payroll
    -> add Deductions int,
    -> add Taxable_Pay int,
    -> add Income_Tax int,
    -> add Net_Pay int;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| EmpID        | bigint      | NO   | PRI | NULL    | auto_increment |
| Name         | varchar(15) | YES  |     | NULL    |                |
| Salary       | bigint      | YES  |     | NULL    |                |
| Start_Date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(6)  | YES  |     | NULL    |                |
| Phone_Number | bigint      | YES  |     | NULL    |                |
| Address      | varchar(20) | YES  |     | Pune    |                |
| Department   | varchar(20) | NO   |     | NULL    |                |
| Deductions   | int         | YES  |     | NULL    |                |
| Taxable_Pay  | int         | YES  |     | NULL    |                |
| Income_Tax   | int         | YES  |     | NULL    |                |
| Net_Pay      | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)

mysql> alter table employee_payroll
    -> rename column salary to Basic_Pay;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| EmpID        | bigint      | NO   | PRI | NULL    | auto_increment |
| Name         | varchar(15) | YES  |     | NULL    |                |
| Basic_Pay    | bigint      | YES  |     | NULL    |                |
| Start_Date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(6)  | YES  |     | NULL    |                |
| Phone_Number | bigint      | YES  |     | NULL    |                |
| Address      | varchar(20) | YES  |     | Pune    |                |
| Department   | varchar(20) | NO   |     | NULL    |                |
| Deductions   | int         | YES  |     | NULL    |                |
| Taxable_Pay  | int         | YES  |     | NULL    |                |
| Income_Tax   | int         | YES  |     | NULL    |                |
| Net_Pay      | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_Pay | Start_Date | Gender | Phone_Number | Address | Department | Deductions | Taxable_Pay | Income_Tax | Net_Pay |
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
|   101 | Mike    |     65000 | 2022-05-01 | M      |         NULL | Pune    |            |       NULL |        NULL |       NULL |    NULL |
|   102 | Rahul   |     57000 | 2022-03-21 | M      |         NULL | Pune    |            |       NULL |        NULL |       NULL |    NULL |
|   103 | Arun    |     77000 | 2022-06-05 | M      |         NULL | Pune    |            |       NULL |        NULL |       NULL |    NULL |
|   104 | Anjali  |     79000 | 2022-06-05 | F      |         NULL | Pune    |            |       NULL |        NULL |       NULL |    NULL |
|   105 | Sourabh |     88000 | 2022-06-05 | M      |         NULL | Pune    |            |       NULL |        NULL |       NULL |    NULL |
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
5 rows in set (0.00 sec)

----------------END OF UC9--------------------------


----------------- UC-10 --------------------------------
------Ability to make Terissa as part of Sales and------
-----Marketing Department(Add new employee).------------
------Add data in multiple row and column.--------------

mysql> update employee_payroll set Deductions=6500, Taxable_pay=58500, Income_tax=10530, Net_pay=47970
    -> where EmpID=101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deductions=5400, Taxable_pay=51300, Income_tax=9234, Net_pay=42066
    -> where EmpID=102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deductions=7700, Taxable_pay=69300, Income_tax=13860, Net_pay=63140
    -> where EmpID=103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deductions=7900, Taxable_pay=71100, Income_tax=12798, Net_pay=58302
    -> where EmpID=104;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deductions=8800, Taxable_pay=79200, Income_tax=14256, Net_pay=64944
    -> where EmpID=105;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_Pay | Start_Date | Gender | Phone_Number | Address | Department | Deductions | Taxable_Pay | Income_Tax | Net_Pay |
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
|   101 | Mike    |     65000 | 2022-05-01 | M      |         NULL | Pune    |            |       6500 |       58500 |      10530 |   47970 |
|   102 | Rahul   |     57000 | 2022-03-21 | M      |         NULL | Pune    |            |       5700 |       51300 |       9234 |   42066 |
|   103 | Arun    |     77000 | 2022-06-05 | M      |         NULL | Pune    |            |       7700 |       69300 |      13860 |   63140 |
|   104 | Anjali  |     79000 | 2022-06-05 | F      |         NULL | Pune    |            |       7900 |       71100 |      12798 |   58302 |
|   105 | Sourabh |     88000 | 2022-06-05 | M      |         NULL | Pune    |            |       8800 |       79200 |      14256 |   64944 |
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
5 rows in set (0.00 sec)

mysql> update employee_payroll set Phone_Number = 789456123 where EmpID=101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone_Number = 894561237 where EmpID=102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone_Number = 974561238 where EmpID=103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone_Number = 674561238 where EmpID=104;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone_Number = 874561238 where EmpID=105;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_Pay | Start_Date | Gender | Phone_Number | Address | Department | Deductions | Taxable_Pay | Income_Tax | Net_Pay |
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
|   101 | Mike    |     65000 | 2022-05-01 | M      |    789456123 | Pune    |            |       6500 |       58500 |      10530 |   47970 |
|   102 | Rahul   |     57000 | 2022-03-21 | M      |    894561237 | Pune    |            |       5700 |       51300 |       9234 |   42066 |
|   103 | Arun    |     77000 | 2022-06-05 | M      |    974561238 | Pune    |            |       7700 |       69300 |      13860 |   63140 |
|   104 | Anjali  |     79000 | 2022-06-05 | F      |    674561238 | Pune    |            |       7900 |       71100 |      12798 |   58302 |
|   105 | Sourabh |     88000 | 2022-06-05 | M      |    874561238 | Pune    |            |       8800 |       79200 |      14256 |   64944 |
+-------+---------+-----------+------------+--------+--------------+---------+------------+------------+-------------+------------+---------+
5 rows in set (0.00 sec)

mysql> alter table employee_payroll drop column department;
+-------+---------+-----------+------------+--------+--------------+-----------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_Pay | Start_Date | Gender | Phone_Number | Address   | Deductions | Taxable_Pay | Income_Tax | Net_Pay |
+-------+---------+-----------+------------+--------+--------------+-----------+------------+-------------+------------+---------+
|   101 | Mike    |     65000 | 2022-05-01 | M      |    789456123 | Pune      |       6500 |       58500 |      10530 |   47970 |
|   102 | Rahul   |     57000 | 2022-03-21 | M      |    894561237 | Pune      |       5700 |       51300 |       9234 |   42066 |
|   103 | Arun    |     77000 | 2022-06-05 | M      |    974561238 | Pune      |       7700 |       69300 |      13860 |   63140 |
|   104 | Anjali  |     79000 | 2022-06-05 | F      |    674561238 | Pune      |       7900 |       71100 |      12798 |   58302 |
|   105 | Sourabh |     88000 | 2022-06-05 | M      |    874561238 | Pune      |       8800 |       79200 |      14256 |   64944 |
|   106 | Terissa |    100000 | 2022-01-01 | F      |   6865666360 | Bengaluru |      10000 |       90000 |      16200 |   73800 |
+-------+---------+-----------+------------+--------+--------------+-----------+------------+-------------+------------+---------+
6 rows in set (0.00 sec)


mysql> insert into employee_payroll(EmpID, Name, Basic_pay, Start_date, Gender, Phone_Number, Address, Deductions, Taxable_pay, Income_tax, Net_pay)
    -> values (106,"Terissa", 100000, '2022-01-01', 'F', 6865666360, "Bengaluru", 10000, 90000, 16200, 73800);
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+--------------+-----------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_Pay | Start_Date | Gender | Phone_Number | Address   | Deductions | Taxable_Pay | Income_Tax | Net_Pay |
+-------+---------+-----------+------------+--------+--------------+-----------+------------+-------------+------------+---------+
|   101 | Mike    |     65000 | 2022-05-01 | M      |    789456123 | Pune      |       6500 |       58500 |      10530 |   47970 |
|   102 | Rahul   |     57000 | 2022-03-21 | M      |    894561237 | Pune      |       5700 |       51300 |       9234 |   42066 |
|   103 | Arun    |     77000 | 2022-06-05 | M      |    974561238 | Pune      |       7700 |       69300 |      13860 |   63140 |
|   104 | Anjali  |     79000 | 2022-06-05 | F      |    674561238 | Pune      |       7900 |       71100 |      12798 |   58302 |
|   105 | Sourabh |     88000 | 2022-06-05 | M      |    874561238 | Pune      |       8800 |       79200 |      14256 |   64944 |
|   106 | Terissa |    100000 | 2022-01-01 | F      |   6865666360 | Bengaluru |      10000 |       90000 |      16200 |   73800 |
+-------+---------+-----------+------------+--------+--------------+-----------+------------+-------------+------------+---------+
6 rows in set (0.00 sec)

mysql> create table employee_department
    -> (deptID int NOT NULL,
    -> department varchar(15),
    -> EmpID bigint,
    -> primary key(deptID),
    -> foreign key(EmpID) references employee_payroll(EmpID));
Query OK, 0 rows affected (0.11 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_department       |
| employee_payroll          |
+---------------------------+
2 rows in set (0.03 sec)

mysql> insert into employee_department(deptID, department, EmpID) values (1, "Sales", 106);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee_department(deptID, department, EmpID) values (2, "Marketing", 106);
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee_department;
+--------+------------+-------+
| deptID | department | EmpID |
+--------+------------+-------+
|      1 | Sales      |   106 |
|      2 | Marketing  |   106 |
+--------+------------+-------+
2 rows in set (0.00 sec)

----------------END OF UC10--------------------------
