CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(255),
    image_url TEXT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shipping_fee DECIMAL(10,2)
);

CREATE TABLE order_details (
    orderd_id SERIAL PRIMARY KEY, 
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    user_id INT REFERENCES users(user_id),
    review_content TEXT,
    stars INT CHECK (stars BETWEEN 1 AND 5),
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE carts (
    cart_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL
);

CREATE TABLE product_views (
    view_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    view_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    recommended_product_id INT REFERENCES products(product_id)
);

CREATE TABLE campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE user_behaviors (
    behavior_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    behavior_type VARCHAR(255) NOT NULL, -- 例: 'click', 'like', 'wishlist_add', 'cart_add'
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- GAを参照してデータを保存する
CREATE TABLE ga_sessions (
    session_id VARCHAR(255) PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    session_start TIMESTAMP NOT NULL,
    session_end TIMESTAMP NOT NULL,
    source VARCHAR(255),
    medium VARCHAR(255),
    device_category VARCHAR(50)
);

-- GAを参照してデータを保存する
CREATE TABLE ga_pageviews (
    view_id SERIAL PRIMARY KEY,
    session_id VARCHAR(255) REFERENCES ga_sessions(session_id),
    page_path TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    product_id INT REFERENCES products(product_id)
);
