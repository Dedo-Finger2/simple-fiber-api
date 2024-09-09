CREATE SCHEMA IF NOT EXISTS simplefiberapi;

CREATE TABLE IF NOT EXISTS simplefiberapi.users (
  id text PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL UNIQUE,
  password text NOT NULL,
  created_at timestamp not null,
  updated_at timestamp null
);

CREATE TABLE IF NOT EXISTS simplefiberapi.phone_numbers (
  id text PRIMARY KEY,
  user_id text NOT NULL,
  ddd int NOT NULL,
  number int NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NULL,
  FOREIGN KEY (user_id) REFERENCES simplefiberapi.users(id)
);

