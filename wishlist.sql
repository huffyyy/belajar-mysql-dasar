USE belajar_mysql;

CREATE TABLE wishlist
(
    id          INT         NOT NULL AUTO_INCREMENT,
    id_product  VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product
        FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;

DESCRIBE wishlist;

DROP TABLE wishlist;

ALTER TABLE wishlist
    DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_product
        FOREIGN KEY (id_product) REFERENCES products (id)
            ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO wishlist (id_product, description)
VALUES ('P001', 'Makanana favorit');

INSERT INTO wishlist (id_product, description)
VALUES ('Salah', 'Makanana favorit');

DELETE
FROM products
WHERE id = 'Pxxxx';

SELECT *
FROM wishlist
         JOIN products ON (wishlist.id_product = products.id);

SELECT w.id, p.id, p.name, w.description
FROM wishlist AS w
         JOIN products AS p ON (p.id = w.id_product);

SELECT w.id          AS id_wishlist,
       p.id          AS id_product,
       p.name        AS product_name,
       w.description AS wishlist_decsription
FROM wishlist AS w
         JOIN products AS p ON (w.id_product = p.id);

ALTER TABLE wishlist
    ADD COLUMN id_customer INT;

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_customer
        FOREIGN KEY (id_customer) REFERENCES customers (id);

UPDATE wishlist
SET wishlist.id_customer = 1
WHERE id = 1;

SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist
         JOIN products ON (products.id = wishlist.id_product)
         JOIN customers ON (customers.id = wishlist.id_customer);

SELECT c.email       AS wishlist_email,
       p.id          AS id_product,
       p.name        AS product_name,
       w.description AS wishlist_description
FROM wishlist as w
         JOIN products AS p ON (p.id = w.id_product)
         JOIN customers AS c ON (c.id = w.id_customer);

