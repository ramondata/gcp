-- Information about each column from each table

SELECT * FROM 
 `<project-id>.<dataset-id>.INFORMATION_SCHEMA.COLUMNS`;

-- Are there any partitioned or clustered columns?

SELECT * FROM 
 `<project-id>.<dataset-id>.INFORMATION_SCHEMA.COLUMNS`
WHERE 
  is_partitioning_column = 'YES' OR clustering_ordinal_position IS NOT NULL;
