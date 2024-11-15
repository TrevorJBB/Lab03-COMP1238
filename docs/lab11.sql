-- List of all the queries that were ran successfully


-- Earliest Due Date
SELECT MIN(due_date) AS earliestDueDate FROM assignments;

-- Latest Due Date
SELECT MAX(due_date) AS latestDueDate FROM assignments;

-- Specific Due Date
SELECT title, course_id FROM assignments WHERE due_date = '2024-09-10';

-- October Due Dates
SELECT title, due_date FROM assignments WHERE due_date LIKE '2024-10%';

-- Most recent completed assignment
SELECT MAX(due_date), title, course_id FROM assignments WHERE status = 'Completed';

-- Assignments from a specific course
SELECT title, due_date FROM assignments WHERE course_id = 'COMP1234';

-- Optional Tasks

-- Count not started
SELECT COUNT(*) AS notStarted FROM assignments WHERE status = 'Not Started';

-- Lab classes on a tuesday
SELECT course_id, course_name FROM courses WHERE lab_time LIKE 'Tue%';

-- Joining two tables together
-- This was a bit of a doozy - Trevor Brandt-Bos
-- I struggled with this query because it took me a bit to figure out what the proper formatting was for the FROM and JOIN. 
SELECT courses.course_id, courses.course_name, assignments.title, assignments.due_date from courses join assignments on courses.course_id = assignments.course_id;