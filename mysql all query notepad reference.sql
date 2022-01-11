
===============================================================================================================================================================
--Creating Virtual Environment
--------------------------------------------------------------------------

1. mkdir mysql

2. py -3 -m venv .venv

3. pip install mysql-connector-python

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Downloading																
-----------------------------------------------------------------------------

4. Go to below link and select os and click on go to download page.
 
	https://dev.mysql.com/downloads/mysql/
	
	
5. if we click web community then it installs with internet

   if we click other version it will install completely independently.
   
   
6. click on no thanks just start my download.

	Note: for windows direct link (https://dev.mysql.com/downloads/windows/installer/8.0.html)
	
	

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Installation.
----------------------------------------------------------------------------------
7. Developer select

8. go with next 

9. Development computer and default port 3306 - TCP/IP and next

10. give password and add user (give user name and password) - next

11. Atlast Execute.


----------------------------------------------------------------------------------------------------------------------------------------------------------------
--WORKING WITH DATABASE:
-----------------------------------------------------------------------------------

1. SHOW DATABASES;     //to show the list of databases

2. CREATE DATABASE [IF NOT EXISTS] database_name;    --create database db1;

3. USE database_name;		--use db1;

4. DROP DATABASE [IF EXISTS] database_name;		--drop database db1;

5. system  cls   --to clear the mysql client screen



----------------------------------------------------------------------------------------------------------------------------------------------------------------
--WORKING WITH TABLES:(Cricketers - table name)
------------------------------------------------------------------------------------

  --SHOW TABLES;																					--To show tables inside a database .
  
	use db1;
	show tables;
	
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --To create Table: 
-----------------------------------------------------------------------------------

	CREATE TABLE <table_name> ( column1 datatype,  column2 datatype );
	
  Eg:	
	CREATE TABLE CRICKETERS ( 
	First_Name VARCHAR(255), 
	Age int, 
	Birth_Date Date,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  --To get filled automatically with current date
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);--To get filled automatically with current date and time on updated date
	
	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --To add column in a table:
------------------------------------------------------------------------------------

	ALTER TABLE <table_name>   --alter table cricketers
	ADD <column_name> datatype;  -- add date Date;
	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --To show all column names in a table:
---------------------------------------------------------------------------------------
	DESCRIBE <table_name>;
	
	Eg:
	 describe cricketers;
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --To delete a column: 
---------------------------------------------------------------------------------------- 
	ALTER TABLE table_name 
	DROP [COLUMN] column_name;   
	
	Eg:
	 alter table cricketers
	 drop Place_of_birth;
	
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- To delete a table:
----------------------------------------------------------------------------------------
	DROP TABLE <table_name>; 
	
	Eg:
	 drop table cricketers;
	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- INSERT VALUES TO TABLE direct data:
 ---------------------------------------------------------------------------------------
 
	INSERT INTO <TableName> (CustomerName, Address, City)
	VALUES ('data1', 'data2', 'data3');
	
  Eg:
	insert into cricketers (First_Name, Last_Name, Age, Country, Date)
	values ('Deepak', 'baskar', 28, 'India', '1994/11/10');  							--date format should be year/month/date
	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- INSERT VALUES TO TABLE direct data:
 -------------------------------------------------------------------------------------------
 
   INSERT INTO <TableName> (CustomerName, Address, City)
   VALUES ('data1', 'data2', 'data3');
   

----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --UPDATE TABLE:
------------------------------------------------------------------------------------

	UPDATE <tablename>    --update cricketers
	SET ContactName='Juan'	--set Last_Name='Jain'
	WHERE Country='Norway';	--where First_Name='john';
	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --To see all column in a table and to see only selected column
-------------------------------------------------------------------------------------
	SELECT * FROM <tablename>;	--select * from cricketers;
    #OR 
	SELECT <column1>, <column2> .... from <tablename>;
	
	Eg:
	 select First_name, Last_name from cricketers;
	
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --To rename or change table name:
-------------------------------------------------------------------------------------

	ALTER TABLE <oldTableName> RENAME TO <newTableName>;	
	
   Eg:	
	alter table cricketers rename to table1;
	

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 --CREATE A DUPLICATE OF A TABLE
-------------------------------------------------------------------------------------------

	CREATE TABLE <new_table_name> AS SELECT * FROM <old_table_name; 
	
  Eg:	
	create table table2 as select First_name, Last_name from table1;
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DISPLAY TABLE ACCORDING TO AN ORDER
------------------------------------------------------------------------------------------
	
   SELECT * FROM <table_name>
   ORDER BY column1 ASC|DESC;
   Eg:
	SELECT * FROM DT
	ORDER BY  Address  ASC;
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--SELECT DATA'S BETWEEN A VALUE AND ANOTHER
-------------------------------------------------------------------------------------------

	SELECT <column_name(s) or (*)>
	FROM <table_name>
	WHERE <column_name> BETWEEN value1 AND value2;
   
   Eg:
	SELECT *
	FROM DT
	WHERE ID BETWEEN 2 AND 4;
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT DATA USING WHERE CONDITION
-------------------------------------------------------------------------------------------

	Select * FROM <tablename> WHERE Column1 = 'Value1';
	Eg:
	  Select i_name FROM DT WHERE ID=3;
	 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AND , OR , NOT CONDITIONS
--------------------------------------------------------------------------------------------
-----
AND
-----
	SELECT * FROM <TABLENAME>
	WHERE Column1='Value1' AND Column2='Value2';
	Eg:
	  SELECT * FROM DT
	  WHERE ID=1 AND i_name='AB';

-----
OR
-----	  
	  
	SELECT * FROM <TABLENAME>
	WHERE Column1='Value1' OR Column2='Value2';
	Eg:
		SELECT * FROM DT
		WHERE ID=2 OR i_name='AB';

-----
NOT
-----
		
	SELECT * FROM <TABLENAME>
	WHERE NOT Country='Germany'
	Eg:
	  SELECT * FROM DT
	  WHERE NOT ID=3;
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FIND COUNT OF DUPLICATE RECORD FROM A COLUMN IN TABLE
-------------------------------------------------------------------------
	SELECT i_name, 
	COUNT(i_name)
	FROM
	DETAILS
	GROUP BY i_name
	HAVING COUNT(i_name) > 1;
	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COPY VALUES FROM ONE COLUMN TO ANOTHER.														HAVE TO TRY THIS QUERY
------------------------------------------------------------------------						----------------------
	UPDATE <tableName> SET <Column1> = <Column2>;    
	Eg:
	   update DT set i_name = e_name;

==================================================================================

--TURN OFF SAFE UPDATES (Rejects UPDATES and DELETE(S) WITH NO RESTRICTION
(Some of the Commands shows error wiithout turning off this feature)

Steps:
1 . Go to Preferences.
2 . In the pop-up page select "SQL Editor".
3 . Uncheck Safe Updates.

===================================================================================

--If eror pop "pylance not detecting"

(.venv)$python -m pip install pymysql












