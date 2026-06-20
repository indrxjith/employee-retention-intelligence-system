-- ==========================================
-- ERIS Data Warehouse Schema
-- Employee Retention Intelligence System
-- ==========================================


-- Drop existing tables if they exist

DROP TABLE IF EXISTS fact_attrition;
DROP TABLE IF EXISTS fact_performance;

DROP TABLE IF EXISTS dim_employee;
DROP TABLE IF EXISTS dim_department;
DROP TABLE IF EXISTS dim_job_role;
DROP TABLE IF EXISTS dim_time;


-- ==========================================
-- Department Dimension
-- ==========================================

CREATE TABLE dim_department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);


-- ==========================================
-- Job Role Dimension
-- ==========================================

CREATE TABLE dim_job_role (
    job_role_id SERIAL PRIMARY KEY,
    job_role_name VARCHAR(100) UNIQUE NOT NULL
);


-- ==========================================
-- Employee Dimension
-- ==========================================

CREATE TABLE dim_employee (
    employee_key SERIAL PRIMARY KEY,

    employee_id INT UNIQUE NOT NULL,
    age INT,
    gender VARCHAR(20),
    marital_status VARCHAR(30),
    education INT,
    education_field VARCHAR(100)
);


-- ==========================================
-- Time Dimension
-- ==========================================

CREATE TABLE dim_time (
    time_key SERIAL PRIMARY KEY,

    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20)
);


-- ==========================================
-- Performance Fact Table
-- ==========================================

CREATE TABLE fact_performance (
    performance_id SERIAL PRIMARY KEY,

    employee_key INT REFERENCES dim_employee(employee_key),
    job_role_id INT REFERENCES dim_job_role(job_role_id),
    department_id INT REFERENCES dim_department(department_id),

    performance_rating INT,
    job_satisfaction INT,
    environment_satisfaction INT,
    relationship_satisfaction INT,
    work_life_balance INT
);


-- ==========================================
-- Employee Attrition Fact Table
-- ==========================================

CREATE TABLE fact_attrition (
    attrition_id SERIAL PRIMARY KEY,

    employee_key INT REFERENCES dim_employee(employee_key),
    department_id INT REFERENCES dim_department(department_id),

    attrition VARCHAR(10),
    years_at_company INT,
    years_in_current_role INT,
    years_since_last_promotion INT,
    years_with_current_manager INT,

    monthly_income NUMERIC(12,2),
    percent_salary_hike INT,
    stock_option_level INT,

    overtime VARCHAR(10),
    business_travel VARCHAR(50),
    distance_from_home INT
);