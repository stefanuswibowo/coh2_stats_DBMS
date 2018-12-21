#creating databases
CREATE DATABASE COH2_STATS;
USE COH2_STATS;

CREATE SCHEMA COH2_STATS_ADMIN;
USE COH2_STATS_ADMIN;

#creating table
CREATE TABLE side(
SIDE_ID varchar(2),
side_name varchar(25),
primary key(SIDE_ID)
);

CREATE TABLE object_type(
TYPE_ID varchar(7),
type_name varchar(25),
primary key(TYPE_ID)
);

CREATE TABLE small_arms(
weapon_name varchar(120),
damage_per_second_near int(5),
damage_per_second_mid int(5),
damage_per_second_far int(5),
penetration varchar(20),
range_max int (4),
range_far int (3),
range_near int (3),
SIDE_ID varchar(2),
TYPE_ID varchar(7),
foreign key(SIDE_ID) references side(SIDE_ID),
foreign key(TYPE_ID) references object_type(TYPE_ID)
);

CREATE TABLE ballistic_weapons(
weapon_name varchar(100),
damage int(5),
damage_per_second_min_range int(5),
damage_per_second_mid_range int(5),
damage_per_second_max_range int(5),
Potential_DPS int(6),
scatter_angle int(3),
scatter_distance int(3),
area_of_damage_radius int(3),
area_of_damage_near int(5),
area_of_damage_far int(5),
penetration varchar(50) not null,
range_max int (4),
range_far int(3),
range_near int(4),
SIDE_ID varchar(2),
TYPE_ID varchar(7),
foreign key(SIDE_ID) references side(SIDE_ID),
foreign key(TYPE_ID) references object_type(TYPE_ID)
);

CREATE TABLE explosive_weapons(
weapon_name varchar(300),
damage int(5),
damage_per_second int(5),
damage_near int(3),
damage_far int(3),
area_of_damage_radius int(3),
area_of_damage_near int(5),
area_of_damage_far int(5),
penetration varchar(50) not null,
range_max int(5),
SIDE_ID varchar(2),
TYPE_ID varchar(7),
foreign key(SIDE_ID) references side(SIDE_ID),
foreign key(TYPE_ID) references object_type(TYPE_ID)
);

CREATE TABLE flame_throwers(
weapon_name varchar(120),
damage_per_second_near int(5),
damage_per_second_mid int(5),
damage_per_second_far int(5),
penetration varchar(15),
area_of_damage_radius int(3),
area_of_damage_near int(3),
area_of_damage_far int(4),
range_max int(4),
damage_over_time int(1),
SIDE_ID varchar(2),
TYPE_ID varchar(7),
foreign key(SIDE_ID) references side(SIDE_ID),
foreign key(TYPE_ID) references object_type(TYPE_ID)
);

#input dataset
INSERT INTO
	side (SIDE_ID, side_name)
VALUES
	('OB', 'oberkommando'),
    ('OS', 'ostheer'),
    ('US', 'usa'),
    ('SO', 'soviet');

INSERT INTO
	object_type (TYPE_ID, type_name)
VALUES
	('SM_AR', 'small arms'),
    ('BA_WR', 'ballistic weapons'),
    ('EX_WE', 'explosive weapons'),
    ('FL_TH', 'flame throwers');

#importing file from csv
SET foreign_key_checks = 0;    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/small_arms.csv'
INTO TABLE small_arms
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET foreign_key_checks = 0;    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ballistic_weapons.csv'
INTO TABLE ballistic_weapons
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET foreign_key_checks = 0;    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/explosive_weapons.csv'
INTO TABLE explosive_weapons
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET foreign_key_checks = 0;    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flame_throwers.csv'
REPLACE INTO TABLE flame_throwers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#check the inputted file
SELECT * FROM small_arms;
SELECT * FROM ballistic_weapons;
SELECT * FROM explosive_weapons;

#perform several equation