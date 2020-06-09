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

create database beach;
use beach;


CREATE TABLE CODICE_SANITARIO
(
    ID CHAR(20) NOT NULL,
    Colore CHAR (10) NOT NULL,
    Rischio INT NOT NULL,
    Accettato BOOLEAN NOT NULL,
    Rimborsabile BOOLEAN NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO CODICE_SANITARIO 
VALUES 
("Rosso-303", "Rosso", "3", "0", "0"),
("Giallo-201", "Giallo", "2", "0", "1"),
("Verde-110", "Verde", "1", "1", "0");


CREATE TABLE TIPO
(
    ID CHAR (20) NOT NULL,
    Nome CHAR (20) NOT NULL,
    Prezzo_ora FLOAT,
    PRIMARY KEY (ID)
);

CREATE TABLE LIDO
(
    ID CHAR(30) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    Descrizione VARCHAR(200),
    Capienza INT,
    Coordinate VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);




CREATE TABLE PERSONA
(
    Mail VARCHAR(100) NOT NULL,
    ID_Rischio CHAR(20) NOT NULL,
    ID_Ospite VARCHAR(50),
    Password VARCHAR (50) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    Data_Nascita DATE,
    Residenza VARCHAR(20),
    Tempo_Permanenza TIME,
    PRIMARY KEY (Mail),
    FOREIGN KEY (ID_Rischio) REFERENCES CODICE_SANITARIO(ID),
    FOREIGN KEY (ID_Ospite) REFERENCES PERSONA(Mail)
);

CREATE TABLE OMBRELLONE
(
    ID CHAR(10) NOT NULL,
    ID_Lido CHAR(30) NOT NULL,
    ID_Persona VARCHAR(50),
    ID_Tipo CHAR(20) NOT NULL,
    Numero_serie CHAR(10) NOT NULL,
    Coordinate VARCHAR(100),
    Capienza INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Lido) REFERENCES LIDO(ID),
    FOREIGN KEY (ID_Tipo) REFERENCES TIPO(ID),
    FOREIGN KEY (ID_Persona) REFERENCES PERSONA(Mail)
);

CREATE TABLE SDRAIO
(
    ID CHAR(10) NOT NULL,
    ID_Lido CHAR(30) NOT NULL,
    ID_Persona VARCHAR(50),
    ID_Tipo CHAR(20) NOT NULL,
    Numero_serie CHAR(10) NOT NULL,
    Coordinate VARCHAR(100),
    Colore CHAR(10),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Lido) REFERENCES LIDO(ID),
    FOREIGN KEY (ID_Tipo) REFERENCES TIPO(ID),
    FOREIGN KEY (ID_Persona) REFERENCES PERSONA(Mail)
);

CREATE TABLE POSTO_LIBERO
(
    ID CHAR(10) NOT NULL,
    ID_Lido CHAR(30) NOT NULL,
    ID_Persona VARCHAR(50),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Lido) REFERENCES LIDO(ID),
    FOREIGN KEY (ID_Persona) REFERENCES PERSONA(Mail)
);

