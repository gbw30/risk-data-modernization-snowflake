# Risk Data Modernization – Snowflake Pipeline Simulation

## Overview
This project simulates an enterprise data modernization workflow commonly used in insurance and financial services. Legacy-style data is ingested into Snowflake, transformed into a clean data mart structure, and validated using industry-standard data quality checks.

Due to regional service constraints preventing execution of Informatica Cloud, ETL execution is implemented using Snowflake SQL and Python while preserving Informatica-equivalent mapping logic and documentation.

The focus of this project is correctness, validation, automation, and clear documentation — mirroring real-world data modernization work.

---

## Architecture

Legacy Source (Simulated)  
→ **STAGE schema** (raw landing tables)  
→ **CORE schema** (cleaned dimensional model)  
→ **Validation & QC Automation (Python)**  
→ **QC Reports (CSV / Excel)**  

---

## Technology Stack

- **Snowflake** – Cloud data warehouse
- **SQL** – Data transformation and validation logic
- **Python** – Pipeline orchestration and QC automation
- **Git / GitHub** – Version control and documentation

> **Note on Informatica:**  
> Informatica Cloud execution is not used due to regional service limitations.  
> An Informatica-style mapping design is provided in `/docs` to demonstrate tool-level understanding and equivalent ETL logic.

---

## Repository Structure

risk-data-modernization-snowflake/
sql/
01_setup_context.sql
02_stage_tables.sql
03_core_tables.sql
04_stage_to_core_load.sql
05_validation_checks.sql
etl/
run_pipeline.py
docs/
Risk_Data_Modernization_Project_Documentation.docx
Risk_Data_Modernization_Beginner_Learning_Guide.docx
Informatica_Mapping_Design_Conceptual.docx
outputs/
qc_report_.csv
qc_report_.xlsx
README.md
requirements.txt

yaml
Copy code

---

## Data Model

### STAGE Schema
- `STAGE.POLICY_RAW`
  - Raw landing table
  - Legacy-style data (strings for dates, coded values, invalid records allowed)

### CORE Schema
- `CORE.DIM_POLICY`
  - Cleaned, analytics-ready dimension table
  - Proper data types, standardized values, enforced business rules

---

## Transformation Logic (STAGE → CORE)

- Convert date strings to `DATE` using safe casting
- Map coded status values to business-friendly labels
- Enforce business rules (e.g., reject negative premiums)
- Generate surrogate keys for dimensional modeling

This logic is implemented in:
- SQL (for clarity and correctness)
- Python orchestration (to simulate ETL execution)

---

## Data Validation Performed

All validation checks produced expected (PASS) results:

- Row count reconciliation (source vs target)
- Rejected record identification
- Null / completeness checks
- Business rule enforcement
- Code standardization validation
- Duplicate detection

Validation results are documented and exported as QC reports.

---

## How to Run the Pipeline

1. Ensure Snowflake credentials are set via environment variables or `.env`
2. Activate Python virtual environment
3. Run:

```bash
python etl/run_pipeline.py
Outputs:

QC summary CSV
QC Excel report with validation results

Documentation

Detailed documentation is available in /docs:

Full project documentation

Beginner-friendly learning guide

Conceptual Informatica mapping design

Intended Next Enhancements

Add claims fact table and referential integrity checks

Extend QC automation with PASS/FAIL thresholds

Add run metrics (rows in/out, runtime)

Optional visualization of QC trends
