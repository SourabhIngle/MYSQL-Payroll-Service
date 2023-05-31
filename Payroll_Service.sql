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
