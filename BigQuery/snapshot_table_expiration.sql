CREATE SNAPSHOT TABLE `temp.snapshot_from_table_test`
CLONE `table_source`
  OPTIONS (
    expiration_timestamp = TIMESTAMP '2024-04-05 15:00:00 UTC-3');
