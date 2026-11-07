-- 1. Select the first name, last name, and city of all students.
SELECT student.name, student.surname, cities.city_name
FROM student
LEFT JOIN cities ON student.city_id = cities.id;

-- 2. Select the first name, last name, and group of students, excluding groups that start with KTn.
SELECT s.name AS first_name, s.surname AS last_name, g.group_name
FROM student s
LEFT JOIN groups g ON s.groups_id = g.id
WHERE g.group_name NOT LIKE 'KTn%';

-- 3. Calculate how many students live in each city.
SELECT cities.city_name, COUNT(student.id) AS student_count
FROM student
JOIN cities ON student.city_id = cities.id
GROUP BY cities.city_name;

-- 4. Count how many students in each group have Active status.
SELECT groups.group_name, COUNT(student.id) AS active_students
FROM student
JOIN groups ON student.groups_id = groups.id
JOIN statuses ON student.status_id = statuses.id
WHERE statuses.status_name = 'Active'
GROUP BY groups.group_name;

-- 5. Display the three groups with the highest number of students.
SELECT groups.group_name, COUNT(student.id) AS total_students
FROM student
JOIN groups ON student.groups_id = groups.id
GROUP BY groups.group_name
ORDER BY total_students DESC
LIMIT 3;

-- 6. Find cities where multiple students have the same first name. Display the city, student name, and number of students with that name.
SELECT cities.city_name, student.name, COUNT(student.id) AS name_count
FROM student
JOIN cities ON student.city_id = cities.id
GROUP BY cities.city_name, student.name
HAVING COUNT(student.id) > 1;

-- 7. Change the status of students in group KTd 03 from Active to Deleted.
UPDATE student
SET status_id = (SELECT id FROM statuses WHERE status_name = 'Deleted')
WHERE status_id = (SELECT id FROM statuses WHERE status_name = 'Active')
  AND groups_id = (SELECT id FROM groups WHERE group_name = 'KTd 03');

-- 8. Calculate the average number of students living in cities and districts using UNION.
SELECT 'City' AS location_type, AVG(student_count) AS avg_students
FROM (
    SELECT COUNT(student.id) AS student_count
    FROM student
    JOIN cities ON student.city_id = cities.id
    WHERE cities.city_name LIKE '%city%'
    GROUP BY cities.city_name
) AS c
UNION
SELECT 'District' AS location_type, AVG(student_count) AS avg_students
FROM (
    SELECT COUNT(student.id) AS student_count
    FROM student
    JOIN cities ON student.city_id = cities.id
    WHERE cities.city_name LIKE '%distr%'
    GROUP BY cities.city_name
) AS d;

-- 9. Delete all students whose status is Holidays.
DELETE FROM student
WHERE status_id = (SELECT id FROM statuses WHERE status_name = 'Holidays');

-- 10. a) Remove Šiauliai city and district information from the student table.
UPDATE student
SET city_id = NULL
WHERE city_id IN (SELECT id FROM cities WHERE city_name LIKE 'Šiaulių%');

-- 10. b) Display all students according to Task 1, sorting students without a city at the bottom of the list.
SELECT student.name, student.surname, cities.city_name
FROM student
LEFT JOIN cities ON student.city_id = cities.id
ORDER BY cities.city_name IS NULL ASC, cities.city_name ASC;