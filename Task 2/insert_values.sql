-- Insert into inventory
INSERT INTO inventory (instrument_type, monthly_fee, brand) VALUES
('Guitar', 50, 'Yamaha'),
('Piano', 100, 'Steinway'),
('Violin', 40, 'Stradivarius'),
('Flute', 30, 'Yamaha'),
('Drum', 60, 'Pearl');

-- Insert into location
INSERT INTO location (room_number) VALUES
('101'),
('102'),
('103'),
('104'),
('105');

-- Insert into price
INSERT INTO price (difficulty, difficulty_price, lesson_type, lesson_type_price) VALUES
('Beginner', 200, 'Individual', 300),
('Beginner', 200, 'Group', 350),
('Beginner', 200, 'Ensemble', 400),
('Intermediate', 300, 'Individual', 300),
('Intermediate', 300, 'Group', 350),
('Intermediate', 300, 'Ensemble', 400),
('Advanced', 400, 'Individual', 300),
('Advanced', 400, 'Group', 350),
('Advanced', 400, 'Ensemble', 400);

-- Insert into student
INSERT INTO student (person_number, first_name, last_name, email, telephone_number, city, street, zip_code, sibling_id, contact_person, sibling_discount) VALUES
('200112201234', 'Zak', 'Ora', 'zak.ora@example.com', '1234567890', 'Stockholm', 'Main St', '11122', NULL, 'Jane Doe', FALSE),
('200201185678', 'Andia', 'Mir', 'andia.mir@example.com', '0987654321', 'Stockholm', 'Second St', '11123', '200201185555', 'John Smith', FALSE),
('200201185555', 'Diana', 'Mir', 'diana.mir@example.com', '1112223333', 'Stockholm', 'Third St', '11124', '200201185678', 'Bob Johnson', FALSE),
('200306128765', 'Henrietta', 'Gidehag', 'henriettagidehag@example.com', '2223334444', 'Stockholm', 'Solna', '11125', NULL, 'Alice Brown', FALSE),
('20020712S005', 'Charlie', 'Davis', 'charlie.davis@example.com', '3334445555', 'Stockholm', 'Fifth St', '11126', NULL, 'David Davis', FALSE);

-- Insert into instructor
INSERT INTO instructor (person_number, first_name, last_name, email, telephone_number, city, street, zip_code, ensemble) VALUES
('198310201111', 'Albus', 'Dumbledore', 'albus.dumbledore@example.com', '1112223333', 'Stockholm', 'Third St', '11124', TRUE),
('187302103333', 'Minerva', 'McGonagall', 'minerva.mcgonagall@example.com', '2223334444', 'Stockholm', 'Fourth St', '11125', TRUE),
('193212285555', 'Severus', 'Snape', 'severus.snape@example.com', '3334445555', 'Stockholm', 'Fifth St', '11126', FALSE),
('200001100000', 'Pomona', 'Sprout', 'pomona.sprout@example.com', '4445556666', 'Stockholm', 'Sixth St', '11127', TRUE),
('199909099999', 'Filius', 'Flitwick', 'filius.flitwick@example.com', '5556667777', 'Stockholm', 'Seventh St', '11128', FALSE);

-- Insert into instrument
INSERT INTO instrument (start_date, end_date, student_id) VALUES
('2024-01-01 10:00:00', '2024-12-31 10:00:00', 1),
('2024-02-01 10:00:00', '2024-11-30 10:00:00', 2),
('2024-03-01 10:00:00', '2024-10-31 10:00:00', 3);

-- Insert into lesson
INSERT INTO lesson (lesson_difficulty, scheduled_time, student_id, location_id, price_id, instructor_id) VALUES
('Beginner', '2024-11-01 10:00:00', 1, 1, 1, 1),
('Intermediate', '2024-11-02 11:00:00', 2, 2, 2, 2),
('Advanced', '2024-11-03 12:00:00', 3, 3, 3, 3),
('Beginner', '2024-11-04 13:00:00', 4, 4, 4, 4),
('Intermediate', '2024-11-05 14:00:00', 5, 5, 5, 5),
('Advanced', '2024-11-06 15:00:00', 1, 1, 1, 1),
('Beginner', '2024-11-07 16:00:00', 2, 2, 2, 2),
('Intermediate', '2024-11-08 17:00:00', 3, 3, 3, 3),
('Advanced', '2024-11-09 18:00:00', 4, 4, 4, 4),
('Beginner', '2024-11-10 19:00:00', 5, 5, 5, 5),
('Beginner', '2024-12-01 10:00:00', 1, 1, 1, 1),
('Intermediate', '2024-12-02 11:00:00', 2, 2, 2, 2),
('Advanced', '2024-12-03 12:00:00', 3, 3, 3, 3),
('Beginner', '2024-12-04 13:00:00', 4, 4, 4, 4),
('Intermediate', '2024-12-05 14:00:00', 5, 5, 5, 5),
('Advanced', '2024-12-06 15:00:00', 1, 1, 1, 1),
('Beginner', '2024-12-07 16:00:00', 2, 2, 2, 2),
('Intermediate', '2024-12-08 17:00:00', 3, 3, 3, 3),
('Advanced', '2024-12-09 18:00:00', 4, 4, 4, 4),
('Beginner', '2024-12-10 19:00:00', 5, 5, 5, 5);

-- Insert into schedule
INSERT INTO schedule (time, instructor_id) VALUES
('2024-11-01 10:00:00', 1),
('2024-11-02 11:00:00', 2),
('2024-11-03 12:00:00', 3),
('2024-11-04 13:00:00', 4),
('2024-11-05 14:00:00', 5),
('2024-11-06 15:00:00', 1),
('2024-11-07 16:00:00', 2),
('2024-11-08 17:00:00', 3),
('2024-11-09 18:00:00', 4),
('2024-11-10 19:00:00', 5),
('2024-12-01 10:00:00', 1),
('2024-12-02 11:00:00', 2),
('2024-12-03 12:00:00', 3),
('2024-12-04 13:00:00', 4),
('2024-12-05 14:00:00', 5),
('2024-12-06 15:00:00', 1),
('2024-12-07 16:00:00', 2),
('2024-12-08 17:00:00', 3),
('2024-12-09 18:00:00', 4),
('2024-12-10 19:00:00', 5);

-- Insert into teaching_instruments
INSERT INTO teaching_instruments (instrument_type, instructor_id) VALUES
('Guitar', 1),
('Piano', 2),
('Violin', 3),
('Flute', 4),
('Drum', 5);

-- Insert into ensemble
INSERT INTO ensemble (lesson_id, genre, min_reg_students, max_reg_students) VALUES
(1, 'Jazz', 5, 10),
(2, 'Classical', 3, 8),
(3, 'Rock', 4, 9),
(4, 'Pop', 2, 7),
(5, 'Blues', 6, 12);

-- Insert into group_lesson
INSERT INTO group_lesson (lesson_id, min_reg_students, instrument) VALUES
(6, 5, 'Guitar'),
(7, 3, 'Piano'),
(8, 4, 'Violin'),
(9, 2, 'Flute'),
(10, 6, 'Drum');

-- Insert into individual_lesson
INSERT INTO individual_lesson (lesson_id, instrument) VALUES
(11, 'Guitar'),
(12, 'Piano'),
(13, 'Violin'),
(14, 'Flute'),
(15, 'Drum');

-- Insert into registered_students
INSERT INTO registered_students (lesson_id, student_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),

-- Insert into student_instrument
INSERT INTO student_instrument (student_id, instrument_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
