-- この部分はサンプルとして簡略化されています。
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    account_name VARCHAR(255) NOT NULL,
    industry VARCHAR(255),
    annual_revenue DECIMAL(15,2),
    number_of_employees INT,
    address TEXT
);

CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255)
);
