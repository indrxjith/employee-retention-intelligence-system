# ERIS — Employee Retention Intelligence System

## Overview

ERIS is an end-to-end HR analytics project designed to identify the key drivers of employee attrition using SQL-based business intelligence and predictive-style risk scoring.

The project transforms employee data into strategic workforce insights through a PostgreSQL data warehouse, dimensional modeling, and 50 business-focused analytical queries.

---

## Project Architecture

CSV Dataset
↓
Python Data Import
↓
PostgreSQL Data Warehouse
↓
Dimensional Data Model
↓
50 SQL Business Queries
↓
Employee Risk Intelligence

---

## Tech Stack

- PostgreSQL
- SQL
- Python
- Pandas
- SQLAlchemy
- psycopg2

---

## Database Design

The project follows a star schema design:

### Fact Tables

- `fact_attrition`
- `fact_performance`

### Dimension Tables

- `dim_employee`
- `dim_department`
- `dim_job_role`

---

## Key Business Analysis

The project answers 50 HR business questions, including:

- Overall employee attrition analysis
- Department and job role retention risks
- Salary and compensation impact
- Overtime and work-life balance analysis
- Early career employee turnover
- Business travel impact
- Employee satisfaction analysis
- Employee retention risk scoring
- Executive retention dashboard

---

## Major Findings

- Overall attrition rate: 16.12%
- Sales Representatives showed the highest attrition (39.76%)
- Overtime employees had a 30.53% attrition rate compared with 10.44% for non-overtime employees
- The highest employee risk segment reached 74.29% attrition
- Employees with a risk score of 5 had an 85.71% attrition rate

---

## Project Files

- `01_create_warehouse.sql` — Database schema creation
- `02_load_dimensions.sql` — Dimension table loading
- `03_business_queries.sql` — 50 SQL business analyses
- `04_insights.md` — Executive business insights
- `import_csv.py` — Data loading pipeline

---

## Future Improvements

- Interactive Streamlit dashboard
- Power BI executive dashboard
- Machine learning attrition prediction model
