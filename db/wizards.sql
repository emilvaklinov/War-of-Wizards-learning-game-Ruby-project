DROP TABLE attacks;
DROP TABLE wizards;
DROP TABLE codeclanners;

CREATE TABLE wizards
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  house VARCHAR(255),
  wand VARCHAR(255)

);

CREATE TABLE codeclanners
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  cohort VARCHAR(255)

);

CREATE TABLE attacks
(
  id SERIAL8 primary key,
  wizard_id INT8 references wizards(id) ON DELETE CASCADE,
  codeclanner_id INT8 references codeclanners(id) ON DELETE CASCADE
);
