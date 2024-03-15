CREATE TABLE sales (
	sales_id SERIAL PRIMARY KEY,
	sale_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE repairs (
	repair_id SERIAL PRIMARY KEY,
	repair_type VARCHAR
);

CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	sales_id INTEGER,
	repair_id INTEGER,
	FOREIGN KEY (sales_id) REFERENCES sales(sales_id),
	FOREIGN KEY (repair_id) REFERENCES repairs(repair_id)
);

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR
);

CREATE TABLE inventory (
	inventory_id SERIAL PRIMARY KEY,
	new_cars INTEGER,
	used_cars INTEGER
);

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	amount NUMERIC(8,2),
	i_timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	employee_id INTEGER,
	inventory_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);