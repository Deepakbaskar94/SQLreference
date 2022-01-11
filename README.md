# SQLreference
all sql reference basic commands single folder

# MYSQLDB (Using My sqlClient)
1. My sql will have all query file and another file is calling that query through python using professional python function.
2. Note: Create the database using mysql workbench in windows or ubuntu through shell

# SQLite (Simple and light weight)
1. SQlite will have all query and python code file.
2. No need to setup anything just create a db through python code it will create a file in root folder.
3. Easy and simple

# SQLite (Simple and light weight)
1. postgres only python code available no query file


# There are thee MySQL adapters for Python that are currently maintained: for MySQL

1. mysqlclient - By far the fastest MySQL connector for CPython. Requires the mysql-connector-c C library to work.

2. PyMySQL - Pure Python MySQL client. According to the maintainer of both mysqlclient and PyMySQL, you should use PyMySQL if:

        You can't use libmysqlclient for some reason.
        You want to use monkeypatched socket of gevent or eventlet.
        You wan't to hack mysql protocol.

3. mysql-connector-python - MySQL connector developed by the MySQL group at Oracle, also written entirely in Python. It's performance appears to be the worst out of the three. Also, due to some licensing issues, you can't download it from PyPI (but it's now available through conda).

# Speed data to understand why we are using Mysql client

MySQL Connector/Python: 23.096168518066406 [sec]
mysqlclient: 6.815327882766724 [sec]
PyMySQL: 24.616853952407837 [sec]
MySQL Connector/Python: 22.619106769561768 [sec]
mysqlclient: 6.607790231704712 [sec]
PyMySQL: 24.410773038864136 [sec]
