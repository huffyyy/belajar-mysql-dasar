START TRANSACTION;

SELECT *
FROM guestbook;

UPDATE guestbook
SET title = 'Diubah Oleh User2'
WHERE id = 9;

COMMIT;

START TRANSACTION;

SELECT *
FROM products;

SELECT *
FROM products
WHERE id = 'P001' FOR
UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P001';

COMMIT;

SELECT *
FROM products
WHERE id = 'P001';

#DEADLOCK

START TRANSACTION;

SELECT *
FROM products
WHERE id = 'P002' FOR
UPDATE;

SELECT *
FROM products
WHERE id = 'P001' FOR
UPDATE;

#LOCK TABLE READ

SELECT * FROM products;

UPDATE products
SET quantity = 100

#LOCK TABLE WRITE

SELECT * FROM products;

#LOCK INSTANCE

ALTER TABLE products
ADD COLUMN sample VARCHAR(100);