BEGIN;
SET client_encoding ='UTF8';
CREATE TABLE users (
    user_id varchar(150) UNIQUE NOT NULL,
    user_name varchar(150) NOT NULL,
    user_email varchar(50) UNIQUE NOT NULL,
    user_password varchar(100) NOT NULL,
    created_at TIMESTAMP(100) NOT NULL,
    updated_at text,
    last_login TIMESTAMP,
    token varchar(255) UNIQUE,
    token_created_at TIMESTAMP,
    owner_company_id varchar(150)
);
CREATE TABLE companies(
    company_id varchar(150) UNIQUE NOT NULL,
    company_name varchar(150) NOT NULL,
    company_email varchar(50) UNIQUE NOT NULL,
    company_password varchar(100) NOT NULL,
    company_cnpj varchar(100) UNIQUE NOT NULL,
    created_at text,
    updated_at text,
    last_login TIMESTAMP,
    token varchar(255) UNIQUE,
    token_created_at TIMESTAMP
);
CREATE TABLE usersAuths(
    auth_id varchar(150) UNIQUE NOT NULL,
    logged_id varchar(255) UNIQUE NOT NULL,
    logged_name varchar(150) NOT NULL,
    logged_token varchar(255) UNIQUE NOT NULL,
    auth_at TIMESTAMP
);
CREATE TABLE companiesAuths(
    auth_id varchar(150) UNIQUE NOT NULL,
    logged_id varchar(255) UNIQUE NOT NULL,
    logged_name varchar(150) NOT NULL,
    logged_token varchar(255) UNIQUE NOT NULL,
    auth_at TIMESTAMP
);
ALTER TABLE companiesAuths
add PRIMARY KEY (logged_token);
ALTER TABLE usersAuths
add PRIMARY KEY (logged_token);
ALTER TABLE users
add PRIMARY KEY (user_id),
add FOREIGN KEY (token) REFERENCES usersAuths (logged_token);
ALTER TABLE companies
add PRIMARY KEY (company_id),
add FOREIGN KEY (token) REFERENCES companiesAuths (logged_token);