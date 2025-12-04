use belajar_mysql;

CREATE TABLE categories
(
    id   VARCHAR(10) NOT NULL,
    name VARCHAR(10) NOT NULL,
) ENGINE = InnoDB;

DESCRIBE categories;

SELECT *
FROM products;

INSERT INTO categories (id, name)
VALUES ('C001', 'Makanan'),
       ('C002', 'Minuman'),
       ('C003', 'Lain-Lain');

UPDATE products
SET id_category = 'C001'
WHERE id IN ('P001', 'P002', 'P003', 'P004', 'P004', 'P005', 'P006', 'P013', 'P014', 'P015');

UPDATE products
SET id_category = 'C002'
WHERE id IN ('P007', 'P008', 'P009');

UPDATE products
SET id_category = 'C003'
WHERE id IN ('P010', 'P011', 'P012', 'P016 ');

SELECT products.id, products.name, categories.name
FROM products
         JOIN categories ON (categories.id = products.id_category)