# Student Database SQL Assignment

This repository contains a collection of SQL queries written for a student database management assignment. The queries demonstrate various SQL operations including `JOIN`s, data aggregation (`GROUP BY`, `HAVING`), subqueries, `UNION`s, and data manipulation (`UPDATE`, `DELETE`).

## Database Schema Overview
The queries interact with a relational database consisting of the following primary tables:
* `student`: Contains student information (name, surname, city_id, groups_id, status_id).
* `cities`: Contains city names.
* `groups`: Contains student group classifications.
* `statuses`: Tracks the current status of a student (e.g., Active, Deleted, Holidays).

## Included Queries

Below is an overview of the tasks solved in `student_database_queries.sql`:

1. **Basic Joins:** Retrieve all student names, surnames, and their respective cities.
2. **Filtering with Joins:** Retrieve student names and groups, excluding any groups starting with 'KTn'.
3. **Data Aggregation:** Calculate the total number of students residing in each city.
4. **Multi-table Joins & Filtering:** Count the number of 'Active' students in each group.
5. **Sorting & Limiting:** Identify the top 3 groups with the highest student enrollment.
6. **HAVING Clause:** Find cities where multiple students share the exact same first name.
7. **Data Updating with Subqueries:** Change the status of students in the 'KTd 03' group from 'Active' to 'Deleted'.
8. **UNION Operations:** Calculate and compare the average number of students living in areas designated as 'City' vs. 'District'.
9. **Data Deletion:** Remove all records of students currently marked as 'Holidays'.
10. **Advanced Updating & Sorting:** 
    * Set city information to `NULL` for students from Šiauliai.
    * Display all students, sorting those without a registered city at the bottom of the list.

## Usage
To test these queries, import your student database schema into a MySQL environment (e.g., phpMyAdmin, MySQL Workbench) and execute the statements found in `student_database_queries.sql`.
