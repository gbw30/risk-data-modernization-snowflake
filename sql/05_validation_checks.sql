-- 1) Row counts
SELECT
  (SELECT COUNT(*) FROM STAGE.POLICY_RAW) AS source_rows,
  (SELECT COUNT(*) FROM CORE.DIM_POLICY)  AS target_rows;

-- 2) Rejected records
SELECT *
FROM STAGE.POLICY_RAW
WHERE premium_amount < 0;

-- 3) Null effective_date in CORE
SELECT COUNT(*) AS null_dates
FROM CORE.DIM_POLICY
WHERE effective_date IS NULL;

-- 4) Business rule enforcement in CORE
SELECT COUNT(*) AS negative_premiums_in_core
FROM CORE.DIM_POLICY
WHERE premium_amount < 0;

-- 5) Standardization check
SELECT status, COUNT(*) AS ct
FROM CORE.DIM_POLICY
GROUP BY status
ORDER BY status;

-- 6) Duplicate detection
SELECT policy_id, COUNT(*) AS ct
FROM CORE.DIM_POLICY
GROUP BY policy_id
HAVING COUNT(*) > 1;
