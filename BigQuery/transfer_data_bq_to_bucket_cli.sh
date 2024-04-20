#!/usr/bin/env bash


r=southamerica-east1
p=cerc2-gestop-prd-01


echo "set project $p"
gcloud config set project $p


echo "set region $r"
gcloud config set compute/region $r


tables=("alert_contract_effect_q4"
"")


for item in "${tables[@]}"; do
	echo "transfer table $item from bq to bucket"
    bq extract \
	  --destination_format=PARQUET \
      --compression SNAPPY \
      "$p:monitoring.$item" "gs://backup_monitoring/$item/*.parquet"
done
