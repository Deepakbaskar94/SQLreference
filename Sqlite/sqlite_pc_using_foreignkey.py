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
# CREATE TABLE IF NOT EXISTS users (
#   id INTEGER PRIMARY KEY AUTOINCREMENT,
#   name TEXT NOT NULL,
#   age INTEGER,
#   gender TEXT,
#   nationality TEXT
# );
# """

# create_posts_table = """
# CREATE TABLE IF NOT EXISTS posts(
#   id INTEGER PRIMARY KEY AUTOINCREMENT, 
#   title TEXT NOT NULL, 
#   description TEXT NOT NULL, 
#   user_id INTEGER NOT NULL, 
#   FOREIGN KEY (user_id) REFERENCES users (id)
# );
# """
# create_comments_table = """
# CREATE TABLE IF NOT EXISTS comments (
#   id INTEGER PRIMARY KEY AUTOINCREMENT, 
#   text TEXT NOT NULL, 
#   user_id INTEGER NOT NULL, 
#   post_id INTEGER NOT NULL, 
#   FOREIGN KEY (user_id) REFERENCES users (id) FOREIGN KEY (post_id) REFERENCES posts (id)
# );
# """

# create_likes_table = """
# CREATE TABLE IF NOT EXISTS likes (
#   id INTEGER PRIMARY KEY AUTOINCREMENT, 
#   user_id INTEGER NOT NULL, 
#   post_id integer NOT NULL, 
#   FOREIGN KEY (user_id) REFERENCES users (id) FOREIGN KEY (post_id) REFERENCES posts (id)
# );
# """

# execute_query(connection, create_users_table) 
# execute_query(connection, create_posts_table) 
# execute_query(connection, create_comments_table) 
# execute_query(connection, create_likes_table) 

####################################################################################################################################################
#calling execute query to insert data in table
####################################################################################################################################################

# create_users = """
# INSERT INTO
#   users (name, age, gender, nationality)
# VALUES
#   ('James', 25, 'male', 'USA'),
#   ('Leila', 32, 'female', 'France'),
#   ('Brigitte', 35, 'female', 'England'),
#   ('Mike', 40, 'male', 'Denmark'),
#   ('Elizabeth', 21, 'female', 'Canada');
# """

# create_posts = """
# INSERT INTO
#   posts (title, description, user_id)
# VALUES
#   ("Happy", "I am feeling very happy today", 1),
#   ("Hot Weather", "The weather is very hot today", 2),
#   ("Help", "I need some help with my work", 2),
#   ("Great News", "I am getting married", 1),
#   ("Interesting Game", "It was a fantastic game of tennis", 5),
#   ("Party", "Anyone up for a late-night party today?", 3);
# """ 

# create_comments = """
# INSERT INTO
#   comments (text, user_id, post_id)
# VALUES
#   ('Count me in', 1, 6),
#   ('What sort of help?', 5, 3),
#   ('Congrats buddy', 2, 4),
#   ('I was rooting for Nadal though', 4, 5),
#   ('Help with your thesis?', 2, 3),
#   ('Many congratulations', 5, 4);
# """

# create_likes = """
# INSERT INTO
#   likes (user_id, post_id)
# VALUES
#   (1, 6),
#   (2, 3),
#   (1, 5),
#   (5, 4),
#   (2, 4),
#   (4, 2),
#   (3, 6);
# """

# execute_query(connection, create_users)  
# execute_query(connection, create_posts) 
# execute_query(connection, create_comments)
# execute_query(connection, create_likes)  

####################################################################################################################################################
#to retrive data from a table using execute read function
####################################################################################################################################################
# select_users = "SELECT * FROM comments" 
# users = execute_read_query(connection, select_users)

# for user in users:
#     print(user)
    
####################################################################################################################################################
#retrive data depends on where condition using execute read query
####################################################################################################################################################
select_users_posts = """
SELECT
  users.id,
  users.name,
  posts.description
FROM
  posts
  INNER JOIN users ON users.id = posts.user_id
"""

users_posts = execute_read_query(connection, select_users_posts)

for users_post in users_posts:
    print(users_post)
