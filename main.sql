--Activity #1

CREATE TABLE students (
	id				INTEGER		PRIMARY KEY,
	first_name		VARCHAR(50)	NOT NULL,
	middle_name		VARCHAR(50),
	last_name		VARCHAR(50)	NOT NULL,
	age				INTEGER		NOT NULL,
	location		VARCHAR(50) NOT NULL
);

INSERT INTO students (id, first_name, last_name, age, location)
VALUES 
(1, 'Juan', 'Cruz', 18, 'Manila'),
(2, 'Anne', 'Wall', 20, 'Manila'),
(3, 'Theresa', 'Joseph', 21, 'Manila'),
(4, 'Isaac', 'Gray', 19, 'Laguna'),
(5, 'Zack', 'Matthews', 22, 'Marikina'),
(6, 'Finn', 'Lam', 25, 'Manila');

UPDATE students
SET first_name = 'Ivan', middle_name = 'Ingram', last_name = 'Howard', age = 25, location = 'Bulacan'
WHERE id = 1;

DELETE FROM students
WHERE id = (SELECT MAX(id) FROM students);


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
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F', NULL))
);

INSERT INTO research_papers (student_id, grade)
VALUES
(1, 'A'),
(1, 'B'),
(2, 'C'),
(2, 'D'),
(3, 'A'),
(3, NULL),
(4, 'B'),
(4, 'C'),
(5, 'F'),
(6, NULL);


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
