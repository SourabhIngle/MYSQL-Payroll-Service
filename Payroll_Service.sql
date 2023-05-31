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