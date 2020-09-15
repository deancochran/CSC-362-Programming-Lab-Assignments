/*
  Please work
  Lab 02
  CSC 362 Database Systems
  Dean Cochran

*/

CREATE DATABASE school;

USE school;


CREATE TABLE instructors (
    PRIMARY KEY (instructor_id),
    instructor_id       INT AUTO_INCREMENT,
    inst_first_name     VARCHAR(20),
    inst_last_name      VARCHAR(20),
    campus_phone        VARCHAR(20)
);

/* INSERT commands to put information into our database */
INSERT INTO instructors (instructor_id, inst_first_name, inst_last_name, campus_phone)
VALUES ('1',    'Kira',     'Bently', '363-9948'),
       ('2',    'Timothy',  'Ennis', '527-4992'),
       ('3',    'Shannon',  'Black', '336-5992'),
       ('4',    'Estela',   'Rosales', '322-6992');

SELECT * FROM instructors; 