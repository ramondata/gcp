declare dolar_avg float64 default 4.99;

WITH
 storage_sizes AS (
   SELECT
      '<project-id>' as project,
      CONCAT(v1.table_schema) AS table_schema,
      CONCAT(v1.table_name) AS table_name,
      SUM(v2.active_logical_bytes) / pow(10,9) AS active_logical_gb,
      SUM(v2.active_physical_bytes - v2.time_travel_physical_bytes) / pow(10,9) AS active_no_time_travel_physical_gb,
      SUM(v2.time_travel_physical_bytes) / pow(10,9) AS time_travel_physical_gb,
    FROM
      `<project-id>`.`region-southamerica-east1`.INFORMATION_SCHEMA.TABLES v1
    LEFT JOIN `<project-id>`.`region-southamerica-east1`.INFORMATION_SCHEMA.TABLE_STORAGE v2 ON v1.table_name = v2.table_name and v1.table_schema = v2.table_schema
    WHERE total_logical_bytes > 0
    AND total_physical_bytes > 0
    GROUP BY 1,2,3
 )
SELECT
project,
table_schema,
table_name,
active_logical_gb,
ROUND(active_logical_gb * 0.02 * dolar_avg, 2) AS active_logical_cost,
active_no_time_travel_physical_gb + time_travel_physical_gb as active_physical_cost,
ROUND((active_no_time_travel_physical_gb + time_travel_physical_gb) * 0.04 * dolar_avg, 2) AS active_physical_cost,
ROUND((active_logical_gb * 0.02 * dolar_avg) + ((active_no_time_travel_physical_gb + time_travel_physical_gb) * 0.04 * dolar_avg), 2) AS total_cost_month
FROM
storage_sizes
WHERE table_name = "<name od the table>"
