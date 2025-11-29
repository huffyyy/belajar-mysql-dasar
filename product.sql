SHOW TABLES;

USE belajar_mysql;

CREATE TABLE barang
(
    id     INT,
    nama   VARCHAR(100),
    harga  INT,
    jumlah INT
) ENGINE = INNODB;

DESCRIBE barang;

SHOW CREATE TABLE barang;

ALTER TABLE barang
    ADD COLUMN deskripsi TEXT,
    RENAME COLUMN nama TO nama_baru,
    MODIFY ID VARCHAR(50) FIRST,
    MODIFY jumlah INT after harga;

ALTER TABLE barang
    ADD COLUMN salah TEXT;

ALTER TABLE barang
    DROP COLUMN salah;

ALTER TABLE barang
    MODIFY COLUMN nama_baru VARCHAR(200) AFTER deskripsi;

ALTER TABLE barang
    MODIFY COLUMN id INT NOT NULL;

ALTER TABLE barang
    MODIFY COLUMN nama VARCHAR(200) NOT NULL;

ALTER TABLE barang
    MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang
    MODIFY HARGA INT NOT NULL DEFAULT 0;

ALTER TABLE BARANG
    ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

INSERT INTO barang (id, nama)
VALUES (1, 'Apel');

SELECT *
FROM barang;

TRUNCATE barang;

DROP TABLE barang;

CREATE TABLE products
(
    id          VARCHAR(10)  NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL,
    quantity    INT UNSIGNED NOT NULL,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products(id, name, price, quantity)
VALUES ('P001', 'Mie Ayam', 15000, 100);

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100);

INSERT INTO products(id, name, price, quantity)
VALUES ('P005', 'Mie Ayam Yamin', 30000, 100);


SELECT id,
       name,
       price,
       quantity
FROM products;

ALTER TABLE products
    ADD PRIMARY KEY (id);

DELETE
FROM products
WHERE id IN ('P003', 'P004', 'P005');

SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM products
WHERE quantity = 0;

SELECT *
FROM products
WHERE price = 20000;

SELECT *
FROM products
WHERE id = 'P003';

SELECT *
FROM products
WHERE name = 'Mie Ayam Ceker';

ALTER TABLE products
    ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-lain')
        AFTER name;

UPDATE products
SET category = 'Makanan'
WHERE id IN ('P002', 'P004', 'P005');

UPDATE products
SET category = 'Makanan'
WHERE id = 'P001';


UPDATE products
SET description = 'Mie Ayam Original Yamin'
WHERE id = 'P005';

UPDATE products
SET price = price + 5000
WHERE id = 'P004';


DELETE
FROM products
WHERE id = 'P005';

SELECT id       AS 'Kode',
       name     AS 'Nama',
       category AS 'Kategori',
       price    AS 'Harga',
       quantity AS 'Stok'
FROM products;

SELECT p.id       AS 'Kode',
       p.name     AS 'Nama',
       p.category AS 'Kategori',
       p.price    AS 'Harga',
       p.quantity AS 'Stok'
FROM products AS p;

INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
       ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
       ('P0008', 'Minuman', 'Es Campur', 15000, 500),
       ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
       ('P0010', 'Lain-Lain', 'Kerupuk', 2500, 1000),
       ('P0011', 'Lain-Lain', 'Keripik Udang', 10000, 300),
       ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
       ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
       ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
       ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);

SELECT *
FROM products
WHERE quantity > 100;

SELECT *
FROM products
WHERE quantity >= 100;

SELECT *
FROM products
WHERE category != 'Makanan';


SELECT *
FROM products
WHERE category <> 'Minuman';


SELECT *
FROM products
WHERE quantity > 100
  AND price > 20000;

SELECT *
FROM products
WHERE products.category = 'Minuman'
  AND price < 20000;

SELECT *
FROM products
WHERE quantity > 100
   OR price > 20000;

SELECT *
FROM products
WHERE category = 'Makanan'
   OR quantity > 500 AND price > 20000;

SELECT *
FROM products
WHERE (category = 'Makanan' OR quantity > 500)
  AND price > 20000;

SELECT *
FROM products
WHERE name LIKE '%Mie%';

SELECT *
FROM products
WHERE name LIKE '%Bakso%';

SELECT *
FROM products
WHERE description IS NULL;

SELECT *
FROM products
WHERE description IS NOT NULL;

SELECT *
FROM products
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE price NOT BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE category IN ('Makanan', 'Minuman');

SELECT * FROM products
WHERE category NOT IN ('Makanan', 'Minuman');
