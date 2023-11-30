CREATE OR REPLACE EXTERNAL TABLE `cerc2-gestop-stg.interop.conciliacao_nuclea_agenda`
(
  dataCriacao	STRING,				
  dataReferencia	STRING,				
  idComunicacao	STRING,				
  cpfCnpjCredor	STRING,				
  idContratoExterno	STRING,				
  idControleRequisicao	STRING,				
  idEfeitoContrato	STRING,		
  statusContrato	STRING
)
OPTIONS (
  format = 'CSV',
  uris = ['gs://interop-external-table-source/agendas/nuclea/*.csv'],
  field_delimiter = ','
);
