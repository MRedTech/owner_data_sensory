-- Verify Sensory Tower B batch: Level 31 through Level 37.

-- Tower B Level 31–37 batch totals. Expected:
-- total_unit_records = 91
-- owner_name_available = 90
-- owner_name_not_displayed = 1
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm GLOB 'B3[1-7]*';

-- Final cumulative Sensory totals after:
-- Tower A Level G–36,
-- Tower B Level G–10,
-- Tower B Level 11–20,
-- Tower B Level 21–30,
-- Tower B Level 31–37.
-- Expected:
-- total_unit_records = 965
-- owner_name_available = 930
-- owner_name_not_displayed = 35
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm LIKE 'AG%'
   OR unit_norm GLOB 'A0[1-9]*'
   OR unit_norm GLOB 'A1[0-9]*'
   OR unit_norm GLOB 'A2[0-9]*'
   OR unit_norm GLOB 'A3[0-6]*'
   OR unit_norm LIKE 'BG%'
   OR unit_norm GLOB 'B0[1-9]*'
   OR unit_norm GLOB 'B1[0-9]*'
   OR unit_norm GLOB 'B2[0-9]*'
   OR unit_norm GLOB 'B3[0-7]*';

-- Quick lookup tests, including the unit without owner name.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN (
  'B3101',
  'B3103A',
  'B3201',
  'B3205',
  'B3308',
  'B3405',
  'B3506',
  'B3601',
  'B3701',
  'B3705',
  'B3713'
)
ORDER BY unit_norm, owner_order;
