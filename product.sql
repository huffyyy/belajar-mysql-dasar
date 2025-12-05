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
VALUES ('X001', 'X Satu', 10000, 100),
       ('X002', 'X Dua', 10000, 100),
       ('X003', 'X Tiga', 10000, 100),
       ('X004', 'X Tiga', 10000, 100);

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
SET price = 1000000
WHERE id = 'X001';

UPDATE products
SET description = 'Kerupuk Gurih'
WHERE id = 'P0010';

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

SELECT *
FROM products
WHERE category NOT IN ('Makanan', 'Minuman');

INSERT INTO products (id, name, description, price, quantity)
VALUES ('P0016', 'IPAD GEN 9TH',
        'IPAD TERMURAH KATA GADGETIN',
        3000000, 1);

DELETE
FROM products
WHERE name = 'IPAD GEN 9TH';

SELECT *
FROM products
ORDER BY id desc;

SELECT *
FROM products;

SELECT *
FROM products
ORDER BY id
LIMIT 5;

SELECT *
FROM products
WHERE price > 0
ORDER BY id
LIMIT 5, 5;

SELECT DISTINCT category
FROM products;

SELECT 10 + 10 AS hasil;

SELECT id, price DIV 1000 AS 'Price in K'
FROM products;

SELECT 17 % 5 AS hasil;

SELECT created_at, CASE WHEN created_at % 2 = 0 THEN 'Genap' ELSE 'Ganjil' END AS 'Jenis Bliangan'
FROM products;

SELECT id,
       CONCAT(price DIV 1000, 'K') AS 'Price In K',
       CASE
           WHEN (price DIV 1000) % 2 = 0 THEN 'Genap'
           ELSE 'Ganjil'
           END                     AS 'jenis_bilangan'
FROM products;

SELECT products.id, SIN(products.price), COS(products.price), TAN(products.price)
FROM products;

SELECT id, name, price
FROM products
WHERE price DIV 1000 > 15;

SELECT id, LOWER(name) AS 'name_lower'
FROM products;

SELECT id, name, LENGTH(name) AS 'name_length'
FROM products;

SELECT id,
       EXTRACT(YEAR FROM created_at)  AS 'year',
       EXTRACT(MONTH FROM created_at) AS 'month'
FROM products;

SELECT id, YEAR(created_at), MONTH(created_at)
FROM products;

SELECT id,
       CASE category
           WHEN 'makanan' THEN 'enak'
           WHEN 'minuman' THEN 'segar'
           ELSE 'Apa itu'
           END AS 'category'
FROM products;

SELECT id,
       price,
       IF(price <= 15000, 'Murah',
          IF(price <= 20000, 'Mahal', 'Mahal banget')
       ) AS 'mahal?'
FROM products;

SELECT id, name, IFNULL(description, 'kosong')
FROM products;

SELECT COUNT(id) AS 'total_products'
FROM products;

SELECT MAX(price) AS 'harga_termahal'
FROM products;

SELECT MIN(price) AS 'harga_termurah'
FROM products;

SELECT AVG(price) AS 'harga_rata_rata'
FROM products;

SELECT ROUND(AVG(price), 2) AS 'harga_rata_rata'
FROM products;

SELECT ROUND(AVG(price)) AS 'harga_rata_rata'
FROM products;

SELECT COUNT(id) AS 'total_products'
FROM products
GROUP BY category;

SELECT category,
       COUNT(id) AS 'total'
FROM products
GROUP BY category
HAVING total > 1;

SELECT category, SUM(price) AS 'total_price'
FROM products
GROUP BY category
HAVING total_price > 10000;

ALTER TABLE products
    ADD CONSTRAINT price_check CHECK ( price >= 500 AND price <= 50000);

ALTER TABLE products
    DROP CONSTRAINT price_check;

SHOW CREATE TABLE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P016', 'Permen', 500, 100);

UPDATE products
SET price = 1000000
WHERE id = 'P016';

ALTER TABLE products
    ADD FULLTEXT product_search (name, description);

SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('ayam' IN NATURAL LANGUAGE MODE);

SELECT *
FROM products
WHERE MATCH(name, description) AGAINST('+mie -ceker' IN BOOLEAN MODE);

SELECT *
FROM products
WHERE MATCH(name, description) AGAINST('bakso' WITH QUERY EXPANSION);

INSERT INTO products(id, name, price, quantity)
VALUES ('Pxxxx', 'contoh', 30000, 100);

ALTER TABLE products
    DROP COLUMN category,
    ADD COLUMN id_category VARCHAR(100),
    ADD CONSTRAINT fk_product_category
        FOREIGN KEY (id_category) REFERENCES categories (id);

ALTER TABLE products
    DROP CONSTRAINT fk_product_category;

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SElECT MAX(price)
FROM (SELECT price
      FROM categories
               INNER JOIN products ON (products.id_category = categories.id)) AS cp;