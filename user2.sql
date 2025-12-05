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