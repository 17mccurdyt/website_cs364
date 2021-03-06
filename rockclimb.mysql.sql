DROP DATABASE IF EXISTS rockclimb;
CREATE DATABASE rockclimb;
USE rockclimb;

CREATE TABLE workout (
        workout_count INTEGER AUTO_INCREMENT NOT NULL,
        date DATE NOT NULL,
        time TIME NOT NULL,
        duration INTEGER NOT NULL,
        comments VARCHAR(255),

        PRIMARY KEY (workout_count)
);


CREATE TABLE speed (
        workout_count INTEGER,
        speedTime DECIMAL(4,2), 
        attempts INTEGER ,

        PRIMARY KEY (workout_count),
        FOREIGN KEY (workout_count) REFERENCES workout (workout_count)
                ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE boulder (
        workout_count INTEGER,
        bGrade INTEGER,
        typeOfGrade VARCHAR(10),

        PRIMARY KEY (workout_count),
        FOREIGN KEY (workout_count) REFERENCES workout (workout_count)
                ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE sport (
        workout_count INTEGER,
        timeARC INTEGER,
        arcGrade INTEGER ,
        highestGrade INTEGER ,
        PRIMARY KEY (workout_count),
        FOREIGN KEY (workout_count) REFERENCES workout (workout_count)
                ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE user (
        user_id INTEGER AUTO_INCREMENT NOT NULL,
        weight Double Precision NOT NULL,
        height Double Precision NOT NULL,
        birthdate DATE NOT NULL,
        username VARCHAR(50) NOT NULL,
        password VARCHAR(512) NOT NULL,
        PRIMARY KEY (user_id)
);


CREATE TABLE user_work (
        workout_count INTEGER,
        user_id INTEGER,

        PRIMARY KEY (workout_count, user_id),
        FOREIGN KEY (user_id) REFERENCES user (user_id)
                ON UPDATE CASCADE ON DELETE RESTRICT,
        FOREIGN KEY (workout_count) REFERENCES workout (workout_count)
                ON UPDATE CASCADE ON DELETE RESTRICT
);



                
                
INSERT INTO user (username, weight, height, birthdate, password) VALUES
        ('caleb', '75', '160','1998-02-10', (SELECT SHA1('1234'))),
        ('cassie','60','140','1997-01-11', (SELECT SHA1('password'))),
        ('tom','70','165','1998-10-15', (SELECT SHA1('test'))),
        ('zachery','100','110','1980-10-10', (SELECT SHA1('4567')));


INSERT INTO workout (date, time, duration, comments) VALUES
        ('2020-11-11', '12:10:10', '100', 'hard as hell'),
        ('2020-11-11', '12:11:10', '120', 'easy'),
        ('2020-12-12', '01:01:00', '90', 'crimps!'),
        ('2020-10-10', '10:10:10', '30', 'short and sweet'),
        ('2020-09-09', '09:00:00', '400', 'proj day'),
        ('2021-11-11', '13:01:11', '10', 'I touched the wall'),
        ('2020-01-01', '00:00:01', '100', 'start the new year off right'),
        ('2021-02-02', '12:12:12', '100', ''),
        ('1010-10-10', '12:12:12', '200', 'speed test'),
	('2020-04-01', '12:12:12', '60', 'speed 1'),
	('2020-04-02', '12:12:12', '65', 'speed 2'),
	('2020-04-03', '12:12:12', '70', 'speed 3'),
	('2020-04-04', '12:12:12', '70', 'sport 1'),
	('2020-04-05', '12:12:12', '75', 'sport 2'),
	('2020-04-06', '12:12:12', '80', 'sport 3'),
	('2020-04-07', '12:12:12', '80', 'boulder 1'),
	('2020-04-08', '12:12:12', '85', 'boulder 2'),
	('2020-04-09', '12:12:12', '80', 'boulder 3'),
	('2020-04-10', '12:12:12', '95', 'boulder 4');

INSERT INTO boulder (workout_count,typeOfGrade, bgrade) VALUES
        ((SELECT workout_count
            FROM workout
            WHERE date = '2021-02-02'), 'crimp', '6'),
        ((SELECT workout_count
            FROM workout
            WHERE date = '2020-09-09'), 'dyno', '4'),
        ((SELECT workout_count
            FROM workout
            WHERE date = '2020-11-11' AND time = '12:10:10'), 'jugs', '5'),
	((SELECT workout_count
		FROM workout
		WHERE date = '2020-04-07'), 'crimps', '7'),
	 ((SELECT workout_count
                FROM workout
                WHERE date = '2020-04-08'), 'dyno', '2'),
	 ((SELECT workout_count
                FROM workout
                WHERE date = '2020-04-09'), 'crimps', '4'),
	 ((SELECT workout_count
                FROM workout
                WHERE date = '2020-04-10'), 'jugs', '6');




INSERT INTO sport (workout_count, timeARC, arcGrade, highestGrade) VALUES
        ((SELECT workout_count
            FROM workout
            WHERE date = '2020-10-10'),'100', '6', '12'),
        ((SELECT workout_count
            FROM workout
            WHERE date = '2020-12-12'),'57', '7', '6'),
        ((SELECT workout_count
            FROM workout
            WHERE date = '2020-11-11' AND time = '12:11:10'),'200', '8', '14'),
	((SELECT workout_count 
		FROM workout
		WHERE date = '2020-04-04'), '12','6','12'),
	 ((SELECT workout_count
                FROM workout
                WHERE date = '2020-04-05'), '25','10','11'),
	 ((SELECT workout_count
                FROM workout
                WHERE date = '2020-04-06'), '35','8','10');

INSERT INTO speed (workout_count,speedTime, attempts) VALUES
        ((SELECT workout_count
            FROM workout
            WHERE date = '2020-01-01'), '6', '6'),
        ((SELECT workout_count
            FROM workout
            WHERE date = '2021-11-11'), '10', '4'),
        ((SELECT workout_count
            FROM workout
            WHERE date='1010-10-10'), '3','2'),
	((SELECT workout_count 
		FROM workout
		WHERE date='2020-04-01'), '4', '4'),
	 ((SELECT workout_count
                FROM workout
                WHERE date='2020-04-02'), '5', '6'),
	 ((SELECT workout_count
                FROM workout
                WHERE date='2020-04-03'), '10', '3');

INSERT INTO user_work (workout_count, user_id) VALUES
        ((SELECT workout_count FROM workout WHERE date = '2020-11-11' AND time = '12:10:10'), (SELECT user_id FROM user WHERE username = 'caleb')),
        ((SELECT workout_count FROM workout WHERE date = '2020-11-11' AND time = '12:11:10'), (SELECT user_id FROM user WHERE username = 'cassie')),
         ((SELECT workout_count FROM workout WHERE date = '2020-12-12' AND time = '01:01:00'), (SELECT user_id FROM user WHERE username = 'tom')),
         ((SELECT workout_count FROM workout WHERE date = '2020-10-10' AND time = '10:10:10'), (SELECT user_id FROM user WHERE username = 'zachery')),
         ((SELECT workout_count FROM workout WHERE date = '2020-09-09'), (SELECT user_id FROM user WHERE username = 'caleb')),
        ((SELECT workout_count FROM workout WHERE date = '2021-11-11'), (SELECT user_id FROM user WHERE username = 'tom')),
        ((SELECT workout_count FROM workout WHERE date = '2020-01-01'), (SELECT user_id FROM user WHERE username = 'tom')),
        ((SELECT workout_count FROM workout WHERE date = '2021-02-02'), (SELECT user_id FROM user WHERE username = 'zachery')),
        ((SELECT workout_count FROM workout WHERE date = '1010-10-10'), (SELECT user_id FROM user WHERE username = 'zachery')),
        ((SELECT workout_count FROM workout WHERE date = '2020-04-01'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-02'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-04'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-05'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-06'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-03'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-07'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-08'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-09'), (SELECT user_id FROM user WHERE username = 'tom')),
	((SELECT workout_count FROM workout WHERE date = '2020-04-10'), (SELECT user_id FROM user WHERE username = 'tom'));
