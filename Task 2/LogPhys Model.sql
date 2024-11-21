CREATE TABLE inventory  (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 monthly_fee INT NOT NULL,
 brand VARCHAR(500) NOT NULL
);

ALTER TABLE inventory  ADD CONSTRAINT PK_inventory  PRIMARY KEY (instrument_id);


CREATE TABLE location (
 location_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 room_number UNIQUE VARCHAR(500) NOT NULL
);

ALTER TABLE location ADD CONSTRAINT PK_location PRIMARY KEY (location_id);


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
 price_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 difficulty_price INT NOT NULL,
 lesson_type_price INT NOT NULL
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (price_id);


CREATE TABLE student (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 sibling_id VARCHAR(500),
 contact_person person NOT NULL,
 sibling_discount BOOLEAN NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE instructor (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 ensemble BOOLEAN NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instrument (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 start_date TIMESTAMP(10) NOT NULL,
 end_date TIMESTAMP(10) NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);


CREATE TABLE lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_difficulty VARCHAR(50) NOT NULL,
 scheduled_time TIMESTAMP(10) NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 location_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE schedule (
 time TIMESTAMP(10),
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);


CREATE TABLE teaching_instruments (
 instrument_type VARCHAR(500) NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);


CREATE TABLE ensemble (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre CHAR(50) NOT NULL,
 min_reg_students INT NOT NULL,
 max_reg_students INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_id);


CREATE TABLE group_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 min_reg_students INT NOT NULL,
 instrument VARCHAR(50) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument VARCHAR(50) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE registered_students (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (instrument_id) REFERENCES inventory  (instrument_id);
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


