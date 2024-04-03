-- Information about each column from each table

SELECT * FROM 
 `cerc2-gestop-stg.interop.INFORMATION_SCHEMA.COLUMNS`;

-- Are there any partitioned or clustered columns?

SELECT * FROM 
 `cerc2-gestop-stg.interop.INFORMATION_SCHEMA.COLUMNS`
WHERE 
  is_partitioning_column = 'YES' OR clustering_ordinal_position IS NOT NULL;
