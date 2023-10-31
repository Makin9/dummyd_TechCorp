CREATE TABLE mobile_orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    order_quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pickup_store_id INT REFERENCES stores(store_id)
);

CREATE TABLE coupons (
    coupon_id SERIAL PRIMARY KEY,
    coupon_code CHAR(10) NOT NULL,
    discount_value DECIMAL(10,2),
    expiration_date DATE NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
