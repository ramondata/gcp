from google.cloud import bigquery

def extract_monthly_partitioned_table(project_id, dataset_id, table_id, destination_uri):
    client = bigquery.Client(project=project_id)

    dataset_ref = client.dataset(dataset_id)
    table_ref = dataset_ref.table(table_id)
    
    job_config = bigquery.ExtractJobConfig()
    job_config.destination_format = bigquery.DestinationFormat.PARQUET
    job_config.compression = bigquery.Compression.SNAPPY
    job_config.time_partitioning = bigquery.TimePartitioning(
        field="created_at",  # Replace with your actual partition column
        type_=bigquery.TimePartitioningType.MONTH
    )

    extract_job = client.extract_table(
        table_ref,
        destination_uri,
        job_config=job_config
    )

    extract_job.result()  # Wait for the job to complete

    print(f"Monthly partitioned table {table_id} exported to {destination_uri}")

if __name__ == "__main__":
    # Replace these with your own values
    project_id = "your-project-id"
    dataset_id = "your-dataset-id"
    table_id = "your-table-id"
    destination_uri = "gs://your-bucket/your-export-file/"

    extract_monthly_partitioned_table(project_id, dataset_id, table_id, destination_uri)
