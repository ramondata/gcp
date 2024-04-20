CREATE OR REPLACE EXTERNAL TABLE `<table-id>`
(
  id	INT64,				
  name	STRING,				
)
OPTIONS (
  format = 'CSV',
  uris = ['gs://<bucket-id>/dir//*.csv'],
  field_delimiter = ','
);
