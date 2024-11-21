CREATE TABLE inventory (
    instrument_id SERIAL NOT NULL,
    instrument_type VARCHAR(500) NOT NULL,
    monthly_fee INT NOT NULL,
    brand VARCHAR(500) NOT NULL,
    PRIMARY KEY (instrument_id)
);

CREATE TABLE location (
    location_id SERIAL NOT NULL,
    room_number UNIQUE VARCHAR(500) NOT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE person (
    person_number UNIQUE VARCHAR(500) NOT NULL,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    email VARCHAR(500),
    telephone_number VARCHAR(13) NOT NULL,
    city VARCHAR(500) NOT NULL,
    street VARCHAR(500) NOT NULL,
    zip_code VARCHAR(5) NOT NULL
);

CREATE TABLE price (
    price_id SERIAL NOT NULL,
    difficulty_price INT NOT NULL,
    lesson_type_price INT NOT NULL,
    PRIMARY KEY (price_id)
);

CREATE TABLE student (
    student_id SERIAL NOT NULL,
    sibling_id VARCHAR(500),
    contact_person VARCHAR(500) NOT NULL,
    sibling_discount BOOLEAN NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE instructor (
    instructor_id SERIAL NOT NULL,
    ensemble BOOLEAN NOT NULL,
    PRIMARY KEY (instructor_id)
);

CREATE TABLE instrument (
    instrument_id SERIAL NOT NULL,
    start_date TIMESTAMP(10) NOT NULL,
    end_date TIMESTAMP(10) NOT NULL,
    student_id INT,
    PRIMARY KEY (instrument_id)
);

CREATE TABLE lesson (
    lesson_id SERIAL NOT NULL,
    lesson_difficulty VARCHAR(50) NOT NULL,
    scheduled_time TIMESTAMP(10) NOT NULL,
    student_id INT,
    location_id INT,
    price_id INT,
    instructor_id INT,
    PRIMARY KEY (lesson_id)
);

CREATE TABLE schedule (
    time TIMESTAMP(10),
    instructor_id INT
);

CREATE TABLE teaching_instruments (
    instrument_type VARCHAR(500) NOT NULL,
    instructor_id INT
);

CREATE TABLE ensemble (
    lesson_id SERIAL NOT NULL,
    genre CHAR(50) NOT NULL,
    min_reg_students INT NOT NULL,
    max_reg_students INT NOT NULL,
    PRIMARY KEY (lesson_id)
);

CREATE TABLE group_lesson (
    lesson_id SERIAL NOT NULL,
    min_reg_students INT NOT NULL,
    instrument VARCHAR(50) NOT NULL,
    PRIMARY KEY (lesson_id)
);

CREATE TABLE individual_lesson (
    lesson_id SERIAL NOT NULL,
    instrument VARCHAR(50) NOT NULL,
    PRIMARY KEY (lesson_id)
);

CREATE TABLE registered_students (
    lesson_id INT,
    student_id INT
);

ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_id) REFERENCES inventory (instrument_id);
ALTER TABLE instrument ADD CONSTRAINT FK_instrument_1 FOREIGN KEY (student_id) REFERENCES student (student_id);

ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (location_id) REFERENCES location (location_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (price_id) REFERENCES price (price_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_3 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE schedule ADD CONSTRAINT FK_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE teaching_instruments ADD CONSTRAINT FK_teaching_instruments_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);

ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);

ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);

ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);

ALTER TABLE registered_students ADD CONSTRAINT FK_registered_students_0 FOREIGN KEY (lesson_id) REFERENCES ensemble (lesson_id);
ALTER TABLE registered_students ADD CONSTRAINT FK_registered_students_1 FOREIGN KEY (student_id) REFERENCES student (student_id);

-- Create the table for student-instrument relationship
CREATE TABLE student_instrument (
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,
    PRIMARY KEY (student_id, instrument_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (instrument_id) REFERENCES instrument(instrument_id)
);

-- Create the trigger to enforce the 0..2 constraint
CREATE TRIGGER check_instrument_limit
BEFORE INSERT ON student_instrument
FOR EACH ROW
BEGIN
    DECLARE instrument_count INT;
    -- Count the number of instruments the student is currently renting
    SELECT COUNT(*) INTO instrument_count
    FROM student_instrument
    WHERE student_id = NEW.student_id;
    
    -- Check if the count exceeds 2
    IF instrument_count >= 2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A student can rent a maximum of 2 instruments.';
    END IF;
END;
