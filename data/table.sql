-- Create Label Table
CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  title varchar(100),
  color varchar(100)
);

-- Create Book Table
CREATE TABLE book (
  id SERIAL PRIMARY KEY,
  item_id INT REFERENCES item(id),
  label_id INT REFERENCES label(id),
  publish_date DATE,
  publisher varchar(100),
  cover_state varchar(100)
);