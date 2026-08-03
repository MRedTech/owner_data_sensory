-- Verify Sensory Tower A batch: A-10-13 and Level 11 through Level 20.

-- Batch totals. Expected:
-- total_unit_records = 131
-- owner_name_available = 126
-- owner_name_not_displayed = 5
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm = 'A1013'
   OR unit_norm GLOB 'A1[1-9]*'
   OR unit_norm GLOB 'A20*';

-- Overall Sensory Tower A totals after the first and second batches. Expected:
-- total_unit_records = 269
-- owner_name_available = 257
-- owner_name_not_displayed = 12
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm LIKE 'AG%'
   OR unit_norm GLOB 'A0[1-9]*'
   OR unit_norm GLOB 'A1[0-9]*'
   OR unit_norm GLOB 'A20*';

-- Quick lookup tests.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN ('A1013', 'A1101', 'A1112', 'A2005', 'A2013')
ORDER BY unit_norm, owner_order;
