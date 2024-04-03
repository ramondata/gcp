-- information about dataset

SELECT *
FROM `cerc2-gestop-prd-01.region-southamerica-east1`.INFORMATION_SCHEMA.SCHEMATA
where schema_name = '<dataset-id>'


SELECT *
FROM `cerc2-gestop-prd-01.region-southamerica-east1`.INFORMATION_SCHEMA.SCHEMATA_OPTIONS
where schema_name = '<dataset-id>'
