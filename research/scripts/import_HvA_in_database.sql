/*
    Author: Nastasia Vanderperren
    Goal: script to import csv file in mysql database
*/

DROP DATABASE IF EXISTS bachelorproef;

CREATE DATABASE bachelorproef;

USE bachelorproef;

CREATE TABLE pictures(
    base VARCHAR(255),
    filename VARCHAR(100) PRIMARY KEY,
    extension CHAR(3),
    type VARCHAR(15),
    theme VARCHAR(20),
    period VARCHAR(10)
);

-- location of your csv file
LOAD DATA INFILE '/Users/nastasiavanderperren/iCloud Drive (archief) - 1/Documents/Informatica_Hogent/BA3/bachelorproef/dataset/testset_pictures_HvA.csv'
INTO TABLE pictures
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;