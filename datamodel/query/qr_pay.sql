CREATE TABLE qr_payments (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    store_id INT REFERENCES stores(store_id)
);
