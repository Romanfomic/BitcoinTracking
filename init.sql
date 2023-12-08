CREATE TABLE year (
  day INT NOT NULL,
  month INT NOT NULL,
  value DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (day, month)
);
CREATE TABLE day (
  day INT NOT NULL,
  month INT NOT NULL,
  hour INT NOT NULL,
  value DECIMAL(10, 2) NOT NULL
);

INSERT INTO year (day, month, value) VALUES (8, 12, 10.05);
INSERT INTO day (day, month, hour, value) VALUES
  (8, 12, 1, 10.5),
  (8, 12, 2, 11.2),
  (8, 12, 3, 9.8),
  (8, 12, 4, 8.3),
  (8, 12, 5, 12.7),
  (8, 12, 6, 10.1),
  (8, 12, 7, 11.9),
  (8, 12, 8, 9.5),
  (8, 12, 9, 8.7),
  (8, 12, 10, 12.4),
  (8, 12, 11, 11.0),
  (8, 12, 12, 10.2),
  (8, 12, 13, 10.5),
  (8, 12, 14, 11.2),
  (8, 12, 15, 9.8),
  (8, 12, 16, 8.3),
  (8, 12, 17, 12.7),
  (8, 12, 18, 10.1),
  (8, 12, 19, 11.9),
  (8, 12, 20, 9.5),
  (8, 12, 21, 8.7),
  (8, 12, 22, 12.4),
  (8, 12, 23, 11.0),
  (8, 12, 24, 10.2);

