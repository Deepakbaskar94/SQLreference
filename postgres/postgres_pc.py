##Reference ==========================https://realpython.com/python-sql-libraries/#deleting-table-records
##SQL with python code (we are using mysqlclient) initial sample program for all three models


# 1. mkdir sqlite

# 2. py -3 -m venv .venv

# 3. python -m pip install --upgrade pip

# --for light database
# 4.  pip install psycopg2


####################################################################################################################################################
#In mysqlclient proper method using function method professional
####################################################################################################################################################
import psycopg2
from psycopg2 import OperationalError



#function to create connection
def create_connection(db_name, db_user, db_password, db_host, db_port):
    connection = None
    try:
        connection = psycopg2.connect(
            database=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port,
        )
        print("Connection to PostgreSQL DB successful")
    except OperationalError as e:
        print(f"The error '{e}' occurred")
    return connection


# #function to execute query to insert data
def execute_query(connection, query):
    connection.autocommit = True
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        print("Query executed successfully")
    except OperationalError as e:
        print(f"The error '{e}' occurred")

# #function to retrive the data from the database depends on query
def execute_read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except OperationalError as e:
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
    except OperationalError as e:
        print(f"The error '{e}' occurred")


#calling function to create connection
connection = create_connection("postgres", "postgres", "deepak123", "127.0.0.1", "5432")



####################################################################################################################################################
#calling execute query to create table
####################################################################################################################################################
# create_users_table = """
# CREATE TABLE IF NOT EXISTS users (
#   id SERIAL PRIMARY KEY,
#   name TEXT NOT NULL, 
#   age INTEGER,
#   gender TEXT,
#   nationality TEXT
# )
# """
# execute_query(connection, create_users_table)


####################################################################################################################################################
#calling execute query to insert single data
####################################################################################################################################################
# insertdata = """INSERT INTO users (name,age,gender,nationality) VALUES ('Paul', 32, 'male', 'Australia' )"""

# execute_query(connection,  insertdata)
####################################################################################################################################################
#calling execute query to insert multiple data
####################################################################################################################################################

# users = [
#     ("James", 25, "male", "USA"),
#     ("Leila", 32, "female", "France"),
# ]

# user_records = ", ".join(["%s"] * len(users))
# print(user_records)

# insert_query = (
#     f"INSERT INTO users (name, age, gender, nationality) VALUES {user_records}"
# )

# connection.autocommit = True
# cursor = connection.cursor()
# cursor.execute(insert_query, users)

####################################################################################################################################################
#to retrive data from a table using execute read function
####################################################################################################################################################
select_users = "SELECT * FROM users"
users = execute_read_query(connection, select_users)

    
for user in users:
   print ("ID = ", user[0])
   print ("NAME = ", user[1])
   print ("ADDRESS = ", user[2])
   print ("SALARY = ", user[3], "\n")

print ("Operation done successfully")
    
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
#   name = 'John'
# WHERE
#   id = 1
# """

# execute_query(connection,  update_post_description)

####################################################################################################################################################
#Delete data using execute query
####################################################################################################################################################
 

# delete_comment = "DELETE FROM users WHERE name = 'James'"
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

# add_from_variable = """
# INSERT INTO users (name, age, gender, nationality) VALUES (%s, %s, %s, %s)
# """

# name='deepak'
# age=27
# gender='male'
# country='India'

# values=  (name, age, gender, country)

# execute_query_variable(connection, add_from_variable, values) 