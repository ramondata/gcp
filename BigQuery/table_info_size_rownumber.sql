-- Get information about size and row number

SELECT 
  dataset_id,
  table_id,
  -- Convert bytes to GB.
  ROUND(size_bytes/pow(10,9),2) as size_gb,
  -- Convert UNIX EPOCH to a timestamp.
  TIMESTAMP_MILLIS(creation_time) AS creation_time,
  TIMESTAMP_MILLIS(last_modified_time) as last_modified_time,
  row_count,
  CASE 
    WHEN type = 1 THEN 'table'
    WHEN type = 2 THEN 'view'
    WHEN type = 3 THEN 'external source'
  ELSE NULL
  END AS type
FROM
  `<project><dataset>.__TABLES__`
ORDER BY size_gb DESC;


select *
FROM `<project-id>`.`region-southamerica-east1`.INFORMATION_SCHEMA.TABLES
