/*
==============================================================
06 - PRIMARY & FOREIGN KEYS
==============================================================

Purpose:
    Add primary keys and foreign key constraints after
    validating data quality.

Requirements:
    - No duplicate primary keys
    - No orphan records

Author: Muhammadyusuf Olimjonov
==============================================================
*/



SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_schema='public'
ORDER BY tc.table_name, tc.constraint_type;