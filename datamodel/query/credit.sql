CREATE TABLE credit_cards (
    card_number CHAR(16) PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    expiration_date DATE NOT NULL,
    card_type VARCHAR(255)
);

CREATE TABLE card_transactions (
    transaction_id SERIAL PRIMARY KEY,
    card_number CHAR(16) REFERENCES credit_cards(card_number),
    transaction_amount INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    store_id INT REFERENCES stores(store_id)
);

CREATE TABLE billing (
    billing_id SERIAL PRIMARY KEY,
    card_number CHAR(16) REFERENCES credit_cards(card_number),
    billing_date DATE NOT NULL
);
