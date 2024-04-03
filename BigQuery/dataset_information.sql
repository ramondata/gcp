-- information about dataset

SELECT *
FROM `<project-id>.region-southamerica-east1`.INFORMATION_SCHEMA.SCHEMATA
where schema_name = '<dataset-id>'


SELECT *
FROM `<project-id>.region-southamerica-east1`.INFORMATION_SCHEMA.SCHEMATA_OPTIONS
where schema_name = '<dataset-id>'
