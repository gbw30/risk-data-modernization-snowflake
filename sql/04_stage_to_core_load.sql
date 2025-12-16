USE SCHEMA CORE;

TRUNCATE TABLE DIM_POLICY;

INSERT INTO DIM_POLICY (
  policy_id,
  agent_id,
  coverage_type,
  premium_amount,
  effective_date,
  status
)
SELECT
  policy_id,
  agent_id,
  coverage_type,
  premium_amount,
  TRY_TO_DATE(effective_date),
  CASE status_code
    WHEN 'A' THEN 'ACTIVE'
    WHEN 'C' THEN 'CLOSED'
    ELSE 'UNKNOWN'
  END
FROM STAGE.POLICY_RAW
WHERE premium_amount >= 0;
