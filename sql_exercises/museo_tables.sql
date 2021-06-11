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