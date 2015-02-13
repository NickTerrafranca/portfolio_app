CREATE TABLE MESSAGES (
id SERIAL PRIMARY KEY,
name varchar(200) NOT NULL,
email varchar(200) NOT NULL,
content text NOT NULL,
created_at timestamp NOT NULL
);
