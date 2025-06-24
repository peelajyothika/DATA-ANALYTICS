select * from [dbo].[Churn_Modelling (1)];

-- Churn by Gender
SELECT 
  Gender,
  COUNT(*) AS Total,
  SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned,
  ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Churn_Rate
FROM [dbo].[Churn_Modelling (1)]
GROUP BY Gender;

--Complaints Count
SELECT 
    CustomerId,
    COUNT(*) AS Complaint_Count
FROM [dbo].[Churn_Modelling (1)]
GROUP BY CustomerId;

--Tenure Distribution
SELECT 
    Tenure,
    COUNT(*) AS Customer_Count
FROM [dbo].[Churn_Modelling (1)]
GROUP BY Tenure
ORDER BY Tenure;

--Churn Summary by Geography
SELECT 
    Geography,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM [dbo].[Churn_Modelling (1)]
GROUP BY Geography;

-- Churn by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS Age_Group,
    COUNT(*) AS Total,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS Churned,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM [dbo].[Churn_Modelling (1)]
GROUP BY Age;
