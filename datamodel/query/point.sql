CREATE TABLE point_cards (
    card_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    total_points INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    points_expire_date TIMESTAMP
);

CREATE TABLE point_history (
    history_id SERIAL PRIMARY KEY,
    card_id INT REFERENCES point_cards(card_id),
    point_change INT NOT NULL,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transaction_id INT
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    order_id INT
    order_type TEXT CHECK (my_column IN ('ec_order', 'mobile_order'))
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
