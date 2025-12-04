CREATE TABLE wallet (
    id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL ,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
    CONSTRAINT fk_wallet_customer
                    FOREIGN KEY (id_customer) REFERENCES customers(id)
) ENGINE InnoDB;

INSERT INTO wallet(id_customer) VALUES (1), (3);

SELECT * FROM wallet;

SELECT customers.email, wallet.balance
FROM wallet JOIN customers ON (wallet.id_customer = customers.id);