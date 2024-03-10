/*
--For Recreation
DROP TABLE customer_accounts;
DROP TABLE customer_interactions;
DROP TABLE customer_licenses;
DROP TABLE customer_accounts_new CASCADE;
DROP TABLE customer_pricing_plans;
DROP TABLE customer_interactions_new CASCADE;
DROP TABLE service_representatives;
DROP TABLE customer_licenses_new CASCADE;
--*/

CREATE TABLE IF NOT EXISTS customer_accounts (
	account_id NUMERIC PRIMARY KEY,
	email VARCHAR(50),
	current_tier VARCHAR(50),
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);

INSERT INTO customer_accounts (account_id, email, current_tier, created_at, updated_at)
VALUES
	('1', 'abc@123.com', 'Free', '2019-05-01 21:13:05.156042+00', '2019-05-01 21:13:11.804514+00'),
	('2', '123@abc.com', 'Medium', '2019-07-12 16:05:02.414454+00', '2020-01-04 17:23:05.594305+00'),
	('3', 'hello@world.com', 'Enterprise', '2019-07-23 12:26:47.571431+00', '2019-09-17 04:32:32.493065+00')
;

CREATE TABLE IF NOT EXISTS customer_interactions (
	account_id NUMERIC,
	channel VARCHAR(50),
	category VARCHAR(50),
	service_rep VARCHAR(50),
	status VARCHAR(50),
	created_at TIMESTAMP,
	completed_at TIMESTAMP
);

INSERT INTO customer_interactions (account_id, channel, category, service_rep, status, created_at, completed_at)
VALUES
	('1', 'web', 'Tech Support', 'Andy', 'resolved', '2021-01-25 19:11:35.295813+00', '2021-01-25 19:13:52.812371+00'),
	('1', 'email', 'Billing', 'Jillian', 'open', '2021-04-06 22:23:09.581234+00', null),
	('3', 'web', 'Billing', 'Monica', 'resolved', '2021-11-13 06:25:54.821374+00', '2021-11-15 12:19:33.882136+00'),
	('7', 'phone', 'Account Change', 'Derek', 'canceled', '2022-02-14 15:02:47.219352+00', '2022-02-20 09:22:48.145523+00')
;

CREATE TABLE IF NOT EXISTS customer_licenses (
	account_id NUMERIC,
	license_data TEXT,
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);

INSERT INTO customer_licenses (account_id, license_data, created_at, updated_at)
VALUES
	('1','{“license_id”:“d17cb11cda9ba249c22f67e4aed65d0f65f1a80c”,“role”: “analyst”,“status”: “active”}', '2022-03-12 02:56:37.652093+00', '2022-03-12 02:56:37.652093+00'),
	('6', '{“license_id”:“be49ad8f4a68fbbdd1674b41da20759f54b0e930”,“role”: “developer”,“status”: “active”}', '2021-05-28 04:42:58.955093+00', '2021-05-28 04:42:58.955093+00'),
	('6', '{“license_id”:“8541866bb3a4c4ecf070b2c1b2f7bb9c0934d287”,“role”: “admin”,“status”: “active”}', '2022-10-30 21:33:46.353060+00', '2022-10-30 21:33:46.353060+00'),
	('35', '{“license_id”:“60831f59a531eef325e525ad58bae0e5e8c2d75a”,“role”: “developer”,“status”: “disabled”}', '2021-03-26 02:38:02.136033+00', '2022-07-21 23:03:29.862040+00')
;

--Line Break for Tyler Pugliese Edits -- 

CREATE TABLE IF NOT EXISTS customer_pricing_plans (
	id INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	monthly_charge NUMERIC,
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO customer_pricing_plans (id, name, monthly_charge, created_date, updated_date)
VALUES
	('1', 'Free', 0, '2019-07-12', '2019-07-12'),
	('2', 'Medium', 50, '2019-07-12', '2019-07-12'),
	('3', 'Enterprise', 500, '2019-07-23', '2019-07-23')
;


CREATE TABLE IF NOT EXISTS customer_accounts_new (
	id INT,
	email VARCHAR(50) UNIQUE NOT NULL,
	pricing_plan_id INT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP,
	PRIMARY KEY (id),
	CONSTRAINT fk_pricing_plan
		FOREIGN KEY (pricing_plan_id)
			REFERENCES customer_pricing_plans(id)
);

INSERT INTO customer_accounts_new (id, email, pricing_plan_id, created_at, updated_at)
VALUES
	('1', 'abc@123.com', '1', '2019-05-01 21:13:05.156042+00', '2019-05-01 21:13:11.804514+00'),
	('2', '123@abc.com', '2', '2019-07-12 16:05:02.414454+00', '2020-01-04 17:23:05.594305+00'),
	('3', 'hello@world.com', '3', '2019-07-23 12:26:47.571431+00', '2019-09-17 04:32:32.493065+00'),
	('6', 'ilovedogs@dogs.com', '1', '2024-01-01 21:13:11.804514+00', '2024-01-01 21:13:11.804514+00'),
	('7', 'fakedatarules@gophermail.com', '2', '2024-02-16 17:23:05.594305+00', '2024-02-16 17:23:05.594305+00'),
	('35', 'skidboot@heelermail.com', '3', '2024-03-08 04:32:32.493065+00', '2024-03-08 04:32:32.493065+00')
;

CREATE TABLE IF NOT EXISTS service_representatives (
	id INT,
	email VARCHAR(100) UNIQUE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE,
	PRIMARY KEY (id)

);

INSERT INTO service_representatives (id, email, first_name, last_name, start_date, end_date)
VALUES
	('1', 'andybotwin@dogdb.com', 'Andy', 'Botwin', '2021-01-01', NULL),
	('2', 'jillianbelk@dogdb.com', 'Jillian', 'Belk', '2021-01-01', NULL),
	('3', 'monicageller@dogdb.com', 'Monica', 'Geller', '2021-02-01', NULL),
	('4', 'derek.hostetler@dogdb.com', 'Derek', 'Hostetler', '2020-03-08', '2023-12-25')
	 
;

CREATE TABLE IF NOT EXISTS customer_interactions_new (
	id INT,
	account_id INT,
	channel VARCHAR(50) NOT NULL,
	category VARCHAR(100) NOT NULL,
	service_rep_id INT,
	status VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP,
	PRIMARY KEY (id),
	CONSTRAINT fk_service_rep
		FOREIGN KEY (service_rep_id)
			REFERENCES service_representatives (id)
		
);

INSERT INTO customer_interactions_new (id, account_id, channel, category, service_rep_id, status, created_at, updated_at)
VALUES
	('1', '1', 'web', 'Tech Support', '1', 'resolved', '2021-01-25 19:11:35.295813+00', '2021-01-25 19:13:52.812371+00'),
	('2', '1', 'email', 'Billing', '2', 'open', '2021-04-06 22:23:09.581234+00', null),
	('3', '3', 'web', 'Billing', '3', 'resolved', '2021-11-13 06:25:54.821374+00', '2021-11-15 12:19:33.882136+00'),
	('4', '7', 'phone', 'Account Change', '4', 'canceled', '2022-02-14 15:02:47.219352+00', '2022-02-20 09:22:48.145523+00')

;
	 
CREATE TABLE IF NOT EXISTS customer_licenses_new (
	id VARCHAR(50),
	account_id INT NOT NULL,
	role VARCHAR(50) NOT NULL,
	status VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP,
	PRIMARY KEY(id),
	CONSTRAINT fk_account_id
		FOREIGN KEY (account_id)
			REFERENCES customer_accounts_new (id)

);

INSERT INTO customer_licenses_new (id, account_id, role, status, created_at, updated_at)
VALUES
	('d17cb11cda9ba249c22f67e4aed65d0f65f1a80c', '1','analyst', 'active', '2022-03-12 02:56:37.652093+00', '2022-03-12 02:56:37.652093+00'),
	('be49ad8f4a68fbbdd1674b41da20759f54b0e930', '6', 'developer', 'active', '2021-05-28 04:42:58.955093+00', '2021-05-28 04:42:58.955093+00'),
	('8541866bb3a4c4ecf070b2c1b2f7bb9c0934d287', '6', 'admin', 'active', '2022-10-30 21:33:46.353060+00', '2022-10-30 21:33:46.353060+00'),
	('60831f59a531eef325e525ad58bae0e5e8c2d75a', '35', 'developer', 'disabled', '2021-03-26 02:38:02.136033+00', '2022-07-21 23:03:29.862040+00')
;
