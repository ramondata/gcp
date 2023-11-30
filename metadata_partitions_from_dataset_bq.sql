select 
table_catalog, 
table_schema, 
table_name, 
partition_id, 
total_rows, 
cast(total_logical_bytes / 1000000 as STRING) as total_logical_MB, 
cast(total_logical_bytes / 1000000 as STRING) as total_billable_MB, 
SUBSTRING(CAST(last_modified_time AS STRING), 0, 10) AS last_modified_date,
storage_tier, 
CASE 
WHEN storage_tier = "ACTIVE" THEN "less than 90 days used"
WHEN storage_tier = "LONG_TERM" THEN "greater than 90 days without access"
END as status
from `<project-id>.<dataset-id>.INFORMATION_SCHEMA.PARTITIONS`
