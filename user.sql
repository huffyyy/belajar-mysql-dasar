CREATE USER 'husnul'@'localhost';
CREATE USER 'fikri'@'%';

DROP USER 'husnul'@'localhost';
DROP USER 'fikri'@'%';

GRANT SELECT ON belajar_mysql.* TO 'husnul'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'fikri'@'%';

SHOW GRANTS FOR 'husnul'@'localhost';
SHOW GRANTS FOR 'fikri'@'%';

REVOKE SELECT ON belajar_mysql.* FROM 'husnul'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* FROM 'fikri'@'%';

SET PASSWORD FOR 'husnul'@'localhost' = 'rahasia';
SET PASSWORD FOR 'fikri'@'%' = 'rahasia';

INSERT INTO guestbook(email, title, content)
VALUES ('contoh@gmail.com', 'contoh', 'contoh');

CREATE TABLE contoh (
    id INT NOT NULL,
    PRIMARY KEY (id)
);