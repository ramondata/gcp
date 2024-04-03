-- What jobs are running now

SELECT
  job_id,
  job_type,
  state,
  creation_time,
  start_time,
  user_email
 FROM `cerc2-gestop-prd-01.region-southamerica-east1`.INFORMATION_SCHEMA.JOBS
 WHERE
    state!="DONE" AND
    creation_time >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 MINUTE)
ORDER BY creation_time ASC;
