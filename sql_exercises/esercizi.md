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
    
    PRIMARY KEY(Nome, CognomeAutore, NomeAutore)
);

CREATE TABLE IF NOT EXISTS Orario (
    Progressivo INT AUTO_INCREMENT NOT NULL,

    Giorno DATE NOT NULL,
    OrarioApertura TIME NOT NULL,
    OrarioChiusura TIME NOT NULL,

    Museo VARCHAR(50) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    FOREIGN KEY (Museo, Citta) REFERENCES Museo(Nome, Citta),
    
    PRIMARY KEY (Progressivo),
);

```

#### populating_database.sql
```sh
INSERT INTO 
museo.Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Grezzana","Grezzana","Via Roma", 045908333, "Lunedì", 20.3, 19.2,"www.museogrezzana.com");

INSERT INTO 
museo.Museo 
(Nome, Citta, Indirizzo, NumeroTel, GiornoChiusura, PrezzoAdulti, PrezzoRidotto, SitoInternet) 
VALUES 
("Museo di Malcesine","Malcesine","Via Garibaldi", 045928333, "Martedì", 30.3, 20.2,"www.museomalcesine.com");

INSERT INTO 
museo.Mostra 
(Titolo, InizioEsposizione, FineEsposizione, PrezzoIntero, PrezzoRidotto, Museo, Citta) 
VALUES 
("Mostra di pittura","2021-06-18T10:34:09","2021-06-18T20:34:09", 28.1, 30.2, "Museo di Grezzana", "Grezzana");

INSERT INTO 
museo.Mostra 
(Titolo, InizioEsposizione, FineEsposizione, PrezzoIntero, PrezzoRidotto, Museo, Citta) 
VALUES 
("Mostra di statue","2021-07-18T10:34:09","2021-07-18T20:34:09", 28.1, 30.2, "Museo di Malcesine", "Malcesine");
```

#### Answer of the exercises
Visualizzare il nome la città e l'indirizzo di tutti i musei
1. SELECT Nome, Citta, Indirizzo FROM museo;
Visualizzare tutte le informazioni sulle mostre;