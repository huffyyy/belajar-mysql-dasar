use belajar_mysql;

CREATE TABLE guestbook
(
    id      INT NOT NULL AUTO_INCREMENT,
    email   VARCHAR(100),
    title   VARCHAR(200),
    content TEXT,
    PRIMARY KEY (id)
);

SELECT *
FROM customers;

INSERT INTO guestbook (email, title, content)
VALUES ('guest@gmail.com', 'Hello', 'Hello'),
       ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),
       ('husnul@gmail.com', 'Hello', 'Hello'),
       ('husnul@gmail.com', 'Hello', 'Hello'),
       ('husnul@gmail.com', 'Hello', 'Hello');

SELECT *
FROM guestbook;

SELECT DISTINCT email
FROM customers
UNION
SELECT DISTINCT email
FROM guestbook;

SELECT email
FROM customers
UNION ALL
SELECT email
FROM guestbook;

SELECT email, COUNT(email)
FROM (SELECT DISTINCT email
      FROM customers
      UNION ALL
      SELECT DISTINCT email
      FROM guestbook) as emails
GROUP BY email;

SELECT DISTINCT email FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbook);

SELECT DISTINCT customers.email FROM customers
INNER JOIN guestbook ON (guestbook.email = customers.email);

SELECT DISTINCT customers.email, guestbook.email FROM customers
LEFT JOIN guestbook ON (guestbook.email = customers.email)
WHERE guestbook.email IS NULL;
