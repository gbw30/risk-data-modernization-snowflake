USE SCHEMA CORE;

CREATE OR REPLACE TABLE DIM_POLICY (
  policy_key       NUMBER AUTOINCREMENT,
  policy_id        STRING,
  agent_id         STRING,
  coverage_type    STRING,
  premium_amount   NUMBER(10,2),
  effective_date   DATE,
  status           STRING
);
