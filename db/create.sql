create database beach;
use beach;



CREATE TABLE STATO_SALUTE
(
    ID CHAR NOT NULL,
    Colore CHAR (10) NOT NULL,
    Accettato BOOLEAN NOT NULL,
    Rimborso INT NOT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO STATO_SALUTE 
VALUES 
("R", "Rosso", "0", "70"),
("G", "Giallo", "0", "80"),
("V", "Verde", "1", "100");


CREATE TABLE STABILIMENTO_BALNEARE
(
    ID INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Descrizione VARCHAR(200),
    Capienza INT,
    Coordinate VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

INSERT INTO STABILIMENTO_BALNEARE 
VALUES 
(NULL, "Lido Blu", "Lorem ipsum", "1000", "[2000, 2000]"),
(NULL, "Lido Rosso", "Lorem ipsum", "1000", "[4242, 2000]"),
(NULL, "Lido 100", "Lorem ipsum", "1000", "[2000, 2423]"),
(NULL, "Baia Verde", "Lorem ipsum", "1334", "[2000, 1325]"),
(NULL, "Mykonos", "Lorem ipsum", "1000", "[6766, 2000]"),
(NULL, "P2", "Lorem ipsum", "1000", "[2000, 2342]"),
(NULL, "Cocco Lido", "Lorem ipsum", "3452", "[1324, 2000]"),
(NULL, "Lido Blu", "Lorem ipsum", "1000", "[2000, 2000]"),
(NULL, "Lido Blu", "Lorem ipsum", "2332", "[2000, 4646]"),
(NULL, "Lido Blu", "Lorem ipsum", "3455", "[2000, 1246]"),
(NULL, "Lido Blu", "Lorem ipsum", "2332", "[1463, 2000]");


CREATE TABLE CLIENTE
(
    ID INT NOT NULL AUTO_INCREMENT,
    ID_Salute CHAR,
    ID_Ospite INT,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    Mail VARCHAR (50) NOT NULL,
    Password VARCHAR (50) NOT NULL,
    Data_Nascita DATE NOT NULL,
    Residenza VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Salute) REFERENCES STATO_SALUTE(ID),
    FOREIGN KEY (ID_Ospite) REFERENCES CLIENTE(ID)
);

SELECT COUNT(I.ID) FROM ID_PERSONE_ROSSE I 
JOIN STABILIMENTO_PRENOTAZIONE_CLIENTE SPC 
    ON SPC.ID_Cliente = I.ID 
JOIN STABILIMENTO_BALNEARE S 
    ON S.ID = SPC.ID_Stabilimento
WHERE S.Nome = "Lido Blu"; 

INSERT INTO CLIENTE 
VALUES 
    (NULL, "R", NULL, "Alberto", "Veronesi", "mail.mail@mail.com", "qwerty", "1232-03-21", "Here"),
    (NULL,  "G", NULL, "Alberto", "Veronesi", "mail.mail@mail.com", "qwerty", "1232-03-21", "Here"),
    (NULL,  "V", NULL, "Alberto", "Veronesi", "mail.mail@mail.com", "qwerty", "1232-03-21", "Here");



CREATE TABLE STATO_PRENOTAZIONE(
    ID INT NOT NULL,
    Stato VARCHAR(10),
    PRIMARY KEY (ID)
);

INSERT INTO STATO_PRENOTAZIONE
VALUES ("1", "Attiva"), ("2", "Terminata");


CREATE TABLE PRENOTAZIONE(
    ID INT NOT NULL AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    ID_Stato INT NOT NULL,
    Inizio DATE NOT NULL,
    Fine DATE NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Stato) REFERENCES STATO_PRENOTAZIONE(ID),
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID)

);

INSERT INTO PRENOTAZIONE
VALUES (NULL, "2", "1", "2020-06-10", "2020-07-10"),
(NULL, "1", "1", "2020-06-10", "2020-07-10"),
(NULL, "3", "1", "2020-06-10", "2020-07-10");

CREATE TABLE PRENOTAZIONE_POSTO(
    ID_Prenotazione INT NOT NULL,
    ID_Posto INT NOT NULL,
    FOREIGN KEY (ID_Prenotazione) REFERENCES PRENOTAZIONE(ID),
    FOREIGN KEY (ID_Posto) REFERENCES POSTO(ID)
);

INSERT INTO PRENOTAZIONE_POSTO 
VALUES ("9", "3"), ("5", "4");

CREATE TABLE POSTO
(
    ID INT NOT NULL AUTO_INCREMENT,
    ID_Stabilimento INT NOT NULL,
    Nome CHAR(20) NOT NULL,
    Prezzo_Ora DOUBLE,
    Numero_serie CHAR(10),
    Colore CHAR(20),
    Capienza INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Stabilimento) REFERENCES STABILIMENTO_BALNEARE(ID)
);

INSERT INTO POSTO 
VALUES 
    (NULL, "1", "OMBRELLONE", "1", "csac-sa", NULL, "5"),
    (NULL, "1", "OMBRELLONE", "1", "sss-sa", NULL, "6"),
    (NULL, "1", "SDRAIO", "0.5", "csassc-sa", NULL, "5"),
    (NULL, "1", "SDRAIO", "0.5", "cc-sa", NULL, "5"),
    (NULL, "1", "POSTO_LIBERO", NULL, NULL, NULL, NULL),
    (NULL, "1", "POSTO_LIBERO", NULL, NULL, NULL, NULL),
    (NULL, "1", "POSTO_LIBERO", NULL, NULL, NULL, NULL)

