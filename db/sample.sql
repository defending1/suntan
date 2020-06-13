-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jun 27, 2019 at 01:14 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sampledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

use beach;


CREATE TABLE CODICE_SANITARIO
(
    ID CHAR NOT NULL,
    Colore CHAR (10) NOT NULL,
    Accettato BOOLEAN NOT NULL,
    Rimborso INT NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO CODICE_SANITARIO 
VALUES 
("R", "Rosso", "0", "70"),
("G", "Giallo", "0", "80"),
("V", "Verde", "1", "100");

CREATE TABLE CLIENTE
(
    ID INT NOT NULL AUTO_INCREMENT,
    ID_Sanitario CHAR,
    ID_Ospite INT,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    Mail VARCHAR (50) NOT NULL,
    Password VARCHAR (50) NOT NULL,
    Data_Nascita DATE NOT NULL,
    Residenza VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Sanitario) REFERENCES CODICE_SANITARIO(ID),
    FOREIGN KEY (ID_Ospite) REFERENCES CLIENTE(ID)
);

INSERT INTO CLIENTE VALUES (NULL, NULL, NULL, "Alberto", "Veronesi", "mail.mail@mail.com", "qwerty", "1232-03-21", "Here")