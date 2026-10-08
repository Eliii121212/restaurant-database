# Restaurant Database

## Project Description
This project contains a relational database for a restaurant booking system. It was designed to manage restaurants, customers, restaurant tables and bookings.

## Database Structure
The database consists of four tables:
- `RESTAURANT` – stores restaurant information.
- `CUSTOMER` – stores customer information.
- `RESTAURANT_TABLE` – stores tables belonging to a restaurant.
- `BOOKING` – stores bookings and links customers to restaurant tables.

## Database Design and Normalization
The project includes:
- `Restaurant_Database_ER.png` – Entity Relationship (ER) diagram.
- `Restaurant_Database_RDM.pdf` – Relational Data Model (RDM).
- `Normalization_3NF.md` – explanation of normalization to Third Normal Form (3NF).

The schema uses primary keys, foreign keys and unique constraints to maintain data integrity. The normalization document explains the design in terms of 1NF, 2NF and 3NF.

## SQL Implementation
The file `restaurant_database.sql` creates the database and tables, defines relationships and constraints, inserts test data, and contains three queries:

1. List all restaurant tables.
2. List bookings for a given customer, ordered by date.
3. List bookings for a given table on a specific date, including customer information.

## Project Files
- `.gitignore` – specifies files Git should ignore.
- `README.md` – project documentation.
- `Restaurant_Database_ER.png` – ER diagram.
- `Restaurant_Database_RDM.pdf` – RDM diagram.
- `Normalization_3NF.md` – normalization explanation.
- `Normalization_3NF.png`– final database schema in 3NF.
- `restaurant_database.sql` – SQL schema, test data and queries 