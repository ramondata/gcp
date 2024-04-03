--Roles for each accounts 

SELECT
  *
FROM
  <project-id>.`region-southamerica-east1`.INFORMATION_SCHEMA.OBJECT_PRIVILEGES
WHERE OBJECT_NAME = "<dataset-id>"
