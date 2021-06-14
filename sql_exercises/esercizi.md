## Exercises of SQL (see pdf in this directory)

### DB

#### CREATION OF THE DB WITH COMMAND LINE

Commands used:
```sh
\sql # Executes SQL statement or switches to SQL processing mode when no statement is given.
\connect root@localhost:3306 # Connecting with db 

CREATE DATABASE IF NOT EXISTS museo;
show databases;
use museo;
\source C:\your_path\museo_tables.sql
show tables;
```

#### museo_tables.sql
```sh
CREATE TABLE IF NOT EXISTS Museo ( 
    Nome VARCHAR(50) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    Indirizzo VARCHAR(50) NOT NULL,
    NumeroTel INT NOT NULL,
    GiornoChiusura VARCHAR(50) NOT NULL, #TODO: enum here
    PrezzoAdulti FLOAT NOT NULL,
    PrezzoRidotto FLOAT NOT NULL,
    SitoInternet VARCHAR(50) NOT NULL,
    PRIMARY KEY (Nome, Citta)
);

CREATE TABLE IF NOT EXISTS Mostra (
    Titolo VARCHAR(50) NOT NULL,
    InizioEsposizione DATETIME NOT NULL,
    FineEsposizione DATETIME NOT NULL,
    PrezzoIntero FLOAT NOT NULL,
    PrezzoRidotto FLOAT NOT NULL,
    
    Museo VARCHAR(50) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    FOREIGN KEY (Museo, Citta) REFERENCES Museo(Nome, Citta),

    PRIMARY KEY(Titolo, InizioEsposizione, Museo, Citta)
);


CREATE TABLE IF NOT EXISTS Opera (
    Nome VARCHAR(50) NOT NULL,
    CognomeAutore VARCHAR(50) NOT NULL,
    NomeAutore VARCHAR(50) NOT NULL,
    Epoca VARCHAR(50) NOT NULL,
    Anno YEAR NOT NULL,

    Museo VARCHAR(50) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    FOREIGN KEY (Museo, Citta) REFERENCES Museo(Nome, Citta),
    
    PRIMARY KEY(Nome, CognomeAutore, NomeAutore, Museo, Citta)
);

CREATE TABLE IF NOT EXISTS Orario (
    Progressivo INT AUTO_INCREMENT NOT NULL,

    Giorno DATE NOT NULL,
    OrarioApertura TIME NOT NULL,
    OrarioChiusura TIME NOT NULL,

    Museo VARCHAR(50) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    FOREIGN KEY (Museo, Citta) REFERENCES Museo(Nome, Citta),
    
    PRIMARY KEY (Progressivo)
);

```

#### populating_database.sql
```sh
INSERT INTO 
Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Grezzana","Grezzana","Via Roma", 045908333, "Lunedì", 20.3, 19.2,"www.museogrezzana.com");

INSERT INTO 
Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Verona","Verona","Via Mazzini", 045922333, "Lunedì", 50.3, 39.2,"www.museoverona.com");

INSERT INTO 
Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Malcesine","Malcesine","Via Garibaldi", 045928333, "Martedì", 30.3, 20.2,"www.museomalcesine.com");

INSERT INTO 
Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Padova","Padova","Via Garibaldi", 045928333, "Martedì", 30.3, 20.2,"www.museopadova.com");
INSERT INTO 
Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Verona","Verona","Via Garibaldi", 045928333, "Martedì", 30.3, 20.2,"www.museoverona.com");
INSERT INTO 
Mostra 
(Titolo, InizioEsposizione, FineEsposizione, PrezzoIntero, PrezzoRidotto, Museo, Citta) 
VALUES 
("Mostra di pittura","2021-06-18T10:34:09","2021-06-18T20:34:09", 28.1, 30.2, "Museo di Grezzana", "Grezzana");

INSERT INTO 
Mostra 
(Titolo, InizioEsposizione, FineEsposizione, PrezzoIntero, PrezzoRidotto, Museo, Citta) 
VALUES 
("Mostra di statue","2021-07-18T10:34:09","2021-07-18T20:34:09", 28.1, 30.2, "Museo di Malcesine", "Malcesine");

#### Populating Opera
INSERT INTO 
Opera 
(Nome , CognomeAutore , NomeAutore , Epoca , Anno , Museo , Citta ) 
VALUES 
("Il barbiere di Siviglia","Rossini", "Gioacchino","1770", 2006, "Museo di Malcesine", "Malcesine");

INSERT INTO 
Opera 
(Nome , CognomeAutore , NomeAutore , Epoca , Anno , Museo , Citta ) 
VALUES 
("La gazza ladra","Rossini", "Gioacchino","1780", 2008, "Museo di Malcesine", "Malcesine");

INSERT INTO 
Opera 
(Nome , CognomeAutore , NomeAutore , Epoca , Anno , Museo , Citta ) 
VALUES 
("La gazza ladra","Rossini", "Gioacchino","1780", 2008, "Museo di Grezzana", "Grezzana");

INSERT INTO 
Opera 
(Nome , CognomeAutore , NomeAutore , Epoca , Anno , Museo , Citta ) 
VALUES 
("Il magnifico spettacolo","Mario", "Rossi","1990", 2000, "Museo di Grezzana", "Grezzana");

INSERT INTO 
Orario  
( Giorno , OrarioApertura , OrarioChiusura  , Museo , Citta ) 
VALUES 
("Sabato","08:00:00","18:00:00","Museo di Malcesine", "Malcesine");


INSERT INTO 
Orario  
( Giorno , OrarioApertura , OrarioChiusura  , Museo , Citta ) 
VALUES 
("Lunedì","09:00:00","19:00:00","Museo di Grezzana", "Grezzana");
```

#### Answer of the exercises
1. Visualizzare il nome la città e l'indirizzo di tutti i musei.  
SELECT Nome, Citta, Indirizzo FROM museo;

2. Visualizzare tutte le informazioni sulle mostre.  
SELECT * FROM Mostra;

3. Visualizzare il nome e le informazioni sull’autore (Nome, Cognome) di tutte le opere.  
SELECT DISTINCT NomeAutore, CognomeAutore FROM opera;

4. Visualizzare il contenuto della tabella Museo.  
SELECT * FROM museo;

5. Visualizzare il nome e il giorno di chiusura di tutti i musei di Verona.  
SELECT Nome, GiornoChiusura FROM Museo where Citta = "Verona";

6. Visualizzare il titolo e il prezzo di tutte le mostre presenti a Castel Vecchio.
SELECT Titolo, PrezzoIntero FROM Mostra WHERE Museo = "Castelvecchio"

7. Visualizzare il nome e l’indirizzo dei musei con Prezzo adulti inferiore a 12 euro. 
SELECT Nome, Indirizzo From Museo where PrezzoAdulti>12.0

8. Visualizzare il nome dei musei che si trovano a Verona, Venezia o Padova.  
SELECT Nome FROM museo WHERE citta="Verona" OR citta="Padova" OR citta = "Venezia";
oppure
SELECT Nome FROM museo WHERE citta="Verona" UNION
SELECT Nome FROM museo WHERE citta="Padova" UNION
SELECT Nome FROM museo WHERE citta="Venezia";

9. Visualizzare il nome dei musei di Verona con giorno di chiusura diverso da domenica.  
SELECT Nome FROM Museo WHERE NOT GiornoChiusura = "Domenica";

10. Visualizzare il nome dei musei con prezzo adulti tra 5 e 10 euro.  
SELECT Nome FROM Museo WHERE PrezzoAdulti BETWEEN 5 AND 10;

11. Visualizzare in ordine alfabetico il nome e la città di tutti i musei. 
SELECT Nome, Citta FROM Museo ORDER BY Nome ASC ;

12. Trovare il prezzo adulti massimo dei musei di Verona.  
SELECT MAX(PrezzoAdulti), Nome FROM Museo WHERE Citta="Verona";

13. Trovare il prezzo adulti medio dei musei di Verona o Venezia.  
SELECT AVG(PrezzoAdulti), Nome FROM Museo WHERE Citta="Verona" OR Citta = "Venezia";

14. Trovare il prezzo medio dei musei che non sono a Padova.  
SELECT AVG(PrezzoAdulti) FROM museo WHERE NOT Citta="Padova";

15. Contare tutte le opere presenti nella tabella Opera.  
SELECT COUNT(Nome) FROM opera;

16. Contare tutti i musei presenti a Verona.  
SELECT COUNT(Nome) FROM museo WHERE Citta = "Verona";

17. Visualizzare cognome e nome dei diversi autori presenti nella tabella Opera. 
SELECT DISTINCT NomeAutore, CognomeAutore FROM opera;

18. Contare le diverse città del Veneto dove sono presenti dei musei.
SELECT COUNT(*) FROM (SELECT DISTINCT Citta FROM museo);

19. Visualizzare le informazioni relative alle mostre presenti in ogni museo di Verona. 
SELECT COUNT(*) FROM (SELECT DISTINCT Citta FROM museo) as number;

20. Per ogni museo di Verona, visualizzare nome, indirizzo, numero di telefono e titolo delle esposizioni presenti. 
SELECT Mostra.Titolo, Museo.Nome, Museo.Indirizzo, Museo.NumeroTel  FROM (Museo INNER JOIN Mostra ON (Mostra.Museo = Museo.Nome AND Mostra.Citta = Museo.Citta));

21. Per ogni museo visualizzare nome, città, titolo delle esposizioni con biglietto d’ingresso inferiore a 5 euro.
SELECT Museo.Nome, Museo.Citta, Mostra.Titolo FROM (Museo INNER JOIN Mostra ON (Mostra.Museo  = Museo.Nome AND Mostra.Citta = Museo.Citta) ) WHERE Museo.PrezzoAdulti <10.0

22. Per ogni museo di Verona, visualizzare nome, giorno di chiusura e orario di apertura nel week-end.  
SELECT Museo.Nome, Museo.GiornoChiusura, Orario.OrarioApertura From 
(Museo INNER JOIN Orario On (Orario.Museo = Museo.Nome AND Orario.Citta = Museo.Citta))
WHERE Museo.Citta = "Verona" AND (Orario.Giorno = "Sabato" OR Orario.Giorno = "Domenica")

23. Visualizzare le opere presenti nei musei che non chiudono di domenica.  
SELECT Museo.Nome, Opera.Nome From 
(Museo 
INNER JOIN Orario ON (Orario.Museo = Museo.Nome AND Orario.Citta = Museo.Citta)
INNER JOIN Opera ON (Opera.Museo = Museo.Nome AND Opera.Citta = Museo.Citta)
)
WHERE (Orario.Giorno = "Sabato" OR Orario.Giorno = "Domenica")

24. Visualizzare il numero di mostre presenti nei musei di Verona o Venezia il 10/02/2020.

SELECT Mostra.Titolo, Mostra.InizioEsposizione, Mostra.FineEsposizione FROM (Museo INNER JOIN Mostra ON Museo.Nome = Mostra.Museo AND Museo.Citta = Mostra.Citta) WHERE (Museo.Citta = "Verona" OR Museo.citta = "Venezia")
AND Mostra.InizioEsposizione <= '2020/02/10'
AND Mostra.FineEsposizione >= '2020/02/10'

25. Visualizzare il nome e il numero di telefono dei musei di Venezia che hanno mostre con prezzo intero inferiore a 10 euro.  
SELECT Museo.Nome, Museo.NumeroTel FROM (Museo INNER JOIN Mostra ON Museo.Nome = Mostra.Museo AND Museo.Citta = Mostra.Citta) where PrezzoAdulti <= 10.0