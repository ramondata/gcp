## create a dataproc service

### steps
- [x] create a network vpc
- [x] create a subnet for your vpc
- [x] create a firewall rules to allow communicate among cluster's vm
- [x] create your dataproc cluster
- [x] create firewall rule to allow your ip to access ssh
- [x] using targets 


 - 1: gcloud compute networks create my-vpc --subnet-mode=custom

   
 - 2: gcloud compute networks subnets create my-subnet --network=my-vpc --range=10.0.0.0/24

   
 - 3: gcloud compute firewall-rules create allow-internal \
  --network=my-vpc \
  --allow=tcp,udp,icmp \
  --source-ranges=10.0.0.0/24,10.0.1.0/24
 
 
 - 4: gcloud dataproc clusters create my-cluster \
  --subnet=my-subnet \
  --region=your-region \
  --zone=your-zone \
  --master-machine-type=n1-standard-2 \
  --worker-machine-type=n1-standard-2 \
  --num-workers=2


 - 5: gcloud compute firewall-rules create allow-internal-ssh \
     --network=my-vpc \
     --allow=tcp:22,udp,icmp \
     --source-ranges=35.235.240.0/20
 
- 6: gcloud compute instances add-tags my-cluster-m \
  --tags=dataproc-node  # Adjust as needed

- 7: gcloud compute firewall-rules update allow-internal \
  --network=my-vpc \
  --source-tags=dataproc-node \
  --target-tags=dataproc-node \
  --allow=tcp,udp,icmp

 
