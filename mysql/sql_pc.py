##Reference ==========================https://realpython.com/python-sql-libraries/#deleting-table-records
##SQL with python code (we are using mysqlclient) initial sample program for all three models


# 1. mkdir sqlite

# 2. py -3 -m venv .venv

# 3. python -m pip install --upgrade pip

# --using mysql client
# 4. pip install mysqlclient

####################################################################################################################################################
#for mysql client sample program
####################################################################################################################################################
# import MySQLdb

# hostname = 'localhost'
# username = 'root'
# password = 'root'
# database = 'try1'

# # Simple routine to run a query on a database and print the results:

# def doQuery( conn ) :
#     cur = conn.cursor()

#     cur.execute( "SELECT First_name, Last_name FROM table1" )

#     for firstname, lastname in cur.fetchall() :
#         print( firstname, lastname )


# print( "Using mysqlclient (MySQLdb):" )
# myConnection = MySQLdb.connect( host=hostname, user=username, passwd=password, db=database )
# doQuery( myConnection )

####################################################################################################################################################
#for other two mysql connector and pymysql
####################################################################################################################################################
# print( "Using mysql.connector:" )
# import mysql.connector
# myConnection = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
# doQuery( myConnection )
# myConnection.close()

# print( "Using pymysql:" )
# import pymysql
# myConnection = pymysql.connect( host=hostname, user=username, passwd=password, db=database )
# doQuery( myConnection )
# myConnection.close()

####################################################################################################################################################
#In mysqlclient proper method using function method professional
####################################################################################################################################################
import MySQLdb
from MySQLdb import Error



#function to create connection
def create_connection(host_name, user_name, user_password, database):
    connection = None
    try:
        connection = MySQLdb.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            db=database
            
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")

    return connection


#function to execute query to insert data
def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

#function to retrive the data from the database depends on query
def execute_read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as e:
        print(f"The error '{e}' occurred")
        
#function to execute query to insert data from variable
def execute_query_variable(connection, query, val):
    cursor = connection.cursor()
    try:
        cursor.execute(query, val)
        connection.commit()
        print(query)
        print(val)
        
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")


#calling function to create connection
connection = create_connection("localhost", "root", "root", "try1")



####################################################################################################################################################
#calling execute query to create table
####################################################################################################################################################
# create_users_table = """
# CREATE TABLE IF NOT EXISTS users (
#   id INTEGER PRIMARY KEY AUTO_INCREMENT,
#   name TEXT NOT NULL,
#   age INTEGER,
#   gender TEXT,
#   nationality TEXT
# );
# """

# execute_query(connection, create_users_table) 


####################################################################################################################################################
#calling execute query to insert data in table
####################################################################################################################################################

# create_users = """
# INSERT INTO
#   `users` (`name`, `age`, `gender`, `nationality`)
# VALUES
#   ('James', 25, 'male', 'USA'),
#   ('Leila', 32, 'female', 'France'),
#   ('Brigitte', 35, 'female', 'England'),
#   ('Mike', 40, 'male', 'Denmark'),
#   ('Elizabeth', 21, 'female', 'Canada');
# """

# execute_query(connection, create_users)  

####################################################################################################################################################
#to retrive data from a table using execute read function
####################################################################################################################################################
# select_users = "SELECT * FROM users"
# users = execute_read_query(connection, select_users)

# for user in users:
#     print(user)
    
####################################################################################################################################################
#retrive data depends on where condition using execute read query
####################################################################################################################################################
# select_users = "select name from users where gender='female'"
# users = execute_read_query(connection, select_users)

# for user in users:
#     print(user)
    
    
####################################################################################################################################################
#update data using execute query
####################################################################################################################################################
  
# update_post_description = """
# UPDATE
#   users
# SET
#   name = "John"
# WHERE
#   id = 1
# """

# execute_query(connection,  update_post_description)

####################################################################################################################################################
#Delete data using execute query
####################################################################################################################################################
 

# delete_comment = "DELETE FROM users WHERE name = 'john'"
# execute_query(connection, delete_comment)


####################################################################################################################################################
#Sending data from a variable in direct way
####################################################################################################################################################

# add_from_variable = """
# INSERT INTO users (name, age, gender, nationality) VALUES (%s, %s, %s, %s)
# """

# values=  ('James', 25, 'male', 'USA')

# execute_query_variable(connection, add_from_variable, values) 



####################################################################################################################################################
#Sending data from a variable
####################################################################################################################################################

add_from_variable = """
INSERT INTO users (name, age, gender, nationality) VALUES (%s, %s, %s, %s)
"""

name='deepak'
age=27
gender='male'
country='India'

values=  (name, age, gender, country)

execute_query_variable(connection, add_from_variable, values) 
