CREATE TABLE folders (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  parent_id   INTEGER REFERENCES folders(id) ON DELETE CASCADE,
  path        TEXT
);

CREATE INDEX idx_folders_parent ON folders(parent_id);



INSERT INTO folders (id, name, parent_id, path) VALUES
  (1, 'Root',   NULL, '/Root'),
  (2, 'Docs',   1,    '/Root/Docs'),
  (3, 'Images', 1,    '/Root/Images'),
  (4, '2024',   2,    '/Root/Docs/2024'),
  (5, '2025',   2,    '/Root/Docs/2025'),
  (6, 'Events', 3,    '/Root/Images/Events'),
  (7, 'Logos',  3,    '/Root/Images/Logos'),
  (8, 'Q1',     4,    '/Root/Docs/2024/Q1'),
  (9, 'Q2',     4,    '/Root/Docs/2024/Q2'),
  (10,'Raw',    6,    '/Root/Images/Events/Raw');
