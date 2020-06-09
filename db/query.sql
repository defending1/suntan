-- Tutte le persone con codice rosso
SELECT COUNT(Mail)
FROM PERSONA P
    JOIN CODICE_SANITARIO C
    ON P.ID_Rischio = C.ID
WHERE C.Colore = "Rosso";

-- Tutti gli oggetti liberi in un lido
SELECT *
FROM LIDO L
    JOIN OMBRELLONE O
    ON L.ID = O.ID_Lido 
    JOIN POSTO_LIBERO P
    ON L.ID = P.ID_Lido 
    JOIN SDRAIO S
    ON L.ID = S.ID_Lido 
WHERE L.Nome = "Blu"


-- Tutti i lidi 
SELECT Nome, Descrizione
FROM Lido;