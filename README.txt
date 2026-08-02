SECURE ENTRY — OWNER DETAILS D1 PILOT
SENSORY RESIDENCE, TOWER A, LEVEL G–10

FILES
1. 01_create_unit_owners.sql
   Creates the reusable owner-details table and indexes.

2. 02_import_sensory_tower_a_g_10.sql
   Imports the verified Sensory Tower A pilot data.
   This file is safe to run again because it uses UPSERT.

3. 03_verify_owner_import.sql
   Confirms the imported totals and runs sample lookups.

4. sensory_tower_a_owner_list_level_g_10.csv
   Master CSV backup for the verified pilot batch.

5. sensory_tower_a_owner_list_level_g_10_verified.xlsx
   Verified source workbook.

IMPORT ORDER
1. Pause before changing the live Worker code.
2. Open the Sensory D1 database.
3. Run 01_create_unit_owners.sql.
4. Run 02_import_sensory_tower_a_g_10.sql.
5. Run 03_verify_owner_import.sql.

EXPECTED RESULT
- Total unit records: 138
- Owner names available: 131
- Owner names not displayed: 7

SEARCH NORMALISATION
A-G-01  -> AG01
A-01-01 -> A0101
A-09-03A -> A0903A

NOTES
- The table supports more than one owner per unit using owner_order.
- For this pilot batch, owner_order is 1 for every record.
- Blank source names are stored as NULL so the system can distinguish:
  UNIT FOUND, OWNER NAME NOT AVAILABLE.
- Each Secure Entry site can use the same table structure in its own D1 database.
- This package only prepares and imports owner data. It does not modify the Worker or index.html.
