CREATE TABLE historical_lessons (
    historical_lesson_id SERIAL PRIMARY KEY,
    lesson_date TIMESTAMP NOT NULL,
    lesson_type VARCHAR(20) NOT NULL, -- 'group', 'individual', or 'ensemble'
    genre VARCHAR(50),               -- Empty if not an ensemble
    instrument VARCHAR(50),          -- Empty if an ensemble
    lesson_price DECIMAL(10, 2) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    student_email VARCHAR(100) NOT NULL
);

-- Insert individual lessons into historical database
INSERT INTO historical_lessons (lesson_date, lesson_type, genre, instrument, lesson_price, student_name, student_email)
SELECT 
    l.scheduled_time AS lesson_date,
    'individual' AS lesson_type,
    NULL AS genre,
    il.instrument AS instrument,
    p.individual_price AS lesson_price,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email AS student_email
FROM 
    lesson l
JOIN 
    individual_lesson il ON l.lesson_id = il.lesson_id
JOIN 
    price p ON l.price_id = p.price_id
JOIN 
    student s ON l.student_id = s.student_id;

-- Insert group lessons into historical database
INSERT INTO historical_lessons (lesson_date, lesson_type, genre, instrument, lesson_price, student_name, student_email)
SELECT 
    l.scheduled_time AS lesson_date,
    'group' AS lesson_type,
    NULL AS genre,
    gl.instrument AS instrument,
    p.group_price AS lesson_price,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email AS student_email
FROM 
    lesson l
JOIN 
    group_lesson gl ON l.lesson_id = gl.lesson_id
JOIN 
    price p ON l.price_id = p.price_id
JOIN 
    registered_students rs ON l.lesson_id = rs.lesson_id
JOIN 
    student s ON rs.student_id = s.student_id;

-- Insert ensemble lessons into historical database
INSERT INTO historical_lessons (lesson_date, lesson_type, genre, instrument, lesson_price, student_name, student_email)
SELECT 
    l.scheduled_time AS lesson_date,
    'ensemble' AS lesson_type,
    e.genre AS genre,
    NULL AS instrument,
    p.group_price AS lesson_price,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email AS student_email
FROM 
    lesson l
JOIN 
    ensemble e ON l.lesson_id = e.lesson_id
JOIN 
    price p ON l.price_id = p.price_id
JOIN 
    registered_students rs ON l.lesson_id = rs.lesson_id
JOIN 
    student s ON rs.student_id = s.student_id;
