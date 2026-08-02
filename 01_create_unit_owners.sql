-- Secure Entry Owner Details
-- Common D1 schema for each site database.
-- Initial live fields: UNIT NUMBER and OWNER NAME.

CREATE TABLE IF NOT EXISTS unit_owners (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  unit_number TEXT NOT NULL,
  unit_norm TEXT NOT NULL,
  owner_name TEXT,
  owner_order INTEGER NOT NULL DEFAULT 1 CHECK (owner_order >= 1),
  is_active INTEGER NOT NULL DEFAULT 1 CHECK (is_active IN (0, 1)),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (unit_norm, owner_order)
);

CREATE INDEX IF NOT EXISTS idx_unit_owners_unit_norm
  ON unit_owners (unit_norm);

CREATE INDEX IF NOT EXISTS idx_unit_owners_owner_name
  ON unit_owners (owner_name);
