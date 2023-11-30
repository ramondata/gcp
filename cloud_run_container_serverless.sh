### set project, region first

- gcloud config set compute/region southamerica-east1

- gcloud config set project cerc2-gestop-stg

- gcloud config set run/region southamerica-east1

### build container serveless using cloud run jobs (non-http):

- gcloud run jobs create <job-run-name> --image gcr.io/<project-id>/<image-name>:v0.6.0 --tasks <name> --max-retries <integer> --task-timeout <time> --parallelism <integer> --execute-now

- gcloud run jobs update <job-run-name> --image gcr.io/<project-id>/<image-name>:v0.6.0

- gcloud run jobs execute <job-run-name>

- gcloud run jobs executions describe <job-run-name>-<id>
