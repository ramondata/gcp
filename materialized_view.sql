CREATE OR REPLACE MATERIALIZED VIEW `table_name` AS
SELECT * EXCEPT (
col1,
col2,
id
  )
FROM `source_table_name`
WHERE reference_date = "2023-09-08"
