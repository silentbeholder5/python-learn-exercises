# 50 Common SQL Conceptual Interview Questions for Mid-Level Data Analysts

## Joins and Table Relationships
1. What is the difference between a LEFT JOIN and a RIGHT JOIN?
2. How does an INNER JOIN differ from a FULL OUTER JOIN?
3. What is a CROSS JOIN and when would you use it?
4. What is a self-join and in what scenarios would you use it?
5. Explain the difference between JOIN and UNION operations.
6. What happens when you join tables with duplicate column names?
7. What are equi-joins and non-equi joins?
8. How do you handle many-to-many relationships in SQL?
9. When would you use a LEFT JOIN versus a subquery?
10. How can you ensure join operations perform efficiently?

## Aggregation and Grouping
11. What is the difference between WHERE and HAVING clauses?
12. Why can't you use aggregate functions in a WHERE clause?
13. What is the execution order of GROUP BY, HAVING, and WHERE clauses?
14. How do NULLs affect aggregate functions like AVG, SUM, COUNT?
15. What is the difference between COUNT(*), COUNT(1), and COUNT(column_name)?
16. How would you handle division by zero in aggregation calculations?
17. When would you use ROLLUP and CUBE in GROUP BY operations?
18. How do you calculate percentages across groups?
19. What is a window function and how does it differ from regular aggregation?
20. Explain the OVER clause in window functions.

## Subqueries and CTEs
21. What is the difference between a CTE and a subquery?
22. What are correlated subqueries and when would you use them?
23. What is the performance implication of using a subquery in the SELECT list?
24. When would you use a CTE instead of a temporary table?
25. What are recursive CTEs and what problems do they solve?
26. What is the difference between an inline view and a derived table?
27. How do scalar subqueries differ from table subqueries?
28. What happens when a subquery returns multiple rows in a context expecting a single value?
29. How do EXISTS and IN operators differ in subqueries?
30. What are the limitations of CTEs compared to temporary tables?

## Data Types and Functions
31. How do CHAR and VARCHAR data types differ?
32. What is the difference between DATETIME and TIMESTAMP?
33. How would you choose between storing monetary values as DECIMAL vs FLOAT?
34. What are the performance implications of using functions in WHERE clauses?
35. What is the difference between UNION and UNION ALL?
36. How do LEAD and LAG window functions work?
37. What is the difference between ROW_NUMBER, RANK, and DENSE_RANK?
38. How would you handle time zone conversions in SQL?
39. What is the purpose of CAST and CONVERT functions?
40. How do you efficiently parse and manipulate JSON data in SQL?

## Performance and Optimization
41. What is an index and how does it improve query performance?
42. What's the difference between clustered and non-clustered indexes?
43. How does the query execution plan work?
44. What is query normalization and why is it important?
45. How does the database optimizer choose between different execution plans?
46. What is a table partition and how does it improve performance?
47. How do you identify and resolve SQL query bottlenecks?
48. What is the impact of DISTINCT on query performance?
49. When would you use materialized views versus regular views?
50. What strategies would you use to optimize queries against large tables with millions of rows?
