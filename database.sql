CREATE TABLE folders (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  parent_id   INTEGER REFERENCES folders(id) ON DELETE CASCADE,
  path        TEXT
);

CREATE INDEX idx_folders_parent ON folders(parent_id);



INSERT INTO folders (id, name, parent_id, path) VALUES
  (1, 'Root',   NULL, '/Root'),
  (2, 'Docs',     1,    '/Root/Docs'),
  (3, 'Images',   1,    '/Root/Images'),
  (4, '2024',     2,    '/Root/Docs/2024'),
  (5, '2025',     2,    '/Root/Docs/2025'),
  (6, 'Events',   3,    '/Root/Images/Events'),
  (7, 'Logos',    3,    '/Root/Images/Logos'),
  (8, 'Q1',       4,    '/Root/Docs/2024/Q1'),
  (9, 'Q2',       4,    '/Root/Docs/2024/Q2'),
  (10,'Raw',      6,    '/Root/Images/Events/Raw'),
  (11, 'Reports', 5, '/Root/Docs/2025/Reports'),
  (12, 'Drafts',  5, '/Root/Docs/2025/Drafts'),
  (13, 'Final',   11, '/Root/Docs/2025/Reports/Final'),
  (14, 'Personal', 1, '/Root/Personal'),
  (15, 'Music',   14, '/Root/Personal/Music'),
  (16, 'Videos',  14, '/Root/Personal/Videos'),
  (17, 'Travel',  16, '/Root/Personal/Videos/Travel'),
  (18, 'Work',      1, '/Root/Work'),
  (19, 'Projects', 18, '/Root/Work/Projects'),
  (20, 'ProjectA', 19, '/Root/Work/Projects/ProjectA'),
  (21, 'ProjectB', 19, '/Root/Work/Projects/ProjectB'),
  (22, 'Archive',   1, '/Root/Archive'),
  (23, 'OldDocs',   22, '/Root/Archive/OldDocs'),
  (24, 'OldImages', 22, '/Root/Archive/OldImages'),
  (25, 'Temp',      1, '/Root/Temp');
