-- Verify Sensory Tower B batch: Level 11 through Level 20.

-- Tower B Level 11–20 batch totals. Expected:
-- total_unit_records = 130
-- owner_name_available = 123
-- owner_name_not_displayed = 7
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm GLOB 'B1[1-9]*'
   OR unit_norm GLOB 'B20*';

-- Cumulative Sensory totals after:
-- Tower A Level G–36,
-- Tower B Level G–10,
-- Tower B Level 11–20.
-- Expected:
-- total_unit_records = 744
-- owner_name_available = 715
-- owner_name_not_displayed = 29
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
   OR unit_norm GLOB 'B20*';

-- Quick lookup tests, including units without owner names.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN (
  'B1101',
  'B1109',
  'B1202',
  'B1310',
  'B1403A',
  'B1603A',
  'B1711',
  'B1713',
  'B1903',
  'B2007',
  'B2013'
)
ORDER BY unit_norm, owner_order;
