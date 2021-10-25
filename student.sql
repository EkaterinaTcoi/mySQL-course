DROP TABLE student;

CREATE TABLE student(
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT,
major VARCHAR(20) DEFAULT 'undecided',
course INT        
);

SELECT * FROM student;

INSERT INTO student(name, age, major, course) VALUES('Nataly', 20, 'Sociology', 2);
INSERT INTO student(name, age, major, course) VALUES('Mark',19, 'Histiry', 1);
INSERT INTO student(name, age, major, course) VALUES('Kate', 22, 'Psychology', 4);
INSERT INTO student(name, age, course) VALUES('Tad', 22, 4);
INSERT INTO student(name, age, major, course) VALUES('Jack', 24, 'Business', 6);
INSERT INTO student(name, age, major, course) VALUES('Juls', 20, 'Math', 2);
INSERT INTO student(name, age, major, course) VALUES('Glenn', 19, 'Science', 1);
INSERT INTO student(name, age, major, course) VALUES('Robert', 24, 'Philosophy', 6);
INSERT INTO student(name, age, major, course) VALUES('Lucas', 21, 'Math', 3);
INSERT INTO student(name, age, course) VALUES('Max', 19, 1);

SELECT * FROM student;

UPDATE student
SET major = 'Biology'
WHERE student_id = 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET major = 'Bio'
WHERE major = 'Math';

DELETE FROM student
WHERE student_id = 6;

DELETE FROM student
WHERE name = 'Lucas' OR major = 'undecided';

DROP TABLE personal_data;

CREATE TABLE personal_data(
id INT,
address VARCHAR(40) NOT NULL,
city VARCHAR(20) NOT NULL,
scoole VARCHAR(20) NOT NULL,
score INT,
FOREIGN KEY (id) REFERENCES student (student_id)
); 

SELECT * FROM personal_data;

INSERT INTO personal_data (id, address, city, scoole, score)
VALUES (1, '22 King\'s way', 'London', 'St.Lucas', 34),
	   (2, '37 Oxford St.', 'London', 'London City', 56),
       (3, '24 Farringdon Road', 'Brighton', 'Brighton Scoole', 67),
       (4, '47 Liverpool St,', 'Liverpool', 'Liverpool Scoole', 65),
       (5, '3 Queens way', 'London', 'ArtScoole of London', 65),
       (6, '44 Boon st.', 'Bath', 'Bath Scoole', 85);
       
  


