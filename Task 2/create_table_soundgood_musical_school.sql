CREATE TABLE instructor (
 instructor_id SERIAL NOT NULL,
 ensemble BOOLEAN NOT NULL,
 person_number UNIQUE VARCHAR(500) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 email VARCHAR(500),
 telephone_number VARCHAR(13) NOT NULL,
 city VARCHAR(500) NOT NULL,
 street VARCHAR(500) NOT NULL,
 zip_code VARCHAR(5) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE inventory  (
 instrument_id SERIAL NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 monthly_fee INT NOT NULL,
 brand VARCHAR(500) NOT NULL
);

ALTER TABLE inventory  ADD CONSTRAINT PK_inventory  PRIMARY KEY (instrument_id);


CREATE TABLE location (
 location_id SERIAL NOT NULL,
 room_number UNIQUE VARCHAR(500) NOT NULL
);

ALTER TABLE location ADD CONSTRAINT PK_location PRIMARY KEY (location_id);


CREATE TABLE price (
 price_id SERIAL NOT NULL,
 difficulty VARCHAR(50) NOT NULL,
 lesson_type VARCHAR(50) NOT NULL,
 price VARCHAR(50)
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (price_id);


CREATE TABLE schedule (
 time TIMESTAMP(10),
 instructor_id INT NOT NULL
);


CREATE TABLE student (
 student_id SERIAL NOT NULL,
 sibling_id INT,
 sibling_discount BOOLEAN NOT NULL,
 person_number UNIQUE VARCHAR(500) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 email VARCHAR(500),
 telephone_number VARCHAR(13) NOT NULL,
 city VARCHAR(500) NOT NULL,
 street VARCHAR(500) NOT NULL,
 zip_code VARCHAR(5) NOT NULL,
 contact_person_phone VARCHAR(50) NOT NULL,
 contact_person_email VARCHAR(50)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE teaching_instruments (
 instrument_type VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL
);


CREATE TABLE instrument (
 instrument_id INT NOT NULL,
 start_date TIMESTAMP(10) NOT NULL,
 end_date TIMESTAMP(10) NOT NULL,
 student_id INT NOT NULL
);


CREATE TABLE lesson (
 lesson_id SERIAL NOT NULL,
 lesson_type VARCHAR(10) NOT NULL,
 lesson_difficulty VARCHAR(50) NOT NULL,
 scheduled_time TIMESTAMP(10) NOT NULL,
 location_id INT NOT NULL,
 price_id INT NOT NULL,
 instructor_id INT NOT NULL,
 instrument VARCHAR(50) NOT NULL,
 min_reg_students INT,
 max_reg_students INT,
 genre VARCHAR(50)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE registered_students (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);


ALTER TABLE schedule ADD CONSTRAINT FK_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE teaching_instruments ADD CONSTRAINT FK_teaching_instruments_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_id) REFERENCES inventory  (instrument_id);
ALTER TABLE instrument ADD CONSTRAINT FK_instrument_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (location_id) REFERENCES location (location_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (price_id) REFERENCES price (price_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE registered_students ADD CONSTRAINT FK_registered_students_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE registered_students ADD CONSTRAINT FK_registered_students_1 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


CREATE OR REPLACE FUNCTION enforce_instrument_limit()
RETURNS TRIGGER AS $$
BEGIN
    -- Count active rentals for the student
    IF (
        SELECT COUNT(*)
        FROM instrument
        WHERE student_id = NEW.student_id
          AND start_date <= NOW()
          AND end_date >= NOW()
    ) >= 2 THEN
        RAISE EXCEPTION 'A student can only rent up to two instruments at a time.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_instrument_limit_trigger
BEFORE INSERT OR UPDATE ON instrument
FOR EACH ROW
EXECUTE FUNCTION enforce_instrument_limit();
