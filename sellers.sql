USE belajar_mysql;

DESCRIBE sellers;

SHOW CREATE TABLE sellers;

CREATE TABLE sellers
(
    id    INT NOT NULL AUTO_INCREMENT,
    name  VARCHAR(100),
    name2 VARCHAR(100),
    name3 VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name),
    INDEX name2_index (name2),
    INDEX name3_index (name3),
    INDEX name1_name2_name3_index (name, name2, name3)
) ENGINE = InnoDB;

ALTER TABLE sellers
    ADD INDEX name_index (name);

ALTER TABLE sellers
    DROP INDEX name_index;

DROP TABLE sellers;

SELECT *
FROM sellers
WHERE name = 'x';

SELECT *
FROM sellers
WHERE name = 'x'
  AND name2 = 'x';

SELECT *
FROM sellers
WHERE name = 'x'
  AND name2 = 'x'
  AND name3 = 'x';