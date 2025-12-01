CREATE TABLE admin
(
    id         INT          NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESCRIBE admin;

INSERT INTO admin (first_name, last_name)
VALUES ('Husnul', 'Fikri');
INSERT INTO admin (first_name, last_name)
VALUES ('Rasasi', 'Hawas');
INSERT INTO admin (first_name, last_name)
VALUES ('Adidas', 'Spezial');

INSERT INTO admin (first_name, last_name)
VALUES ('Hot', 'Wheels');

DELETE
FROM admin
WHERE id = 4;

SELECT *
FROM admin;

