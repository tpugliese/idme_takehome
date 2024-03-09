-- Database: dogdb

-- DROP DATABASE IF EXISTS dogdb;

CREATE DATABASE dogdb
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


CREATE TABLE IF NOT EXISTS customer_accounts (
	account_id NUMBER PRIMARY KEY,
	email VARCHAR(50),
	current_tier VARCHAR(50),
	created_at TIMESTAMP,
	updated_at TIMESTAMP
);