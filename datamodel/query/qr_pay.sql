CREATE TABLE qr_payment_stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    can_qr_payment BOOLEAN,
    can_mobile_order BOOLEAN
);


CREATE TABLE qr_payments (
    payment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    store_id INT REFERENCES stores(store_id)
);
