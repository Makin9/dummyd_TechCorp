-- モバイルオーダーの注文情報テーブル
CREATE TABLE mobile_orders_info (
    order_id INT REFERENCES mobile_orders(order_id),
    product_id INT REFERENCES products(product_id),
    order_quantity INT NOT NULL
);

-- モバイルオーダーで利用可能なクーポン情報テーブル
CREATE TABLE mobile_orders_coupons (
    coupon_id INT PRIMARY KEY,
    coupon_code VARCHAR(255) NOT NULL,
    discount_value DECIMAL(10, 2) NOT NULL,
    expiration_date DATE NOT NULL,
    creation_date TIMESTAMP NOT NULL,
    used_status BOOLEAN NOT NULL DEFAULT FALSE
);

-- モバイルオーダーの注文情報テーブル
CREATE TABLE mobile_orders (
    order_id INT PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    coupon_id INT NULL,
    order_date TIMESTAMP NOT NULL,
    pickup_store_id INT REFERENCES stores(store_id),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (coupon_id) REFERENCES mobile_orders_coupons(coupon_id)
);
