-- Verify Sensory Tower B batch: Level G through Level 10.

-- Tower B batch totals. Expected:
-- total_unit_records = 137
-- owner_name_available = 133
-- owner_name_not_displayed = 4
SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm LIKE 'BG%'
   OR unit_norm GLOB 'B0[1-9]*'
   OR unit_norm GLOB 'B10*';

-- Overall Sensory owner totals after Tower A Level G–36
-- and Tower B Level G–10. Expected:
-- total_unit_records = 614
-- owner_name_available = 592
-- owner_name_not_displayed = 22
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
   OR unit_norm GLOB 'B10*';

-- Quick lookup tests.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN (
  'BG01',
  'BG03A',
  'B0503',
  'B0612',
  'B0708',
  'B0802',
  'B0812',
  'B0907',
  'B1013'
)
ORDER BY unit_norm, owner_order;
