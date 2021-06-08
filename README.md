## STUDY OF JAVA SERVER

### DB

#### CREATION OF THE DB WITH COMMAND LINE

Commands used:
```sh
\sql # Executes SQL statement or switches to SQL processing mode when no statement is given.
\connect root@localhost:3306 # Connecting with db 

CREATE DATABASE IF NOT EXISTS nations;
show databases;
use nations;
\source C:\your_path\nation_tables.sql
show tables;
```

#### nation_tables.sql
```sh

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

```

#### populating_database.sql
```sh
INSERT INTO nation (iso_code, name, capital, population) VALUES ("ITA","Italy","Rome", 60360000);
INSERT INTO continent (name) VALUES ("Europe");
INSERT INTO products (country_id, name) VALUES ("ITA","Pizza");
```

## Spring boot

-Create a project following screenshots saved in /spring boot project  

-add in src/main/resources/application.properties file   
```sh
spring.datasource.url=jdbc:mysql://localhost:3306/nations
spring.datasource.username=root
spring.datasource.password=yourpassword
```