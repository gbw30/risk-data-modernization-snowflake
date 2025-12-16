-- Row count reconciliation
SELECT
  (SELECT COUNT(*) FROM STAGE.POLICY_RAW) AS source_rows,
  (SELECT COUNT(*) FROM CORE.DIM_POLICY)  AS target_rows;

-- Rejected records
SELECT *
FROM STAGE.POLICY_RAW
WHERE premium_amount < 0;

-- Null date check
SELECT COUNT(*) AS null_dates
FROM CORE.DIM_POLICY
WHERE effective_date IS NULL;

-- Business rule enforcement
SELECT *
FROM CORE.DIM_POLICY
WHERE premium_amount < 0;

-- Standardization check
SELECT status, COUNT(*)
FROM CORE.DIM_POLICY
GROUP BY status;

-- Duplicate detection
SELECT policy_id, COUNT(*)
FROM CORE.DIM_POLICY
GROUP BY policy_id
HAVING COUNT(*) > 1;
