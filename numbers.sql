CREATE TABLE numbers
(
    id INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO numbers(id)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

SELECT number1.id, number2.id, (number1.id * number2.id) AS result
FROM numbers as number1
         CROSS JOIN numbers AS number2
ORDER BY number1.id, number2.id;