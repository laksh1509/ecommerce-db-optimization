
# SQL Query Optimization using INDEXING (Postgresql)

The project focuses on reducing the time taken to successfully process  a query in SQL. Using the concept of INDEXING, the project was able to successfully reduce the query execution time significantly. 
Built completely on POSTGRES, the project effectively demonstrates the use of Data Definition Language (DML) and Data Manipulation Language (DDL) commands, also some of the major ADMIN COMMANDS & SYSTEM CATALOGUE queries in POSTGRES.
## Data and Schema
The project uses *self generated* random data using the random() function and the basic DDL (Data Definition Language) commands of the SQL language to curate the data tables.

This project has 4 data table schemas:
1. customers
2. products
3. orders
4. order_items


## Data Loading
Using the DML (Data Manipulation Language) commands, random data is inserted into specific tables.
1. The customers table has 100000 random row entries.
2. The products table has 1000 random row entries.
3. The orders table has 1000000 random row entries.
4. The order_items table has 1999691 random row entries.

## Indexing
In order to reduce the time taken to execute a query, specific columns from the schema tables are indexed, reducing the time complexity of query execution and hence optimizing the query performance