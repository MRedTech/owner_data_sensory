-- Verify Sensory Tower A batch: Level 21 through Level 30.

-- Batch totals. Expected:
-- total_unit_records = 130
-- owner_name_available = 125
-- owner_name_not_displayed = 5
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm GLOB 'A2[1-9]*'
   OR unit_norm GLOB 'A30*';

-- Overall Sensory Tower A totals after Level G through Level 30. Expected:
-- total_unit_records = 399
-- owner_name_available = 382
-- owner_name_not_displayed = 17
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm LIKE 'AG%'
   OR unit_norm GLOB 'A0[1-9]*'
   OR unit_norm GLOB 'A1[0-9]*'
   OR unit_norm GLOB 'A2[0-9]*'
   OR unit_norm GLOB 'A30*';

-- Quick lookup tests.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN ('A2101', 'A2112', 'A2203', 'A2607', 'A2807', 'A3009', 'A3013')
ORDER BY unit_norm, owner_order;
