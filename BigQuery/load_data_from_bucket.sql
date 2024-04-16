--Parquet files

LOAD DATA INTO `table-destiny`
FROM FILES (
  format = 'PARQUET',
  uris = ["gs://<bucket-id-name>/directory/part-*.parquet"]);
