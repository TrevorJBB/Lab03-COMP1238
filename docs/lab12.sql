-- Trevor Brandt-Bos
-- List of all succesful queries

-- Adds a dash in between the course name and semester. 
SELECT CONCAT(course_name, ' - ', semester) FROM courses;

-- Labs on Fridays
SELECT course_id, course_name, lab_time FROM courses WHERE lab_time LIKE 'Fri%';

-- Finds all upcoming assignments
SELECT * FROM assignments WHERE due_date > CURRENT_DATE;

-- Count assignments by their status
SELECT status, COUNT(*) FROM assignments GROUP BY status;

-- Longest Course
SELECT course_name FROM courses ORDER BY LENGTH(course_name) DESC LIMIT 1;

-- Uppercase course names
SELECT UPPER(course_name) FROM courses;

-- Assignments that are due in September
SELECT title, due_date FROM assignments WHERE due_date LIKE '%-09-%';

-- Missing due dates
SELECT * FROM assignments WHERE due_date IS NULL;

-- OPTIONAL TASKS

-- Assignments per course
SELECT course.course_id, COUNT(assignment.title) FROM courses course LEFT JOIN assignments assignment ON course.course_id = assignment.course_id GROUP BY course.course_id;

-- Courses without assignments
SELECT course.course_id, course.course_name FROM courses course LEFT JOIN assignments assignment ON course.course_id = assignment.course_id WHERE assignment.id IS NULL;
