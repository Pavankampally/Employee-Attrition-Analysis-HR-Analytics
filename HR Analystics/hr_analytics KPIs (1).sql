use hr_analysis;
show tables;
select * from hr_analytics;
SELECT * FROM hr_analytics LIMIT 10;

#Average Attrition rate for all Departments.
SELECT
Department,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics
GROUP BY Department;

#Average Hourly rate of Male Research Scientist.
SELECT ROUND(AVG(HourlyRate), 2) AS avg_hourly_rate
FROM hr_analytics
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

#Attrition rate Vs Monthly income stats.
SELECT Attrition,COUNT(*) AS total_employees, ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income, MIN(MonthlyIncome) AS min_income, MAX(MonthlyIncome) AS max_income
FROM hr_analytics
GROUP BY Attrition;

#average working years for each Department
SELECT Department,ROUND(AVG(TotalWorkingYears), 2) AS avg_working_years
FROM hr_analytics
GROUP BY Department;

#Job Role VS Work Life Balance
SELECT JobRole,ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance,COUNT(*) AS employee_count,
 CASE
        WHEN AVG(WorkLifeBalance) >= 2.5 THEN 'Good'
        WHEN AVG(WorkLifeBalance) >= 1.5 THEN 'Moderate'
        ELSE 'Bad'
    END AS work_life_balance_rating
FROM hr_analytics
GROUP BY JobRole
ORDER BY avg_work_life_balance DESC;

#Attrition rate Vs Year Science Last Promotion relation
#Attrition Rate = (Employees who left) / (Total employees in group) × 100

SELECT YearsSinceLastPromotion, COUNT(*) AS total_employees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count, ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM hr_analytics
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;





select * from hr_analytics;