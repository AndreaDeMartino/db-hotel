/*
Seleziona tutti gli ospiti che sono stati identificati con la carta di identità
*/

SELECT `name`,`lastname`
FROM ospiti
WHERE `document_type` = 'CI';

/*
Seleziona tutti gli ospiti che sono nati dopo il 1988
*/

SELECT `name`,`lastname`
FROM ospiti
WHERE `date_of_birth` > '1988';

/*
Seleziona tutti gli ospiti che hanno più di 20 anni (al momento dell’esecuzione della query)
*/

SELECT `name`,`lastname`,`date_of_birth`
FROM ospiti
WHERE `date_of_birth` < '2000-05-26';


/*
Seleziona tutti gli ospiti il cui nome inizia con la D
*/

SELECT `name`,`lastname`
FROM ospiti
WHERE `name` like 'D%';

/*
Calcola il totale degli ordini accepted
*/

SELECT COUNT(`id`) AS 'Ordini Accettati'
FROM pagamenti
WHERE `status` = 'accepted';


/*
Qual è il prezzo massimo pagato?
*/

SELECT MAX(`price`) as 'Prezzo massimo'
FROM pagamenti;

SELECT `price` AS 'Prezzo massimo'
FROM pagamenti
ORDER BY `price` desc
LIMIT 1;


/*
Seleziona gli ospiti riconosciuti con patente e nati nel 1975
*/

SELECT `name`,`lastname`,`date_of_birth`,`document_type`
FROM ospiti
WHERE `document_type` = 'Driver License' and `date_of_birth` like '1975%';


/*
Quanti posti letto ha l’hotel in totale?
*/

SELECT SUM(`beds`) as 'Totale posti Letto'
from stanze