CREATE DATABASE catalogue_of_things;

CREATE TABLE label(
 id INTEGER GENERATED ,
 title VARCHAR(50),
 color VARCHAR(50),
 PRIMARY KEY(id)
);

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(15),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  FOREIGN KEY (label_id) REFERENCES label(id),
  PRIMARY KEY(id)
);

CREATE TABLE authors (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
);

CREATE TABLE games (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    author_id int,
    multiplayer VARCHAR(100),
    last_played_at DATE,
    FOREIGN KEY(author_id) REFERENCES authors(id)
)
