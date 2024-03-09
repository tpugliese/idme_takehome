CREATE TABLE IF NOT EXISTS customer_accounts (
	account_id NUMERIC PRIMARY KEY,
	email VARCHAR(50),
	current_tier VARCHAR(50),
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);

INSERT INTO customer_accounts (account_id, email, current_tier, created_at, updated_at)
VALUES
	('1', 'abc@123.com', 'Free', '2019-05-01 21:13:05.156042+00', '2019-05-01 21:13:11.804514+00')
	('2', '123@abc.com', 'Medium', '2019-07-12 16:05:02.414454+00', '2020-01-04 17:23:05.594305+00')
	('3', 'hello@world.com', 'Enterprise', '2019-07-23 12:26:47.571431+00', '2019-09-17 04:32:32.493065+00')
;