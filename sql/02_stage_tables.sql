USE SCHEMA STAGE;

CREATE OR REPLACE TABLE POLICY_RAW (
  policy_id        STRING,
  agent_id         STRING,
  coverage_type    STRING,
  premium_amount   NUMBER(10,2),
  effective_date   STRING,
  status_code      STRING
);

TRUNCATE TABLE POLICY_RAW;

INSERT INTO POLICY_RAW VALUES
('P1001','A10','AUTO',1200.50,'2023-01-01','A'),
('P1002','A11','HOME',-500.00,'2023-02-15','A'),
('P1003','A12','AUTO',900.00,NULL,'C'),
('P1004','A10','LIFE',1500.00,'2023-03-01','A');
