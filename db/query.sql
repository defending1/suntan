-- Tutte le persone con codice rosso
SELECT COUNT(Mail)
FROM PERSONA P
    JOIN CODICE_SANITARIO C
    ON P.ID_Rischio = C.ID
WHERE C.Colore = "Rosso";

-- Tutti gli ombrelloni liberi
SELECT *
FROM OMBRELLONE O
    JOIN LIDO L
    ON O.ID_Spiaggia = L.ID
WHERE O.ID_Persona IS NULL AND L.Nome = "Blu"


-- Tutti i lidi 
SELECT Nome, Descrizione
FROM Lido;