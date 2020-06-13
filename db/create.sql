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

INSERT INTO LIDO 
VALUES 
("LidoB1000[2000, 2000]", "Lido Blu", "Lorem ipsum", "1000", "[2000, 2000]"),
("LidoR1000[4242, 2000]", "Lido Rosso", "Lorem ipsum", "1000", "[4242, 2000]"),
("Lido 100", "Lido 100", "Lorem ipsum", "1000", "[2000, 2423]"),
("Baia Verde", "Baia Verde", "Lorem ipsum", "1334", "[2000, 1325]"),
("Mykonos", "Mykonos", "Lorem ipsum", "1000", "[6766, 2000]"),
("P2", "P2", "Lorem ipsum", "1000", "[2000, 2342]"),
("CoccoLido", "Cocco Lido", "Lorem ipsum", "3452", "[1324, 2000]"),
("LidoBlu1000", "Lido Blu", "Lorem ipsum", "1000", "[2000, 2000]"),
("LidoBlu2332", "Lido Blu", "Lorem ipsum", "2332", "[2000, 4646]"),
("LidoBlu3455", "Lido Blu", "Lorem ipsum", "3455", "[2000, 1246]"),
("LidoBlu2332", "Lido Blu", "Lorem ipsum", "2332", "[1463, 2000]");


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



INSERT INTO TIPO
VALUES
    (
        "POSTO_LIBERO0", "POSTO_LIBERO", "0"
),
    (
        "OMBRELLONE_STANDARD10", "OMBRELLONE_STANDARD", "10"
),
    (
        "OMBRELLONE_PREMIUM20", "OMBRELLONE_PREMIUM", "20"
),
    (
        "SDRAIO_PREMIUM20", "SDRAIO_PREMIUM", "20"
);




INSERT INTO OMBRELLONE
VALUES
    (
        "xxx1-1-1-4",
        "mario.rossi@mail.it",
        "",
        "",
        "1",
        "1",
        "4"
);