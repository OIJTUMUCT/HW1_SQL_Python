-- Создание таблицы клиентов (отношение 1:1 с финансовой ситуацией)
CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(55),
    last_name VARCHAR(55),
    gender VARCHAR(10),
    DOB DATE
);

-- Создание таблицы финансовой ситуации клиента
CREATE TABLE IF NOT EXISTS financial_situation (
    customer_id INT PRIMARY KEY REFERENCES customer(customer_id) ON DELETE CASCADE,
    job_title VARCHAR(100),
    job_industry_category VARCHAR(100),
    wealth_segment VARCHAR(50),
    deceased_indicator BOOLEAN,
    owns_car BOOLEAN,
    property_valuation DECIMAL
);

-- Создание таблицы адресов (отношение: один клиент - много адресов)
CREATE TABLE IF NOT EXISTS address (
    address_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id) ON DELETE CASCADE,
    address VARCHAR(255),
    postcode INT,
    state VARCHAR(50),
    country VARCHAR(50)
);

-- Создание таблицы продуктов
CREATE TABLE IF NOT EXISTS product (
    product_id SERIAL PRIMARY KEY,
    brand VARCHAR(50),
    product_line VARCHAR(20),
    product_class VARCHAR(10),
    product_size VARCHAR(10),
    standard_cost DECIMAL
);

-- Создание таблицы транзакций
CREATE TABLE IF NOT EXISTS transaction (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id) ON DELETE CASCADE,
    transaction_date TIMESTAMP,
    online_order BOOLEAN,
    order_status VARCHAR(15),
    list_price DECIMAL,
    product_id INT REFERENCES product(product_id) ON DELETE CASCADE
);