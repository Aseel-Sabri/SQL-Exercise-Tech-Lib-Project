# SQL Exercise: Tech-Lib Project

This repository contains a SQL exercise project called "Tech-Lib," which is designed to practice SQL queries and concepts. The project simulates a library management system, allowing you to track books, borrowers, loans, and gain insights into borrowing trends. 

## Table of Contents

- [Project Overview](#project-overview)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [Queries and Concepts](#queries-and-concepts)

## Overview

Tech-Lib is a simple SQL project that provides a hands-on experience with SQL Server and database management. It models a library system where you can interact with tables representing books, borrowers, and loans.

## Database Schema

The database schema for the Tech-Lib project consists of several tables:

- **Books**:
    - BookID (PK)
    - Title
    - Author
    - ISBN
    - Published Date
    - Genre
    - Shelf Location
    - Current Status ('Available' or 'Borrowed')
- **Borrowers**:
    - BorrowerID (PK)
    - First Name
    - Last Name
    - Email
    - Date of Birth
    - Membership Date
- **Loans**:
    - LoanID (PK)
    - BookID (FK)
    - BorrowerID (FK)
    - Date Borrowed
    - Due Date
    - Date Returned (NULL if not returned yet)

## Getting Started

To get started with the Tech-Lib project, follow these steps:

1. Clone this repository to your local machine using `git clone`.

2. Set up a SQL Server environment, such as Microsoft SQL Server or SQL Server Express, to run the project.

3. Use `create_tables.sql` script to create the database and tables.

4. Execute `create_indexes.sql` to create indexes for the tables.

5. Execute `book_seed.sql`, `borrower_seed.sql`, and `loan_seed.sql` scripts for data seeding. Note that `loan_seed.sql` must be executed after the other two.




## Queries and Concepts

In this repository, you'll find a collection of SQL queries, functions, and stored procedure. They fall under different categories, including:

- Selecting and filtering data
- Joins and relationships
- Aggregation and grouping
- Ranking and Window functions
- Subqueries and common table expressions (CTEs)
- Triggers
- Indexing and performance optimization

