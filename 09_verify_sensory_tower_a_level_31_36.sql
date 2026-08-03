-- Verify Sensory Tower A final batch: Level 31 through Level 36.

-- Batch totals. Expected:
-- total_unit_records = 78
-- owner_name_available = 77
-- owner_name_not_displayed = 1
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm GLOB 'A3[1-6]*';

-- Final overall Sensory Tower A totals, Level G through Level 36. Expected:
-- total_unit_records = 477
-- owner_name_available = 459
-- owner_name_not_displayed = 18
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm LIKE 'AG%'
   OR unit_norm GLOB 'A0[1-9]*'
   OR unit_norm GLOB 'A1[0-9]*'
   OR unit_norm GLOB 'A2[0-9]*'
   OR unit_norm GLOB 'A3[0-6]*';

-- Quick lookup tests.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN ('A3101', 'A3108', 'A3210', 'A3509', 'A3510', 'A3602', 'A3613')
ORDER BY unit_norm, owner_order;
