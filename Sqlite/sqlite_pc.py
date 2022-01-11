##Reference ==========================https://realpython.com/python-sql-libraries/#deleting-table-records
##SQL with python code (we are using mysqlclient) initial sample program for all three models


# 1. mkdir sqlite

# 2. py -3 -m venv .venv

# 3. python -m pip install --upgrade pip

# --for light database
# 4. pip install db-sqlite3


####################################################################################################################################################
#In sqllite proper method using function method professional
####################################################################################################################################################
import sqlite3
from sqlite3 import Error


#giving path to create connection and to create a database file in root directory
def create_connection(path):
    connection = None
    try:
        connection = sqlite3.connect(path)
        print("Connection to SQLite DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")

    return connection


# #function to execute query to insert data

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
        
# #function to execute query to insert data from variable
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
connection = create_connection("db.sqlite")



####################################################################################################################################################
#calling execute query to create table
####################################################################################################################################################
# create_users_table = """
# CREATE TABLE IF NOT EXISTS user1 (
#   id INTEGER PRIMARY KEY AUTOINCREMENT,
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
#   `user1` (`name`, `age`, `gender`, `nationality`)
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
select_users = "SELECT * FROM user1" 
users = execute_read_query(connection, select_users)

for user in users:
    print(user)
    
####################################################################################################################################################
#retrive data depends on where condition using execute read query
####################################################################################################################################################
# select_user1 = "select name from user1 where gender='female'"
# users = execute_read_query(connection, select_user1)

# for user in users:
#     print(user)
    
    
####################################################################################################################################################
#update data using execute query
####################################################################################################################################################
  
# update_post_description = """
# UPDATE
#   user1
# SET
#   name = "John"
# WHERE
#   id = 1
# """

# execute_query(connection,  update_post_description)

####################################################################################################################################################
#Delete data using execute query
####################################################################################################################################################
 

# delete_comment = "DELETE FROM user1 WHERE name = 'john'"
# execute_query(connection, delete_comment)


####################################################################################################################################################
#Sending data from a variable in direct way
####################################################################################################################################################

# add_from_variable = """
# INSERT INTO user1 (name, age, gender, nationality) VALUES (?, ?, ?, ?)
# """

# values=  ('James', 25, 'male', 'USA')

# execute_query_variable(connection, add_from_variable, values) 



####################################################################################################################################################
#Sending data from a variable
####################################################################################################################################################

# add_from_variable = """
# INSERT INTO user1 (name, age, gender, nationality) VALUES (?, ?, ?, ?)
# """

# name='deepak'
# age=27
# gender='male'
# country='India'

# values=  (name, age, gender, country)

# execute_query_variable(connection, add_from_variable, values) 
