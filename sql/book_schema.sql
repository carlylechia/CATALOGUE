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

CREATE TABLE music_albums
(
    id         INT,
    name       VARCHAR(100),
    on_spotify BOOLEAN,
    item_id    INT,
    CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES item (id)
);

CREATE TABLE genres
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

