#!/usr/bin/env bash

project=cerc2-gestop-stg
region=southamerica-east1

gcloud config set run/region $region
gcloud config set project $project

extract_version="v0.$1.0"
rater_version="v0.$2.0"
return_version="v0.$3.0"

tr_b3=b3
tr_tag=tag
tr_nuclea=nuclea

type_c=contract
type_a=agenda

echo "update step 1 --> extract --> version $extract_version"
gcloud run jobs update interop-conciliation-step1-extract-$type_a --image gcr.io/$project/interop-conc-step1-extract:$extract_version
gcloud run jobs update interop-conciliation-step1-extract-$type_c --image gcr.io/$project/interop-conc-step1-extract:$extract_version

echo "update step 2 --> rater --> version $rater_version"
gcloud run jobs update interop-step2-rater-$type_c-$tr_b3 --image gcr.io/$project/interop-conc-step2-rate:$rater_version
gcloud run jobs update interop-step2-rater-$type_c-$tr_nuclea --image gcr.io/$project/interop-conc-step2-rate:$rater_version
gcloud run jobs update interop-step2-rater-$type_c-$tr_tag --image gcr.io/$project/interop-conc-step2-rate:$rater_version
gcloud run jobs update interop-step2-rater-$type_a-$tr_tag --image gcr.io/$project/interop-conc-step2-rate:$rater_version
gcloud run jobs update interop-step2-rater-$type_a-$tr_b3 --image gcr.io/$project/interop-conc-step2-rate:$rater_version
gcloud run jobs update interop-step2-rater-$type_a-$tr_nuclea --image gcr.io/$project/interop-conc-step2-rate:$rater_version

echo "update step 3 --> return --> version $return_version"
gcloud run jobs update interop-step3-return-$tr_b3 --image gcr.io/$project/interop-conc-step3-return:$return_version
gcloud run jobs update interop-step3-return-$tr_nuclea --image gcr.io/$project/interop-conc-step3-return:$return_version
gcloud run jobs update interop-step3-return-$tr_tag --image gcr.io/$project/interop-conc-step3-return:$return_version
