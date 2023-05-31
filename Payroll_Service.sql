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

