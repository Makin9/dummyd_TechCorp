CREATE TABLE point_cards (
    card_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    total_points INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE point_history (
    history_id SERIAL PRIMARY KEY,
    card_id INT REFERENCES point_cards(card_id),
    point_change INT NOT NULL,
    change_type TEXT CHECK (change_type IN ('use', 'save')),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_id INT
    order_type TEXT CHECK (order_type IN ('ec_order', 'mobile_order', 'qr_order'))
);