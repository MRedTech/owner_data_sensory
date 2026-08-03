-- Verify Sensory Tower B batch: Level 21 through Level 30.

-- Tower B Level 21–30 batch totals. Expected:
-- total_unit_records = 130
-- owner_name_available = 125
-- owner_name_not_displayed = 5
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm GLOB 'B2[1-9]*'
   OR unit_norm GLOB 'B30*';

-- Cumulative Sensory totals after:
-- Tower A Level G–36,
-- Tower B Level G–10,
-- Tower B Level 11–20,
-- Tower B Level 21–30.
-- Expected:
-- total_unit_records = 874
-- owner_name_available = 840
-- owner_name_not_displayed = 34
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
   OR unit_norm GLOB 'B30*';

-- Quick lookup tests, including units without owner names.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN (
  'B2101',
  'B2105',
  'B2201',
  'B2213',
  'B2303A',
  'B2502',
  'B2511',
  'B2701',
  'B3005',
  'B3011',
  'B3013'
)
ORDER BY unit_norm, owner_order;
