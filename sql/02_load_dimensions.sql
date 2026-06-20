-- ============================================
-- ERIS Data Warehouse Data Loading
-- ============================================

-- Department Dimension
INSERT INTO dim_department (department_name)
SELECT DISTINCT "Department"
FROM staging_hr_employee;

-- Job Role Dimension
INSERT INTO dim_job_role (job_role_name)
SELECT DISTINCT "JobRole"
FROM staging_hr_employee;

-- Employee Dimension
INSERT INTO dim_employee (
    employee_id,
    age,
    gender,
    marital_status,
    education,
    education_field
)
SELECT
    "EmployeeNumber",
    "Age",
    "Gender",
    "MaritalStatus",
    "Education",
    "EducationField"
FROM staging_hr_employee;

-- Attrition Fact
INSERT INTO fact_attrition (
    employee_key,
    department_id,
    attrition,
    years_at_company,
    years_in_current_role,
    years_since_last_promotion,
    years_with_current_manager,
    monthly_income
)
SELECT
    e.employee_key,
    d.department_id,
    s."Attrition",
    s."YearsAtCompany",
    s."YearsInCurrentRole",
    s."YearsSinceLastPromotion",
    s."YearsWithCurrManager",
    s."MonthlyIncome"
FROM staging_hr_employee s
JOIN dim_employee e
    ON s."EmployeeNumber" = e.employee_id
JOIN dim_department d
    ON s."Department" = d.department_name;

-- Performance Fact
INSERT INTO fact_performance (
    employee_key,
    job_role_id,
    department_id,
    performance_rating,
    job_satisfaction,
    environment_satisfaction,
    relationship_satisfaction,
    work_life_balance
)
SELECT
    e.employee_key,
    j.job_role_id,
    d.department_id,
    s."PerformanceRating",
    s."JobSatisfaction",
    s."EnvironmentSatisfaction",
    s."RelationshipSatisfaction",
    s."WorkLifeBalance"
FROM staging_hr_employee s
JOIN dim_employee e
    ON s."EmployeeNumber" = e.employee_id
JOIN dim_job_role j
    ON s."JobRole" = j.job_role_name
JOIN dim_department d
    ON s."Department" = d.department_name;