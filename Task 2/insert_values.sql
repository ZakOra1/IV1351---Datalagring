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
INSERT INTO price (difficulty, lesson_type, price) VALUES
('Beginner', 'Individual', '300'),
('Beginner', 'Group', '350'),
('Beginner', 'Ensemble', '400'),
('Intermediate', 'Individual', '300'),
('Intermediate', 'Group', '350'),
('Intermediate', 'Ensemble', '400'),
('Advanced', 'Individual', '300'),
('Advanced', 'Group', '350'),
('Advanced', 'Ensemble', '400');

-- Insert into student
INSERT INTO student (person_number, first_name, last_name, email, telephone_number, city, street, zip_code, sibling_id, contact_person_phone, sibling_discount) VALUES
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
INSERT INTO lesson (lesson_type, lesson_difficulty, scheduled_time, location_id, price_id, instructor_id, instrument, min_reg_students, max_reg_students, genre) VALUES
('Individual', 'Beginner', '2024-11-01 10:00:00', 1, 1, 1, 'Guitar', 1, 10, 'Jazz'),
('Group', 'Intermediate', '2024-11-02 11:00:00', 2, 2, 2, 'Piano', 3, 8, 'Classical'),
('Ensemble', 'Advanced', '2024-11-03 12:00:00', 3, 3, 3, 'Violin', 4, 9, 'Rock'),
('Individual', 'Beginner', '2024-11-04 13:00:00', 4, 4, 4, 'Flute', 2, 7, 'Pop'),
('Group', 'Intermediate', '2024-11-05 14:00:00', 5, 5, 5, 'Drum', 6, 12, 'Blues'),
('Individual', 'Advanced', '2024-11-06 15:00:00', 1, 1, 1, 'Guitar', 1, 10, 'Jazz'),
('Group', 'Beginner', '2024-11-07 16:00:00', 2, 2, 2, 'Piano', 3, 8, 'Classical'),
('Ensemble', 'Intermediate', '2024-11-08 17:00:00', 3, 3, 3, 'Violin', 4, 9, 'Rock'),
('Individual', 'Advanced', '2024-11-09 18:00:00', 4, 4, 4, 'Flute', 2, 7, 'Pop'),
('Group', 'Beginner', '2024-11-10 19:00:00', 5, 5, 5, 'Drum', 6, 12, 'Blues');

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
('2024-11-10 19:00:00', 5);

-- Insert into teaching_instruments
INSERT INTO teaching_instruments (instrument_type, instructor_id) VALUES
('Guitar', 1),
('Piano', 2),
('Violin', 3),
('Flute', 4),
('Drum', 5);

-- Insert into registered_students
INSERT INTO registered_students (lesson_id, student_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);