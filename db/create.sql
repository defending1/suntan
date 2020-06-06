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
)

CREATE TABLE PERSONA
(
    Mail VARCHAR(100) NOT NULL,
    ID_Rischio CHAR(20) NOT NULL,
    ID_Ospite VARCHAR(50),
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    Data_Nascita DATE,
    Residenza VARCHAR(20),
    Tempo_Permanenza TIME,
    PRIMARY KEY (Mail),
    FOREIGN KEY (ID_Rischio) REFERENCES CODICE_SANITARIO(ID),
    FOREIGN KEY (ID_Ospite) REFERENCES PERSONA(Mail)
)

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
    FOREIGN KEY (ID_Persona) REFERENCES Persona(Mail)
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
    FOREIGN KEY (ID_Persona) REFERENCES Persona(Mail)
);

CREATE TABLE POSTO_LIBERO
(
    ID CHAR(10) NOT NULL,
    ID_Lido CHAR(30) NOT NULL,
    ID_Persona VARCHAR(50),
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Lido) REFERENCES LIDO(ID),
    FOREIGN KEY (ID_Persona) REFERENCES Persona(Mail)
);



CREATE TABLE TIPO
(
    ID CHAR (20) NOT NULL,
    Nome CHAR (20) NOT NULL,
    Prezzo_ora FLOAT,
    PRIMARY KEY (ID)
)

INSERT INTO TIPO
VALUES
    (
        "1", "POSTO_LIBERO", "0"
),
    (
        "1", "OMBRELLONE_STANDARD", "10"
),
    (
        "1", "OMBRELLONE_PREMIUM", "20"
),
    (
        "1", "SDRAIO_PREMIUM", "20"
);

CREATE TABLE LIDO
(
    ID CHAR(30) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    Descrizione VARCHAR(200),
    Capienza INT,
    Coordinate VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID),
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