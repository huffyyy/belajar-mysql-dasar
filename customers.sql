USE belajar_mysql;

CREATE TABLE customers
(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    primary key (id),
    UNIQUE KEY email_unique (email)
);

ALTER TABLE customers
    ADD CONSTRAINT email_unique UNIQUE (email);

ALTER TABLE customers
    DROP CONSTRAINT email_unique;

DESCRIBE customers;

SELECT * FROM customers;

INSERT INTO customers(email, first_name, last_name)
VALUES ('husnul@gmail.com', 'Husnul', 'FIkri')

INSERT INTO customers(email, first_name, last_name)
VALUES ('Fikri@gmail.com', 'Fikri', 'Husnul')