declare dolar float64 default 4.99;
declare price_slot_hour float64 default 0.074;

SELECT
  (SUM(total_slot_ms) / (1000 * 60 * 60)) * price_slot_hour * dolar AS price_jobs
FROM
  `<project-id>.region-southamerica-east1`.INFORMATION_SCHEMA.JOBS
where user_email = "<user-account>"
and EXTRACT(MONTH FROM creation_time) = 03
and EXTRACT(YEAR FROM creation_time) = 2024
and total_slot_ms is not null;
