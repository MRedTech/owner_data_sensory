-- Verify the Sensory Tower A pilot import.

SELECT
  COUNT(*) AS total_unit_records,
  SUM(CASE WHEN owner_name IS NOT NULL AND TRIM(owner_name) <> '' THEN 1 ELSE 0 END) AS owner_name_available,
  SUM(CASE WHEN owner_name IS NULL OR TRIM(owner_name) = '' THEN 1 ELSE 0 END) AS owner_name_not_displayed
FROM unit_owners
WHERE unit_norm LIKE 'AG%'
   OR unit_norm GLOB 'A0[1-9]*'
   OR unit_norm GLOB 'A10*';

-- Quick lookup tests.
SELECT unit_number, unit_norm, owner_name, owner_order, is_active
FROM unit_owners
WHERE unit_norm IN ('AG01', 'A0101', 'A0903A', 'A1003')
ORDER BY unit_norm, owner_order;
