DROP TABLE tags CASCADE;
DROP TABLE merchants CASCADE;
DROP TABLE transactions CASCADE;

CREATE TABLE tags(
id SERIAL8 primary key,
tag_name VARCHAR(255)
);

CREATE TABLE merchants(
id SERIAL8 primary key,
merchant_name VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL8 primary key,
tag_id INT4 references tags(id),
merchant_id INT4 references merchants(id),
transaction_amount REAL,
item_description TEXT,
transaction_date DATE
);