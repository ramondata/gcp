gcloud compute networks create vpc-own-00 \
  --project=cloud-treino \ 
  --description=My\ own\ particular\ networking \
  --subnet-mode=custom \
  --mtu=1460 \
  --bgp-routing-mode=regional

gcloud compute networks subnets create southamerica-east1-subnet \
  --project=cloud-treino \ 
  --description=S\ão\ Paulo\ subnet \
  --range=10.10.1.0/24 \
  --stack-type=IPV4_ONLY \
  --network=vpc-own-00 \
  --region=southamerica-east1 \ 
  --enable-private-ip-google-access
