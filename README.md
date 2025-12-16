# Risk Data Modernization – Snowflake Project

## Overview
This project simulates an enterprise data modernization workflow where legacy insurance policy data is loaded into Snowflake, transformed into a clean data mart, and validated using industry-standard quality checks.

## Architecture
Legacy Source (simulated)
→ STAGE schema (raw data)
→ CORE schema (cleaned dimensional tables)
→ Validation queries

## Tech Stack
- Snowflake
- SQL
- Python (planned)
- Informatica Cloud (planned)

## Project Structure
- sql/: table definitions, transformations, validation queries
- docs/: formal project documentation and learning guide
- python/: automated validation scripts
- informatica/: ETL mappings and notes
