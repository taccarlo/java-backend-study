CREATE TABLE nation ( 
    iso_code VARCHAR(3) NOT NULL,
    name VARCHAR(50) NOT NULL,
    capital VARCHAR(50) NOT NULL,
    population INT,
    PRIMARY KEY (iso_code)
);

CREATE TABLE continent (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT NOT NULL,
    country_id VARCHAR(3) NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES nation(iso_code)
);