#!/bin/bash

# Set your Google Cloud Storage bucket name
bucket_name="your_bucket_name"

# Set the project ID associated with your bucket
project_id="your_project_id"

# Get the current month in YYYYMM format
current_month=$(date "+%Y%m")

# Get the storage cost for the current month
cost=$(gsutil storage -p $project_id -b $bucket_name -t "$current_month-01T00:00:00Z" -e "$current_month-31T23:59:59Z")

# Print the storage cost
echo "Storage cost for $current_month in $bucket_name: $cost"
