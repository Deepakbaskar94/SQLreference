
1.   Install Python (ubuntu)
     $sudo apt install software-properties-common
     
     Install Deadsnake PPA.
     $sudo add-apt-repository ppa:deadsnakes/ppa

     Install python version.
     $sudo apt install python3.8

     Check if installed or not.
     $python --version

2.   INSTALL PIP (Windows)

    a) Download PIP get-pip.py
       $curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py


    b) Installing PIP on Windows
       $python -m pip install pip

3.   INSTALL PIP ON LINUX
      
    a) $sudo apt-get -y install python3-pip
    b) $pip3 --version




========================================================================================================================================================================================
========================================================================================================================================================================================
SETUP/USE SQLite on Ubuntu 20.04
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
1.   INSTALL SQLite.
     
     a) lINUX(UBUNTU)

     $sudo apt install sqlite3
     $sqlite3 --version
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2.   CREATE DATABASE.

     $sqlite3 <DATABASE_NAME>.db
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3.   CREATE A TABLE.

     CREATE TABLE sharks(<column_name>, <datatype> <constraint(if_ncessary)>, <column_name>, <datatype> );
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--INSERT DATA TO TABLE.
-----------------------
     INSERT INTO <table_namee>(<COLUMN1  COLUMN2...COLn >) VALUES (<Value1 , value2 , ..valueN>);
     
	 eg: sqlite> insert into DT (col1, col2, col4) values (1,'ABC',1);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

5.   DISPLAY CONTENTS OF A TABLE

     SELECT * FROM <TABLENAME>
     SELECT <COLUMN> <COLUMN> FROM <TABLENAME>

     eg: SELECT name ph_no address FROM TABLE1;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

6.   ADD COLUMN TO A TABLE

     ALTER table <TABLENAME> ADD column <column 1> <datatype>  , <column2> <datatype>;
     eg : alter table DT add column col4 char(5);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

7.   SHOW DETAILS INSIDE TABLE (COL_NAME , DATA TYPE ETC..)
     
     PRAGMA table_info (<TABLENAME>);
     eg:PRAGMA table_info (DT);

     RESULT :
     ------- 

 	    cid         name        type        notnull     dflt_value  pk        
     ----------  ----------  ----------  ----------  ----------  ----------
     0           COL1        integer      0                        1         
     1           COL2        char(10)     0                        0         
     2           COL3        integer      0                        0         
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

8.   SHOW COLUMN HEADER 

     sqlite> .mode column
     sqlite> .header on
     sqlite> select * from <TABLENAME>;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

9.   COPY VALUES FROM ONE COLUMN TO ANOTHER
     
     UPDATE <TABLENAME> SET COLUMN1> < COLUMN2>;
     eg: update DT SET col1= col4;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

10.  ALTER AND RENAME TABLE

     ALTER TABLE <TABLENAME> RENAME TO <NEW_NAME>
     eg: alter table DATA rename to DT;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

11. CREATE A DUPLICATE OF A TABLE

    CREATE TABLE <new_table_name> AS SELECT * FROM <old_table_name;
    eg: CREATE TABLE DATA AS SELECT * FROM DT;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
12. AND , OR and NOT statements.

    SELECT <COLUMS or *> FROM <TABLENAME> WHERE (<column1> = <value> AND <column2> =  <value>);
    eg: select * from DT where (col1 = 1 AND col2 = 'ABC');

    SELECT <COLUMS or *> FROM <TABLENAME> WHERE (<column1> = <value> OR <column2> =  <value>);
    eg: select * from DT where (col1 = 1 OR col2 = 'ABC');

    SELECT <COLUMS or *> FROM <TABLENAME> WHERE <column1> IS NOT <value>;
    eg1: select * from DT where col1 is not 2;
    eg2: select * from DT where col1 not between 3 AND 5 ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
13. COPY VALUES FROM ONE COLUMN TO ANOTHER.
    UPDATE <tableName> SET destinationField = sourceField
    eg: UPDATE DT SET COL3 = COL4 ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

14. SELECT DATA BETWEEN SPECIFIC VALUES 

    SELECT <column_name(s) or (*)>
    FROM <table_name>
    WHERE <column_name> BETWEEN value1 AND value2;
    eg: select * from DT where col1 not between 3 AND 5 ;
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

15. GROUP BY

    SELECT column-list
    FROM table_name
    WHERE [ conditions ]
    GROUP BY column1, column2....columnN
    eg : PENDING(RESULT)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

16. SHOW DATABASE LIST

	sqlite> .databases
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

17. SHOW AVAILABLE TABLE LIST

	sqlite > .tables
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
===============================================================================================================================================================================================
-- TO CONNECT TO DATABASE IN PYTHON
	conn = sqlite3.connect('data.db')													--Connect to database
	cur = conn.cursor()
	
	
	
-- TO INSERT VARIABLE DATA
	cur.execute("INSERT INTO led (ID,Date,Time,Status) values (?,?,?,?) , (num,d1,t1,x)) 
	conn.commit()																		--Save the data's to DATABASE
	
================================================================================================================================================================================================