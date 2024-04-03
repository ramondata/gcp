--Roles for each accounts 

SELECT
  *
FROM
  cerc2-gestop-stg.`region-southamerica-east1`.INFORMATION_SCHEMA.OBJECT_PRIVILEGES
WHERE OBJECT_NAME = "interop"
