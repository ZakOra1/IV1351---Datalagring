INSERT INTO inventory (instrument_type, monthly_fee, brand) VALUES
('Guitar', 500, 'Yamaha'),
('Piano', 1000, 'Steinway'),
('Violin', 409, 'Stradivarius'),
('Flute', 300, 'Yamaha'),
('Drum', 600, 'Pearl');

INSERT INTO location (room_number) VALUES
('101'),
('102'),
('103'),
('104'),
('105');

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

INSERT INTO student (person_number, first_name, last_name, email, telephone_number, city, street, zip_code, contact_person_phone, sibling_discount, contact_person_email) VALUES
('200112201234', 'Zak', 'Ora', 'zak.ora@example.com', '1234567890', 'Stockholm', 'Main St', '11122', '0738631123', TRUE, NULL),
('200012204567', 'Max', 'Ora', 'max.ora@example.com', '0987654321', 'Stockholm', 'Main St', '11123', '0738631123', TRUE, NULL),
('199912208910', 'Felica', 'Ora', 'felicia.ora@example.com', '0787654321', 'Stockholm', 'Main St', '11123', '0738631123', TRUE, NULL),
('200201185678', 'Andia', 'Mir', 'andia.mir@example.com', '0987654321', 'Stockholm', 'Second St', '11123', '0738631122', TRUE, NULL),
('200201185555', 'Diana', 'Mir', 'diana.mir@example.com', '1112223333', 'Stockholm', 'Third St', '11124', '0738631124', TRUE, NULL),
('200306128765', 'Henrietta', 'Gidehag', 'henriettagidehag@example.com', '2223334444', 'Stockholm', 'Solna', '11125', '0738631125', FALSE, NULL),
('20020712S005', 'Charlie', 'Davis', 'charlie.davis@example.com', '3334445555', 'Stockholm', 'Fifth St', '11126', '0738631126', FALSE, NULL), 
('200402151234', 'Anna', 'Karlsson', 'anna.karlsson@example.com', '0701234567', 'Stockholm', 'Birger Jarlsgatan', '11320', '0730012345', FALSE, NULL),
('200503261234', 'Bjorn', 'Andersson', 'bjorn.andersson@example.com', '0707654321', 'Stockholm', 'Sveavagen', '11321', '0730023456', FALSE, NULL), 
('200609141234', 'Clara', 'Johansson', 'clara.johansson@example.com', '0703344556', 'Stockholm', 'Kungsgatan', '11322', '0730034567', FALSE, NULL), 
('200711221234', 'David', 'Larsson', 'david.larsson@example.com', '0709988776', 'Stockholm', 'Storgatan', '11323', '0730045678', FALSE, NULL), 
('200810311234', 'Elsa', 'Svensson', 'elsa.svensson@example.com', '0701122334', 'Stockholm', 'Hamngatan', '11324', '0730056789', FALSE, NULL),
('200901101234', 'Felix', 'Lindberg', 'felix.lindberg@example.com', '0706677889', 'Stockholm', 'Ostermalmsgatan', '11325', '0730067890', FALSE, NULL), 
('201002221234', 'Greta', 'Bergstrom', 'greta.bergstrom@example.com', '0704455667', 'Stockholm', 'Vasagatan', '11326', '0730078901', FALSE, NULL), 
('201103121234', 'Hugo', 'Ekstrom', 'hugo.ekstrom@example.com', '0707788990', 'Stockholm', 'Norrlandsgatan', '11327', '0730089012', FALSE, NULL),
('201205051234', 'Iris', 'Nyberg', 'iris.nyberg@example.com', '0708899776', 'Stockholm', 'Skeppargatan', '11328', '0730090123', FALSE, NULL),
('201305311234', 'Jonas', 'Hedlund', 'jonas.hedlund@example.com', '0705566778', 'Stockholm', 'Hornsgatan', '11329', '0730101234', FALSE, NULL); 

INSERT INTO student_sibling (student_id, sibling_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 5),
(5, 4);


INSERT INTO instructor (person_number, first_name, last_name, email, telephone_number, city, street, zip_code, ensemble) VALUES
('198310201111', 'Albus', 'Dumbledore', 'albus.dumbledore@example.com', '1112223333', 'Stockholm', 'Third St', '11124', TRUE),
('187302103333', 'Minerva', 'McGonagall', 'minerva.mcgonagall@example.com', '2223334444', 'Stockholm', 'Fourth St', '11125', TRUE),
('193212285555', 'Severus', 'Snape', 'severus.snape@example.com', '3334445555', 'Stockholm', 'Fifth St', '11126', FALSE),
('200001100000', 'Pomona', 'Sprout', 'pomona.sprout@example.com', '4445556666', 'Stockholm', 'Sixth St', '11127', TRUE),
('199909099999', 'Filius', 'Flitwick', 'filius.flitwick@example.com', '5556667777', 'Stockholm', 'Seventh St', '11128', FALSE);

INSERT INTO instrument (instrument_id, start_date, end_date, student_id) VALUES
(1, '2024-01-01 10:00:00', '2024-12-31 10:00:00', 1),
(2, '2024-02-01 10:00:00', '2024-11-30 10:00:00', 2),
(3, '2024-03-01 10:00:00', '2024-10-31 10:00:00', 3);

INSERT INTO lesson (lesson_type, lesson_difficulty, scheduled_time, location_id, price_id, instructor_id, instrument, min_reg_students, max_reg_students, genre) VALUES
('Individual', 'Beginner', CURRENT_DATE + INTERVAL '1 day', 1, 1, 1, 'Guitar', 1, 10, 'Jazz'),
('Group', 'Intermediate', CURRENT_DATE + INTERVAL '2 day', 2, 2, 1, 'Piano', 3, 8, 'Classical'),
('Ensemble', 'Advanced', CURRENT_DATE + INTERVAL '3 day', 3, 3, 1, 'Violin', 4, 9, 'Rock'),
('Individual', 'Beginner', CURRENT_DATE + INTERVAL '4 day', 4, 4, 2, 'Flute', 2, 7, 'Pop'),
('Group', 'Beginner', CURRENT_DATE + INTERVAL '5 day', 5, 5, 2, 'Drum', 6, 12, 'Blues'),
('Ensemble', 'Intermediate', CURRENT_DATE + INTERVAL '6 day', 1, 1, 3, 'Guitar', 1, 10, 'Jazz'),
('Individual', 'Advanced', CURRENT_DATE + INTERVAL '7 day', 2, 2, 3, 'Piano', 3, 8, 'Classical'),
('Group', 'Intermediate', CURRENT_DATE + INTERVAL '8 day', 3, 3, 3, 'Violin', 4, 9, 'Rock'),
('Ensemble', 'Advanced', CURRENT_DATE + INTERVAL '9 day', 4, 4, 4, 'Flute', 2, 7, 'Pop'),
('Individual', 'Beginner', CURRENT_DATE + INTERVAL '10 day', 5, 5, 4, 'Drum', 6, 12, 'Blues'),
('Ensemble', 'Beginner', CURRENT_DATE + INTERVAL '1 day', 1, 1, 1, 'Guitar', 1, 10, 'Rock'),
('Ensemble', 'Intermediate', CURRENT_DATE + INTERVAL '2 day', 2, 2, 2, 'Piano', 3, 8, 'Gospel'),
('Ensemble', 'Advanced', CURRENT_DATE + INTERVAL '3 day', 3, 3, 3, 'Violin', 4, 9, 'Punk'),
('Ensemble', 'Beginner', CURRENT_DATE + INTERVAL '4 day', 4, 4, 4, 'Flute', 2, 7, 'Rock');

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

INSERT INTO teaching_instruments (instrument_type, instructor_id) VALUES
('Guitar', 1),
('Piano', 2),
('Violin', 3),
('Flute', 4),
('Drum', 5);

INSERT INTO registered_students (lesson_id, student_id) VALUES
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(12, 1),
(11, 1);
