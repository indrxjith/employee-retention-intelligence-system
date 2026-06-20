-- =================================================
-- ERIS Business Analytics Queries
-- =================================================


-- =================================================
-- Query 1: Overall Employee Attrition Rate
-- Business Question:
-- What percentage of employees have left the company?
-- =================================================

SELECT 
    attrition,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM fact_attrition),
        2
    ) AS percentage
FROM fact_attrition
GROUP BY attrition;



-- =================================================
-- Query 2: Department-wise Attrition Rate
-- Business Question:
-- Which departments are losing the most employees?
-- =================================================

SELECT 
    d.department_name,
    COUNT(*) AS total_employees,
    SUM(
        CASE 
            WHEN fa.attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        SUM(
            CASE 
                WHEN fa.attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percentage
FROM fact_attrition fa
JOIN dim_department d
    ON fa.department_id = d.department_id
GROUP BY d.department_name
ORDER BY attrition_rate_percentage DESC;