--Activity #1

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    location VARCHAR(50) NOT NULL
);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES 
(1, 'Juan', 'Blank', 'Cruz', 18, 'Manila'),
(2, 'Anne', 'Blank', 'Wall', 20, 'Manila'),
(3, 'Theresa', 'Blank', 'Joseph', 21, 'Manila'),
(4, 'Isaac', 'Blank', 'Gray', 19, 'Laguna'),
(5, 'Zack', 'Blank', 'Matthews', 22, 'Marikina'),
(6, 'Finn', 'Blank', 'Lam', 25, 'Manila');


SELECT * FROM students;

UPDATE students
SET first_name = 'Ivan', middle_name = 'Ingram', last_name = 'Howard', age = 25, location = 'Bulacan'
WHERE id = 1;

SELECT * FROM students;

DELETE FROM students
WHERE id = (SELECT MAX(id) FROM students);

SELECT * FROM students;


----------------------------------------------------------------

--Activity #2

SELECT COUNT(*) AS no_of_students FROM students;

SELECT * FROM students
WHERE location = 'Manila';

SELECT AVG(age) AS avg_stdn_age from students;

SELECT * FROM students
ORDER BY age DESC;


----------------------------------------------------------------

--JOINS Activity

CREATE TABLE research_papers (
    id PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F', NULL))
);

INSERT INTO research_papers (id, student_id, grade)
VALUES
(100, 1, 'A'),
(101, 1, 'B'),
(102, 2, 'C'),
(103, 3, 'D'),
(104, 3, 'A'),
(105, 4, NULL),
(106, 4, 'B'),
(107, 5, 'C'),
(108, 6, 'F'),
(109, 6, NULL);

SELECT * FROM research_papers;

SELECT 
    s.first_name, 
    s.last_name, 
    COUNT(rp.id) AS number_of_research_papers
FROM 
    students s
JOIN 
    research_papers rp ON s.id = rp.student_id
GROUP BY 
    s.id
HAVING 
    COUNT(rp.id) > 1;


SELECT 
    s.first_name, 
    s.last_name, 
    rp.id AS research_paper_id, 
    rp.grade
FROM 
    students s
JOIN 
    research_papers rp ON s.id = rp.student_id
WHERE 
    rp.grade IS NULL;