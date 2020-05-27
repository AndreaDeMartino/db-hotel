--  1 Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?

SELECT ospiti.name, ospiti.lastname, COUNT(ospiti.id) as 'Tot_Prenotazioni'
FROM prenotazioni_has_ospiti
INNER JOIN ospiti on ospiti.id = prenotazioni_has_ospiti.ospite_id
GROUP BY ospite_id
HAVING  COUNT(ospite_id) > 2;

--  2 Stampare tutti gli ospiti per ogni prenotazione

SELECT ospiti.name, ospiti.lastname, prenotazioni_has_ospiti.prenotazione_id
FROM prenotazioni_has_ospiti
INNER JOIN ospiti on prenotazioni_has_ospiti.ospite_id = ospiti.id
ORDER BY prenotazioni_has_ospiti.prenotazione_id;

--  3 Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018

SELECT ospiti.name, ospiti.lastname, pagamenti.price, paganti.name as 'Nome_Pagante', prenotazioni.created_at as 'Data Prenotazione'
FROM ospiti
INNER JOIN paganti on ospiti.id = paganti.ospite_id
INNER JOIN pagamenti on pagamenti.pagante_id = paganti.id
INNER JOIN prenotazioni on prenotazioni.id = pagamenti.prenotazione_id
WHERE YEAR(prenotazioni.created_at) = '2018' and MONTH(prenotazioni.created_at) = '05';

--  4 Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano

SELECT SUM(pagamenti.price) as 'Somma_prenotazioni'
FROM pagamenti
INNER JOIN prenotazioni on prenotazioni.id = pagamenti.prenotazione_id
INNER JOIN stanze on stanze.id = prenotazioni.stanza_id
where stanze.floor = 1;

-- 5 Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)
SELECT stanze.id as 'ID_STANZA',stanze.room_number,prenotazioni.id as 'ID_PRENOTAZIONE'
FROM stanze
LEFT JOIN prenotazioni on prenotazioni.stanza_id = stanze.id
WHERE prenotazioni.id IS NULL;

-- ************ BONUS ************
-- Conta gli ospiti raggruppandoli per anno di nascita
SELECT YEAR(date_of_birth) as 'Anno',count(id) as 'Ospiti'
FROM ospiti
GROUP BY YEAR(date_of_birth);

-- Somma i prezzi dei pagamenti raggruppandoli per status
SELECT status,SUM(price) as 'Prezzo_Tot'
FROM pagamenti
GROUP BY status;

-- Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni?
SELECT ospite_id,COUNT(prenotazione_id)
FROM prenotazioni_has_ospiti
GROUP BY ospite_id
ORDER BY 2 DESC
LIMIT 1
